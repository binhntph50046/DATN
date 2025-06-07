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
            'warranty_months' => 'required|integer|min:0',
            'description' => 'nullable|string',
            'content' => 'nullable|string',
            'is_featured' => 'boolean',
            
            // Validate specifications
            'specifications' => 'nullable|array',
            'specifications.*.specification_id' => 'required_with:specifications.*.value|exists:specifications,id',
            'specifications.*.value' => 'nullable|string',

            // Validate attributes - simplified
            'attributes' => 'required|array|min:1',
            'attributes.*.attribute_type_id' => 'nullable|exists:variant_attribute_types,id',
            'attributes.*.selected_values' => 'required_with:attributes.*.attribute_type_id|array',

            // Validate variants
            'variants' => 'required|array|min:1',
            'variants.*.name' => 'required|string|max:255',
            'variants.*.slug' => 'required|string|max:255',
            'variants.*.stock' => 'required|integer|min:0',
            'variants.*.purchase_price' => 'required|numeric|min:0',
            'variants.*.selling_price' => 'required|numeric|min:0',
            'variants.*.is_default' => 'boolean',
            'variants.*.images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'variants.*.attributes' => 'required|array',
            'variants.*.attributes.*.attribute_type_id' => 'required|exists:variant_attribute_types,id',
            'variants.*.attributes.*.selected_values' => 'required'
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Tên sản phẩm là bắt buộc.',
            'name.unique' => 'Tên sản phẩm đã tồn tại.',
            'category_id.required' => 'Vui lòng chọn danh mục.',
            'category_id.exists' => 'Danh mục không hợp lệ.',
            'warranty_months.integer' => 'Thời gian bảo hành phải là số nguyên.',
            'views.integer' => 'Lượt xem phải là số nguyên.',
            'views.in' => 'Lượt xem phải là 0 cho sản phẩm mới.',
            
            'attributes.required' => 'Phải có ít nhất một thuộc tính.',
            'attributes.min' => 'Phải có ít nhất một thuộc tính.',
            'attributes.*.attribute_type_id.required' => 'Loại thuộc tính là bắt buộc.',
            'attributes.*.attribute_type_id.exists' => 'Loại thuộc tính không hợp lệ.',
            
            'variants.required' => 'Phải có ít nhất một biến thể.',
            'variants.*.name.required' => 'Tên biến thể là bắt buộc.',
            'variants.*.stock.required' => 'Số lượng tồn kho là bắt buộc.',
            'variants.*.stock.min' => 'Số lượng tồn kho không được âm.',
            'variants.*.purchase_price.required' => 'Giá nhập là bắt buộc.',
            'variants.*.purchase_price.min' => 'Giá nhập không được âm.',
            'variants.*.selling_price.required' => 'Giá bán là bắt buộc.',
            'variants.*.selling_price.min' => 'Giá bán không được âm.',
            'variants.*.images.*.image' => 'File phải là hình ảnh.',
            'variants.*.images.*.mimes' => 'Hình ảnh phải có định dạng jpeg, png, hoặc jpg.',
            'variants.*.images.*.max' => 'Kích thước hình ảnh không được vượt quá 2MB.',
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'views' => 0 // Always set views to 0 for new products
        ]);
    }

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            // Kiểm tra không được chọn trùng loại thuộc tính
            $attributes = $this->input('attributes', []);
            $attributeTypeIds = collect($attributes)
                ->pluck('attribute_type_id')
                ->filter()
                ->values();
            
            // Kiểm tra có ít nhất 1 thuộc tính được chọn
            if ($attributeTypeIds->isEmpty()) {
                $validator->errors()->add('attributes', 'Phải chọn ít nhất một thuộc tính.');
                return;
            }

            // Kiểm tra không được chọn trùng loại thuộc tính
            if ($attributeTypeIds->count() !== $attributeTypeIds->unique()->count()) {
                $validator->errors()->add('attributes', 'Không được chọn trùng loại thuộc tính.');
            }
        });
    }
}