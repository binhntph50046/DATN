<?php

namespace App\Http\Requests\Admin;

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

        return [
            'name' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255'],
            'description' => ['nullable', 'string'],
            'content' => ['nullable', 'string'],
            'category_id' => ['required', 'exists:categories,id'],
            'warranty_months' => ['required', 'integer', 'min:0'],
            'is_featured' => ['boolean'],
            'status' => ['required', 'in:active,inactive'],
            'image' => ['nullable', 'image', 'max:2048'],
            'variants' => [
                'required',
                'array',
                function ($attribute, $value, $fail) {
                    $defaultCount = 0;
                    foreach ($value as $variant) {
                        if (isset($variant['is_default']) && $variant['is_default'] == 1) {
                            $defaultCount++;
                        }
                    }
                    if ($defaultCount !== 1) {
                        $fail('Exactly one variant must be set as the default.');
                    }
                },
            ],
            'variants.*.name' => ['required', 'string', 'max:255'],
            'variants.*.slug' => ['required', 'string', 'max:255'],
            'variants.*.stock' => ['required', 'integer', 'min:0'],
            'variants.*.purchase_price' => ['required', 'numeric', 'min:0'],
            'variants.*.selling_price' => ['required', 'numeric', 'min:0'],
            'variants.*.discount_price' => ['nullable', 'numeric', 'min:0', 'lte:variants.*.selling_price'],
            'variants.*.image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'],
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
                            $fail("The attribute_type_id at index {$index} is invalid. Please verify the attribute type ID.");
                        }
                        if (!is_string($attr['value']) || strlen($attr['value']) > 255) {
                            $fail("The value at index {$index} must be a string and not exceed 255 characters.");
                        }
                    }
                },
            ],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'The product name is required.',
            'name.string' => 'The product name must be a string.',
            'name.max' => 'The product name may not be greater than 255 characters.',
            'slug.string' => 'The slug must be a string.',
            'slug.max' => 'The slug may not be greater than 255 characters.',
            'description.string' => 'The description must be a string.',
            'content.string' => 'The content must be a string.',
            'category_id.required' => 'Please select a category.',
            'category_id.exists' => 'The selected category is invalid.',
            'warranty_months.required' => 'The warranty period is required.',
            'warranty_months.integer' => 'The warranty period must be an integer.',
            'warranty_months.min' => 'The warranty period must be at least 0.',
            'is_featured.boolean' => 'The featured status must be true or false.',
            'status.required' => 'The status is required.',
            'status.in' => 'The status must be either active or inactive.',
            'image.image' => 'The file must be an image.',
            'image.max' => 'The image may not be greater than 2MB.',
            'variants.required' => 'At least one variant is required.',
            'variants.array' => 'The variants must be an array.',
            'variants.*.name.required' => 'The variant name is required.',
            'variants.*.name.string' => 'The variant name must be a string.',
            'variants.*.name.max' => 'The variant name may not be greater than 255 characters.',
            'variants.*.slug.required' => 'The variant slug is required.',
            'variants.*.slug.string' => 'The variant slug must be a string.',
            'variants.*.slug.max' => 'The variant slug may not be greater than 255 characters.',
            'variants.*.stock.required' => 'Stock is required for each variant.',
            'variants.*.stock.integer' => 'Stock must be an integer.',
            'variants.*.stock.min' => 'Stock must be at least 0.',
            'variants.*.purchase_price.required' => 'Purchase price is required for each variant.',
            'variants.*.purchase_price.numeric' => 'Purchase price must be a number.',
            'variants.*.purchase_price.min' => 'Purchase price must be at least 0.',
            'variants.*.selling_price.required' => 'Selling price is required for each variant.',
            'variants.*.selling_price.numeric' => 'Selling price must be a number.',
            'variants.*.selling_price.min' => 'Selling price must be at least 0.',
            'variants.*.discount_price.numeric' => 'Discount price must be a number.',
            'variants.*.discount_price.min' => 'Discount price must be at least 0.',
            'variants.*.discount_price.lte' => 'Discount price must not exceed selling price.',
            'variants.*.image.image' => 'The variant image must be a valid image file.',
            'variants.*.image.mimes' => 'The variant image must be a JPEG, PNG, JPG, or GIF file.',
            'variants.*.image.max' => 'The variant image may not be greater than 2MB.',
            'variants.*.is_default.boolean' => 'The default variant flag must be true or false.',
            'variants.*.attributes.required' => 'Attributes are required for each variant.',
            'variants.*.attributes.json' => 'Attributes must be a valid JSON string.',
        ];
    }
}
