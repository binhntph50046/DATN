<?php
namespace App\Http\Requests\admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;  // Adjust based on your authorization logic
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', Rule::unique('products')->ignore($this->product)],
            'description' => ['nullable', 'string'],
            'content' => ['nullable', 'string'],
            'category_id' => ['required', 'exists:categories,id'],
            'warranty_months' => ['required', 'integer', 'min:0'],
            'status' => ['required', Rule::in(['active', 'inactive'])],
            'image' => ['nullable', 'image', 'max:2048'],
            'has_variants' => ['required', 'boolean'],
            // For simple products
            'stock' => ['required_if:has_variants,0', 'integer', 'min:0'],
            'purchase_price' => ['required_if:has_variants,0', 'numeric', 'min:0'],
            'selling_price' => ['required_if:has_variants,0', 'numeric', 'min:0'],
            // For variant products (cross-combination)
            'attribute_values' => ['required_if:has_variants,1', 'array'],
            'attribute_values.*' => ['sometimes', 'array'],
            'attribute_values.*.*' => ['required', 'string', 'max:255'],
            // Product attributes (not used for cross-combination)
            'product_attributes' => ['sometimes', 'array'],
            'product_attributes.*.attribute_type_id' => ['required_with:product_attributes.*.value', 'exists:attribute_types,id'],
            'product_attributes.*.value' => ['required_with:product_attributes.*.attribute_type_id', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'The product name is required.',
            'name.string' => 'The product name must be a string.',
            'name.max' => 'The product name may not be greater than 255 characters.',
            'slug.unique' => 'This slug is already in use.',
            'category_id.required' => 'The category is required.',
            'category_id.exists' => 'The selected category does not exist.',
            'warranty_months.required' => 'The warranty period is required.',
            'warranty_months.integer' => 'The warranty period must be an integer.',
            'warranty_months.min' => 'The warranty period must be at least 0.',
            'status.required' => 'The status is required.',
            'status.in' => 'The status must be either active or inactive.',
            'image.image' => 'The uploaded file must be an image.',
            'image.max' => 'The image may not be greater than 2MB.',
            'has_variants.required' => 'Please specify if the product has variants.',
            'has_variants.boolean' => 'The has variants field must be true or false.',
            'stock.required_if' => 'Stock is required for simple products.',
            'stock.integer' => 'Stock must be an integer.',
            'stock.min' => 'Stock must be at least 0.',
            'purchase_price.required_if' => 'Purchase price is required for simple products.',
            'purchase_price.numeric' => 'Purchase price must be a number.',
            'purchase_price.min' => 'Purchase price must be at least 0.',
            'selling_price.required_if' => 'Selling price is required for simple products.',
            'selling_price.numeric' => 'Selling price must be a number.',
            'selling_price.min' => 'Selling price must be at least 0.',
            'attribute_values.required_if' => 'Attribute values are required for products with variants.',
            'attribute_values.array' => 'Attribute values must be an array.',
            'attribute_values.*.*.required' => 'All attribute values are required.',
            'attribute_values.*.*.string' => 'Attribute values must be strings.',
            'attribute_values.*.*.max' => 'Attribute values may not be greater than 255 characters.',
            'product_attributes.*.attribute_type_id.required_with' => 'The attribute type is required when a value is provided.',
            'product_attributes.*.attribute_type_id.exists' => 'The selected attribute type does not exist.',
            'product_attributes.*.value.required_with' => 'The attribute value is required when a type is selected.',
            'product_attributes.*.value.string' => 'The attribute value must be a string.',
            'product_attributes.*.value.max' => 'The attribute value may not be greater than 255 characters.',
        ];
    }
}
