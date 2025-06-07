<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreAttributeTypeRequest;
use App\Http\Requests\Admin\UpdateAttributeTypeRequest;
use App\Models\VariantAttributeType;
use App\Models\Category;
use App\Models\VariantAttributeValue;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VariantAttributeTypeController
{
    public function index(Request $request)
    {
        $categories = Category::where('type', 1)->get();
        $query = VariantAttributeType::query();
        
        if ($request->filled('category_id')) {
            $query->whereJsonContains('category_ids', $request->category_id);
        }
        
        $attributeTypes = $query->paginate(10);
        return view('admin.attributes.index', compact('attributeTypes', 'categories'));
    }

    public function create()
    {
        $categories = Category::where('type', 1)->get();
        return view('admin.attributes.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
                'unique:variant_attribute_types,name,NULL,id,deleted_at,NULL'
            ],
            'status' => 'required|in:active,inactive',
            'category_ids' => 'required|array',
            'category_ids.*' => 'exists:categories,id'
        ], [
            'name.required' => 'The attribute type name is required.',
            'name.max' => 'The attribute type name must not exceed 255 characters.',
            'name.unique' => 'This attribute type name already exists.',
            'category_ids.required' => 'Please select at least one category.',
            'category_ids.*.exists' => 'One or more selected categories are invalid.'
        ]);

        $attributeType = VariantAttributeType::create($validated);
        
        if ($request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Attribute type created successfully.',
                'attributeType' => $attributeType
            ]);
        }
        
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type created successfully.');
    }

    public function storeValues(Request $request)
    {
        $validated = $request->validate([
            'attribute_type_id' => 'required|exists:variant_attribute_types,id',
            'values' => 'required|array|min:1',
            'values.*.value' => [
                'required',
                'string',
                'max:255',
                function ($attribute, $value, $fail) use ($request) {
                    // Get all values from the current request
                    $currentValues = collect($request->values);
                    
                    // Get the current value's hex color
                    $index = explode('.', $attribute)[1];
                    $currentHexColor = $request->values[$index]['hex_color'] ?? null;
                    
                    // Check for duplicates within the current request
                    $duplicateCount = $currentValues->filter(function ($item) use ($value, $currentHexColor) {
                        return strtolower($item['value']) === strtolower($value) 
                            && ($item['hex_color'] ?? null) === $currentHexColor;
                    })->count();
                    
                    if ($duplicateCount > 1) {
                        $fail('This combination of value and color has been used multiple times in your submission.');
                        return;
                    }

                    // Check for duplicates in the database
                    $exists = VariantAttributeValue::where('attribute_type_id', $request->attribute_type_id)
                        ->where(function ($query) use ($value, $currentHexColor) {
                            $query->whereJsonContains('value', $value)
                                ->where(function ($q) use ($currentHexColor) {
                                    if ($currentHexColor) {
                                        $q->whereJsonContains('hex', $currentHexColor);
                                    } else {
                                        $q->whereNull('hex')
                                          ->orWhere('hex', '[]')
                                          ->orWhere('hex', '[""]');
                                    }
                                });
                        })
                        ->exists();

                    if ($exists) {
                        $fail('This combination of value and color already exists for this attribute type.');
                    }
                }
            ],
            'values.*.hex_color' => 'nullable|string|regex:/^#[0-9A-F]{6}$/i'
        ], [
            'values.required' => 'At least one value is required.',
            'values.min' => 'At least one value is required.',
            'values.*.value.required' => 'The attribute value is required.',
            'values.*.value.max' => 'The attribute value must not exceed 255 characters.',
            'values.*.hex_color.regex' => 'The color must be a valid hex color code (e.g. #FF0000).'
        ]);

        try {
            foreach ($validated['values'] as $value) {
                VariantAttributeValue::create([
                    'attribute_type_id' => $validated['attribute_type_id'],
                    'value' => array_map('trim', explode(',', $value['value'])),
                    'hex' => !empty($value['hex_color']) ? array_map('trim', explode(',', $value['hex_color'])) : [],
                    'status' => 'active'
                ]);
            }

            return response()->json([
                'success' => true,
                'message' => 'Attribute values added successfully.'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error saving attribute values.',
                'errors' => ['general' => [$e->getMessage()]]
            ], 422);
        }
    }

    public function edit(VariantAttributeType $attributeType)
    {
        $categories = Category::where('type', 1)->get();
        $attributeValues = $attributeType->attributeValues()->get();
        return view('admin.attributes.edit', compact('attributeType', 'categories', 'attributeValues'));
    }

    public function update(UpdateAttributeTypeRequest $request, VariantAttributeType $attributeType)
    {
        try {
            DB::beginTransaction();
            
            // Update attribute type details
            $data = $request->only(['name', 'status', 'category_ids']);
            $attributeType->update($data);

            // Get existing value IDs that should be kept
            $existingValueIds = $request->input('existing_values', []);
            
            // Delete values that are not in the existing_values array
            VariantAttributeValue::where('attribute_type_id', $attributeType->id)
                ->whereNotIn('id', $existingValueIds)
                ->delete();

            // Handle attribute values updates
            if ($request->has('values')) {
                $validated = $request->validate([
                    'values' => 'required|array|min:1',
                    'values.*.id' => 'nullable|exists:variant_attribute_values,id',
                    'values.*.value' => [
                        'required',
                        'string',
                        'max:255',
                        function ($attribute, $value, $fail) use ($request, $attributeType) {
                            $index = explode('.', $attribute)[1];
                            $currentHexColor = $request->values[$index]['hex_color'] ?? null;
                            $valueId = $request->values[$index]['id'] ?? null;
                            
                            // Skip validation if hex_color is disabled
                            if (!isset($request->values[$index]['hex_color']) || 
                                $request->values[$index]['hex_color'] === '') {
                                $currentHexColor = null;
                            }
                            
                            // Check for duplicates within submitted values
                            $duplicateCount = collect($request->values)->filter(function ($item) use ($value, $currentHexColor) {
                                $itemHexColor = isset($item['hex_color']) && $item['hex_color'] !== '' ? $item['hex_color'] : null;
                                return strtolower($item['value']) === strtolower($value) 
                                    && $itemHexColor === $currentHexColor;
                            })->count();
                            
                            if ($duplicateCount > 1) {
                                $fail('This combination of value and color has been used multiple times in your submission.');
                                return;
                            }

                            // Check for duplicates in database, excluding current value
                            $exists = VariantAttributeValue::where('attribute_type_id', $attributeType->id)
                                ->where('id', '!=', $valueId)
                                ->where(function ($query) use ($value, $currentHexColor) {
                                    $query->whereJsonContains('value', $value)
                                        ->where(function ($q) use ($currentHexColor) {
                                            if ($currentHexColor) {
                                                $q->whereJsonContains('hex', $currentHexColor);
                                            } else {
                                                $q->whereNull('hex')
                                                  ->orWhere('hex', '[]')
                                                  ->orWhere('hex', '[""]');
                                            }
                                        });
                                })
                                ->exists();

                            if ($exists) {
                                $fail('This combination of value and color already exists for this attribute type.');
                            }
                        }
                    ],
                    'values.*.hex_color' => 'nullable|string|regex:/^#[0-9A-F]{6}$/i'
                ]);

                // Process each value
                foreach ($validated['values'] as $valueData) {
                    $hexColor = isset($valueData['hex_color']) && $valueData['hex_color'] !== '' 
                        ? array_map('trim', explode(',', $valueData['hex_color'])) 
                        : [];

                    if (isset($valueData['id'])) {
                        // Update existing value
                        $attributeValue = VariantAttributeValue::find($valueData['id']);
                        if ($attributeValue) {
                            $attributeValue->update([
                                'value' => array_map('trim', explode(',', $valueData['value'])),
                                'hex' => $hexColor,
                            ]);
                        }
                    } else {
                        // Create new value
                        VariantAttributeValue::create([
                            'attribute_type_id' => $attributeType->id,
                            'value' => array_map('trim', explode(',', $valueData['value'])),
                            'hex' => $hexColor,
                            'status' => 'active'
                        ]);
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.attributes.index')->with('success', 'Attribute type and values updated successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', 'Error updating attribute type: ' . $e->getMessage())->withInput();
        }
    }

    public function destroy(VariantAttributeType $attributeType)
    {
        $attributeType->delete();
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type deleted successfully.');
    }

    public function trash()
    {
        $categories = Category::where('type', 1)->get();
        $attributeTypes = VariantAttributeType::onlyTrashed()->paginate(10);
        return view('admin.attributes.trash', compact('attributeTypes', 'categories'));
    }

    public function restore($id)
    {
        $attributeType = VariantAttributeType::onlyTrashed()->findOrFail($id);
        $attributeType->restore();
        return redirect()->route('admin.attributes.trash')->with('success', 'Attribute type restored successfully.');
    }
}
