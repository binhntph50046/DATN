<?php
namespace App\Http\Requests\admin;

use App\Models\VariantAttributeType;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $productId = $this->route('product') ? $this->route('product')->id : null;
        $variantIds = $this->route('product') ? $this->route('product')->variants->pluck('id')->toArray() : [];
        $variantsToDelete = $this->input('variants_to_delete', []);
        if (is_string($variantsToDelete)) {
            $variantsToDelete = json_decode($variantsToDelete, true) ?: [];
        }

        return [
            'name' => [
                'required', 
                'string', 
                'max:255',
                Rule::unique('products', 'name')->ignore($productId),
            ],
            'slug' => [
                'nullable', 
                'string', 
                'max:255',
                Rule::unique('products', 'slug')->ignore($productId),
            ],
            'description' => ['nullable', 'string'],
            'content' => ['nullable', 'string'],
            'category_id' => ['required', 'exists:categories,id'],
            'warranty_months' => ['required', 'integer', 'min:0'],
            'is_featured' => ['nullable', 'boolean'],
            'status' => ['required', Rule::in(['active', 'inactive'])],
            'views' => ['nullable', 'integer', 'min:0'],
            'specifications' => ['nullable', 'array'],
            'specifications.*.specification_id' => ['required', 'exists:specifications,id'],
            'specifications.*.value' => ['required', 'string', 'max:255'],
            'attributes' => ['required', 'array', 'min:1'],
            'attributes.*.attribute_type_id' => [
                function ($attribute, $value, $fail) {
                    $index = (int) filter_var($attribute, FILTER_SANITIZE_NUMBER_INT);
                    $selectedValues = request()->input("attributes.{$index}.selected_values");
                    if ($index === 0 && empty($value)) {
                        $fail('Please select attribute type.');
                    }
                    if ($index === 0 && empty($selectedValues)) {
                        $fail('Please select at least one attribute value.');
                    }
                    // Attribute 2 is only required if attribute type is selected
                    if ($index === 1 && $value && empty($selectedValues)) {
                        $fail('Please select at least one attribute value.');
                    }
                }
            ],
            'attributes.*.selected_values' => ['required_with:attributes.*.attribute_type_id', 'array'],
            'attributes.*.selected_values.*' => ['exists:variant_attribute_values,id'],
            'variants' => [
                'required',
                'array',
                'min:1',
                function ($attribute, $value, $fail) use ($variantIds, $variantsToDelete) {
                    $defaultCount = 0;
                    $names = [];
                    foreach ($value as $variant) {
                        if (isset($variant['is_default']) && $variant['is_default'] == 1) {
                            $defaultCount++;
                        }
                        
                        // Check for duplicate variant name
                        if (isset($variant['name'])) {
                            $variantId = $variant['id'] ?? null;
                            // If it's a new variant or variant not in delete list
                            if (!$variantId || !in_array($variantId, $variantsToDelete)) {
                                if (in_array($variant['name'], $names)) {
                                    $fail('Variant name cannot be duplicated.');
                                    return;
                                }
                                $names[] = $variant['name'];
                            }
                        }
                    }
                    if ($defaultCount !== 1) {
                        $fail('Exactly one default variant is required.');
                    }
                },
            ],
            'variants.*.id' => ['nullable', 'exists:product_variants,id'],
            'variants.*.name' => [
                'required', 
                'string', 
                'max:255',
                function ($attribute, $value, $fail) use ($variantIds, $variantsToDelete) {
                    $variantId = $this->input(str_replace('.name', '.id', $attribute));
                    // If it's a new variant or variant not in delete list
                    if (!$variantId || !in_array($variantId, $variantsToDelete)) {
                        $exists = \App\Models\ProductVariant::where('name', $value)
                            ->whereNotIn('id', array_merge($variantIds, $variantsToDelete))
                            ->exists();
                        if ($exists) {
                            $fail('Variant name already exists.');
                        }
                    }
                }
            ],
            'variants.*.slug' => [
                'required', 
                'string', 
                'max:255',
                function ($attribute, $value, $fail) use ($variantIds, $variantsToDelete) {
                    $variantId = $this->input(str_replace('.slug', '.id', $attribute));
                    // If it's a new variant or variant not in delete list
                    if (!$variantId || !in_array($variantId, $variantsToDelete)) {
                        $exists = \App\Models\ProductVariant::where('slug', $value)
                            ->whereNotIn('id', array_merge($variantIds, $variantsToDelete))
                            ->exists();
                        if ($exists) {
                            $fail('Slug variant already exists.');
                        }
                    }
                }
            ],
            'variants.*.stock' => ['required', 'integer', 'min:0'],
            'variants.*.purchase_price' => ['required', 'numeric', 'min:0'],
            'variants.*.selling_price' => ['required', 'numeric', 'min:0'],
            'variants.*.is_default' => ['nullable', 'boolean'],
            'variants.*.images' => ['nullable', 'array'],
            'variants.*.images.*' => ['image', 'mimes:jpeg,png,jpg,gif,webp', 'max:2048'],
            'variants_to_delete' => ['nullable', 'array'],
            'variants_to_delete.*' => ['exists:product_variants,id'],
            'images_to_delete' => ['nullable', 'array'],
            'images_to_delete.*' => ['string'],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Please enter product name.',
            'name.max' => 'Product name cannot exceed 255 characters.',
            'name.unique' => 'Product name already exists.',
            'slug.unique' => 'Slug product already exists.',
            'category_id.required' => 'Please select a category.',
            'category_id.exists' => 'Invalid category.',
            'warranty_months.required' => 'Please enter warranty period.',
            'warranty_months.min' => 'Warranty period must be greater than or equal to 0.',
            'status.required' => 'Product status is required.',
            'status.in' => 'Invalid status.',
            'views.integer' => 'Views must be an integer.',
            'views.min' => 'Views cannot be negative.',
            'specifications.*.specification_id.required' => 'Please select specification.',
            'specifications.*.specification_id.exists' => 'Invalid specification.',
            'specifications.*.value.required' => 'Please enter specification value.',
            'specifications.*.value.max' => 'Specification value cannot exceed 255 characters.',
            'attributes.required' => 'At least one attribute is required to create variants.',
            'attributes.min' => 'At least one attribute is required to create variants.',
            'attributes.*.selected_values.required_with' => 'Please select at least one value for each attribute type.',
            'attributes.*.selected_values.*.exists' => 'Invalid attribute value selected.',
            'variants.required' => 'At least one variant is required.',
            'variants.min' => 'At least one variant is required.',
            'variants.*.name.required' => 'Please enter variant name.',
            'variants.*.name.max' => 'Variant name cannot exceed 255 characters.',
            'variants.*.name.unique' => 'Variant name already exists.',
            'variants.*.slug.unique' => 'Slug variant already exists.',
            'variants.*.stock.required' => 'Please enter stock quantity.',
            'variants.*.stock.min' => 'Stock quantity must be greater than or equal to 0.',
            'variants.*.purchase_price.required' => 'Please enter purchase price.',
            'variants.*.purchase_price.min' => 'Purchase price must be greater than or equal to 0.',
            'variants.*.selling_price.required' => 'Please enter selling price.',
            'variants.*.selling_price.min' => 'Selling price must be greater than or equal to 0.',
            'variants.*.images.*.image' => 'File must be an image.',
            'variants.*.images.*.mimes' => 'Image must be in jpeg, png, jpg, gif, webp format.',
            'variants.*.images.*.max' => 'Image size must not exceed 2MB.',
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
                if (!empty($attribute['attribute_type_id']) && !empty($attribute['selected_values'])) {
                    $validAttributes++;
                }
            }
            if ($validAttributes < 1) {
                $validator->errors()->add('attributes', 'At least one attribute with complete information is required.');
            }
            // Check second attribute if exists
            if (isset($attributes[1])) {
                $attr1 = $attributes[1];
                // If attribute_type_id exists, selected_values must exist
                if (!empty($attr1['attribute_type_id']) && empty($attr1['selected_values'])) {
                    $validator->errors()->add('attributes.1.selected_values', 'Please select at least one value for attribute 2.');
                }
                // If selected_values exists, attribute_type_id must exist
                if (!empty($attr1['selected_values']) && empty($attr1['attribute_type_id'])) {
                    $validator->errors()->add('attributes.1.attribute_type_id', 'Attribute 2 type is required when values are selected.');
                }
            }
            // Check first attribute if exists
            if (isset($attributes[0])) {
                $attr0 = $attributes[0];
                if (!empty($attr0['attribute_type_id']) && empty($attr0['selected_values'])) {
                    $validator->errors()->add('attributes.0.selected_values', 'Please select at least one value for attribute 1.');
                }
                if (!empty($attr0['selected_values']) && empty($attr0['attribute_type_id'])) {
                    $validator->errors()->add('attributes.0.attribute_type_id', 'Attribute 1 type is required when values are selected.');
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
            if (empty($attribute['attribute_type_id']) && empty($attribute['selected_values'])) {
                // If both are empty, set to null
                $attributes[$key]['attribute_type_id'] = null;
                $attributes[$key]['selected_values'] = null;
            }
        }
        
        $this->merge(['attributes' => $attributes]);
    }
}
