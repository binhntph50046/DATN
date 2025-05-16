<?php

namespace App\Http\Requests\admin;

use App\Models\VariantAttributeType;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'slug' => ['required', 'string', 'max:255', Rule::unique('products')],
            'description' => ['nullable', 'string'],
            'content' => ['nullable', 'string'],
            'category_id' => ['required', 'exists:categories,id'],
            'model' => ['nullable', 'string', 'max:255'],
            'series' => ['nullable', 'string', 'max:255'],
            'warranty_months' => ['required', 'integer', 'min:0'],
            'is_featured' => ['nullable', 'boolean'],
            'status' => ['required', Rule::in(['active', 'inactive'])],
            'has_variants' => ['required', 'boolean'],
            'variants' => [
                'required_if:has_variants,1',
                'array',
                function ($attribute, $value, $fail) {
                    if ($this->input('has_variants') == 1) {
                        $defaultCount = 0;
                        foreach ($value as $variant) {
                            if (isset($variant['is_default']) && $variant['is_default'] == 1) {
                                $defaultCount++;
                            }
                        }
                        if ($defaultCount !== 1) {
                            $fail('Exactly one variant must be set as the default.');
                        }
                    }
                },
            ],
            'variants.*.name' => ['required_if:has_variants,1', 'string', 'max:255'],
            'variants.*.slug' => ['required_if:has_variants,1', 'string', 'max:255'],
            'stock' => ['required_if:has_variants,0', 'integer', 'min:0'],
            'purchase_price' => ['required_if:has_variants,0', 'numeric', 'min:0'],
            'selling_price' => ['required_if:has_variants,0', 'numeric', 'min:0'],
            'discount_price' => ['nullable', 'numeric', 'min:0', 'lte:selling_price'],
            'variants.*.stock' => ['required_if:has_variants,1', 'integer', 'min:0'],
            'variants.*.purchase_price' => ['required_if:has_variants,1', 'numeric', 'min:0'],
            'variants.*.selling_price' => ['required_if:has_variants,1', 'numeric', 'min:0'],
            'variants.*.discount_price' => ['nullable', 'numeric', 'min:0', 'lte:variants.*.selling_price'],
            'images' => ['nullable', 'array', 'max:10'],
            'images.*' => ['file', 'mimes:jpeg,png,jpg,gif,webp', 'max:5120'], // 5MB max per file
            'existing_images' => ['nullable', 'array'],
            'existing_images.*' => ['string'],
            'removed_images' => ['nullable', 'array'],
            'removed_images.*' => ['string'],
            'variants.*.is_default' => ['nullable', 'boolean'],
            'variants.*.attributes' => [
                'required',
                'json',
                function ($attribute, $value, $fail) {
                    $attributes = json_decode($value, true);
                    if (json_last_error() !== JSON_ERROR_NONE || !is_array($attributes)) {
                        $fail('The ' . $attribute . ' must be a valid JSON array.');
                        return;
                    }
                    foreach ($attributes as $index => $attr) {
                        if (!isset($attr['attribute_type_id']) || !isset($attr['value'])) {
                            $fail("Each attribute at index {$index} must contain 'attribute_type_id' and 'value'.");
                            return;
                        }
                        if (!is_numeric($attr['attribute_type_id']) || !VariantAttributeType::where('id', $attr['attribute_type_id'])->exists()) {
                            $fail("The attribute_type_id at index {$index} is invalid.");
                        }
                        if (!is_string($attr['value']) || strlen($attr['value']) > 255) {
                            $fail("The value at index {$index} must be a string and not exceed 255 characters.");
                        }
                        if (isset($attr['hex']) && !is_null($attr['hex']) && !preg_match('/^#[0-9A-Fa-f]{6}$/', $attr['hex'])) {
                            $fail("The hex code at index {$index} must be a valid color code (e.g., #FFFFFF).");
                        }
                    }
                },
            ],
            'attribute_values' => ['required_if:has_variants,1', 'array'],
            'attribute_values.*.attribute_type_id' => ['required', 'exists:variant_attribute_types,id'],
            'attribute_values.*.values' => ['required', 'string'],
            'attribute_values.*.hex' => ['nullable', 'string'],
            'product_attributes' => ['nullable', 'array'],
            'product_attributes.*.attribute_type_id' => ['required_with:product_attributes.*.value', 'exists:variant_attribute_types,id'],
            'product_attributes.*.value' => ['required_with:product_attributes.*.attribute_type_id', 'string', 'max:255'],
            'product_attributes.*.hex' => ['nullable', 'string', 'max:7', 'regex:/^#[0-9A-Fa-f]{6}$/'],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'The product name is required.',
            'name.string' => 'The product name must be a string.',
            'name.max' => 'The product name may not exceed 255 characters.',
            'slug.required' => 'The slug is required.',
            'slug.unique' => 'This slug is already in use.',
            'slug.string' => 'The slug must be a string.',
            'slug.max' => 'The slug may not exceed 255 characters.',
            'category_id.required' => 'The category is required.',
            'category_id.exists' => 'The selected category does not exist.',
            'model.string' => 'The model must be a string.',
            'model.max' => 'The model may not exceed 255 characters.',
            'series.string' => 'The series must be a string.',
            'series.max' => 'The series may not exceed 255 characters.',
            'warranty_months.required' => 'The warranty period is required.',
            'warranty_months.integer' => 'The warranty period must be an integer.',
            'warranty_months.min' => 'The warranty period must be at least 0.',
            'is_featured.boolean' => 'The featured status must be true or false.',
            'status.required' => 'The status is required.',
            'status.in' => 'The status must be either active or inactive.',
            'has_variants.required' => 'Please specify if the product has variants.',
            'has_variants.boolean' => 'The has_variants field must be true or false.',
            'variants.required_if' => 'Variants are required for products with variants.',
            'variants.*.name.required_if' => 'The variant name is required when product has variants.',
            'variants.*.name.string' => 'The variant name must be a string.',
            'variants.*.name.max' => 'The variant name may not exceed 255 characters.',
            'variants.*.slug.required_if' => 'The variant slug is required when product has variants.',
            'variants.*.slug.string' => 'The variant slug must be a string.',
            'variants.*.slug.max' => 'The variant slug may not exceed 255 characters.',
            'stock.required_if' => 'Stock is required for simple products.',
            'stock.integer' => 'Stock must be an integer.',
            'stock.min' => 'Stock must be at least 0.',
            'purchase_price.required_if' => 'Purchase price is required for simple products.',
            'purchase_price.numeric' => 'Purchase price must be a number.',
            'purchase_price.min' => 'Purchase price must be at least 0.',
            'selling_price.required_if' => 'Selling price is required for simple products.',
            'selling_price.numeric' => 'Selling price must be a number.',
            'selling_price.min' => 'Selling price must be at least 0.',
            'discount_price.numeric' => 'Discount price must be a number.',
            'discount_price.min' => 'Discount price must be at least 0.',
            'discount_price.lte' => 'Discount price must not exceed selling price.',
            'variants.*.stock.required_if' => 'Stock is required for each variant.',
            'variants.*.stock.integer' => 'Variant stock must be an integer.',
            'variants.*.stock.min' => 'Variant stock must be at least 0.',
            'variants.*.purchase_price.required_if' => 'Purchase price is required for each variant.',
            'variants.*.purchase_price.numeric' => 'Variant purchase price must be a number.',
            'variants.*.purchase_price.min' => 'Variant purchase price must be at least 0.',
            'variants.*.selling_price.required_if' => 'Selling price is required for each variant.',
            'variants.*.selling_price.numeric' => 'Variant selling price must be a number.',
            'variants.*.selling_price.min' => 'Variant selling price must be at least 0.',
            'variants.*.discount_price.numeric' => 'Variant discount price must be a number.',
            'variants.*.discount_price.min' => 'Variant discount price must be at least 0.',
            'variants.*.discount_price.lte' => 'Variant discount price must not exceed selling price.',
            'variants.*.images.array' => 'Variant files must be an array.',
            'variants.*.images.max' => 'Each variant may not have more than 5 files.',
            'variants.*.images.*.file' => 'Each variant file must be a valid file.',
            'images.array' => 'The images must be an array of files.',
            'images.max' => 'You cannot upload more than 10 images.',
            'images.*.file' => 'Each file must be a valid image file.',
            'images.*.mimes' => 'Only JPG, PNG, GIF, and WebP files are allowed.',
            'images.*.max' => 'Each image may not be larger than 5MB.',
            'variants.*.is_default.boolean' => 'The default variant flag must be true or false.',
            'variants.*.attributes.required' => 'Attributes are required for each variant.',
            'variants.*.attributes.json' => 'Attributes must be a valid JSON string.',
            'attribute_values.required_if' => 'Variant attributes are required for products with variants.',
            'attribute_values.*.attribute_type_id.required' => 'The attribute type is required.',
            'attribute_values.*.attribute_type_id.exists' => 'The selected attribute type does not exist.',
            'attribute_values.*.values.required' => 'Attribute values are required.',
            'attribute_values.*.values.string' => 'Attribute values must be a string.',
            'attribute_values.*.hex.string' => 'Hex codes must be a string.',
            'product_attributes.*.attribute_type_id.required_with' => 'The attribute type is required when a value is provided.',
            'product_attributes.*.attribute_type_id.exists' => 'The selected attribute type does not exist.',
            'product_attributes.*.value.required_with' => 'The attribute value is required when an attribute type is selected.',
            'product_attributes.*.value.string' => 'The attribute value must be a string.',
            'product_attributes.*.value.max' => 'The attribute value may not exceed 255 characters.',
            'product_attributes.*.hex.string' => 'The hex code must be a string.',
            'product_attributes.*.hex.max' => 'The hex code may not exceed 7 characters.',
            'product_attributes.*.hex.regex' => 'The hex code must be a valid color code (e.g., #FFFFFF).',
        ];
    }
}
