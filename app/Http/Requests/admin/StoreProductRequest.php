<?php

namespace App\Http\Requests\admin;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255|unique:products,name',
            'category_id' => 'required|exists:categories,id',
            'warranty_months' => 'nullable|integer|min:0',
            'description' => 'nullable|string',
            'content' => 'nullable|string',
            'is_featured' => 'nullable|boolean',
            'specifications' => 'nullable|array',
            'specifications.*.specification_id' => 'required_with:specifications.*.value|exists:specifications,id',
            'specifications.*.value' => 'nullable|string|max:255',
            
            // Updated attributes validation - only validate what actually exists
            'attributes' => 'required|array|min:1',
            'attributes.0.attribute_type_id' => 'nullable|exists:variant_attribute_types,id',
            'attributes.0.value' => 'nullable|string|max:255',
            'attributes.0.hex' => 'nullable|string',
            'attributes.1.attribute_type_id' => 'nullable|exists:variant_attribute_types,id|different:attributes.0.attribute_type_id',
            'attributes.1.value' => 'nullable|string|max:255',
            'attributes.1.hex' => 'nullable|string',
            
            'variants' => 'nullable|array',
            'variants.*.name' => 'required_with:variants|string|max:255',
            'variants.*.stock' => 'required_with:variants|integer|min:0',
            'variants.*.purchase_price' => 'required_with:variants|numeric|min:0',
            'variants.*.selling_price' => 'required_with:variants|numeric|min:0',
            'variants.*.images' => 'nullable|array',
            'variants.*.images.*' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'variants.*.is_default' => 'nullable|boolean',
            'variants.*.attributes' => 'nullable|array',
            'variants.*.attributes.*.attribute_type_id' => 'required_with:variants.*.attributes.*.value|exists:variant_attribute_types,id',
            'variants.*.attributes.*.value' => 'required_with:variants.*.attributes.*.attribute_type_id|string|max:255',
            'variants.*.attributes.*.hex' => 'nullable|string',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Product name is required.',
            'name.unique' => 'Product name already exists.',
            'category_id.required' => 'Please select a category.',
            'category_id.exists' => 'Invalid category.',
            'warranty_months.integer' => 'Warranty period must be an integer.',
            'specifications.*.specification_id.required_with' => 'Specification ID is required when value is provided.',
            'specifications.*.specification_id.exists' => 'Invalid specification.',
            'attributes.required' => 'At least one attribute is required to create variants.',
            'attributes.0.attribute_type_id.required' => 'Attribute 1 is required.',
            'attributes.0.attribute_type_id.exists' => 'Invalid attribute 1.',
            'attributes.0.value.required' => 'Attribute 1 value is required.',
            'attributes.0.hex.regex' => 'Invalid hex color code for attribute 1.',
            'attributes.1.attribute_type_id.exists' => 'Invalid attribute 2.',
            'attributes.1.attribute_type_id.different' => 'Attribute 2 must be different from attribute 1.',
            'attributes.1.value.required_with' => 'Attribute 2 value is required when attribute type is selected.',
            'attributes.1.hex.regex' => 'Invalid hex color code for attribute 2.',
            'variants.*.name.required_with' => 'Variant name is required when variant is provided.',
            'variants.*.stock.required_with' => 'Stock quantity is required when variant is provided.',
            'variants.*.purchase_price.required_with' => 'Purchase price is required when variant is provided.',
            'variants.*.selling_price.required_with' => 'Selling price is required when variant is provided.',
            'variants.*.images.*.image' => 'File must be an image.',
            'variants.*.images.*.mimes' => 'Image must be in jpeg, png, or jpg format.',
            'variants.*.images.*.max' => 'Image size must not exceed 2MB.',
            'variants.*.attributes.*.attribute_type_id.required_with' => 'Variant attribute type is required when value is provided.',
            'variants.*.attributes.*.value.required_with' => 'Variant attribute value is required when attribute type is selected.',
            'variants.*.attributes.*.hex.regex' => 'Invalid hex color code for variant.',
        ];
    }

    // Custom validation to ensure business logic
    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $attributes = $this->input('attributes', []);
            // Check at least one attribute has complete information
            $validAttributes = 0;
            foreach ($attributes as $key => $attribute) {
                if (!empty($attribute['attribute_type_id']) && !empty($attribute['value'])) {
                    $validAttributes++;
                }
            }
            if ($validAttributes < 1) {
                $validator->errors()->add('attributes', 'At least one attribute with complete information is required.');
            }
            // Check second attribute if exists
            if (isset($attributes[1])) {
                $attr1 = $attributes[1];
                // If attribute_type_id exists, value must exist
                if (!empty($attr1['attribute_type_id']) && empty($attr1['value'])) {
                    $validator->errors()->add('attributes.1.value', 'Attribute 2 value is required when attribute type is selected.');
                }
                // If value exists, attribute_type_id must exist
                if (!empty($attr1['value']) && empty($attr1['attribute_type_id'])) {
                    $validator->errors()->add('attributes.1.attribute_type_id', 'Attribute 2 type is required when value is provided.');
                }
            }
            // Check first attribute if exists
            if (isset($attributes[0])) {
                $attr0 = $attributes[0];
                if (!empty($attr0['attribute_type_id']) && empty($attr0['value'])) {
                    $validator->errors()->add('attributes.0.value', 'Attribute 1 value is required when attribute type is selected.');
                }
                if (!empty($attr0['value']) && empty($attr0['attribute_type_id'])) {
                    $validator->errors()->add('attributes.0.attribute_type_id', 'Attribute 1 type is required when value is provided.');
                }
            }
            // Custom validate hex for each attribute (allow multiple hex codes separated by commas)
            foreach ([0, 1] as $idx) {
                if (!empty($attributes[$idx]['hex'])) {
                    $hexes = array_map('trim', explode(',', $attributes[$idx]['hex']));
                    foreach ($hexes as $hex) {
                        if ($hex !== '' && !preg_match('/^#[0-9A-Fa-f]{6}$/', $hex)) {
                            $validator->errors()->add("attributes.$idx.hex", "Invalid hex color code for attribute " . ($idx+1) . ": $hex");
                        }
                    }
                }
            }
        });
    }

    // Override prepareForValidation to clean data before validation
    protected function prepareForValidation()
    {
        $attributes = $this->input('attributes', []);
        
        // Clean empty attributes
        foreach ($attributes as $key => $attribute) {
            if (empty($attribute['attribute_type_id']) && empty($attribute['value'])) {
                // If both are empty, set to null
                $attributes[$key]['attribute_type_id'] = null;
                $attributes[$key]['value'] = null;
                $attributes[$key]['hex'] = null;
            } else {
                // Ensure value is string
                if (isset($attribute['value'])) {
                    $attributes[$key]['value'] = (string) $attribute['value'];
                }
                if (isset($attribute['hex'])) {
                    $attributes[$key]['hex'] = (string) $attribute['hex'];
                }
            }
        }
        
        $this->merge(['attributes' => $attributes]);
    }
}