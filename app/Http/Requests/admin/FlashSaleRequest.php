<?php
namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class FlashSaleRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // Hoặc kiểm tra quyền nếu cần
    }

    public function rules(): array
    {
        $rules = [
            'name' => 'required|string|max:255|unique:flash_sales,name',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.product_variant_id' => 'required|exists:product_variants,id',
            'items.*.discount' => 'required|numeric|min:0',
            'items.*.discount_type' => 'required|in:percent,fixed',
            'items.*.count' => 'required|integer|min:1',
            'items.*.buy_limit' => 'required|integer|min:1',
        ];
            if ($this->isMethod('post')) {
        // Store: không cần nhận status từ form (set cứng = 0 trong controller)
        }

        if ($this->isMethod('put') || $this->isMethod('patch')) {
            // Update: chỉ cho phép status là 0 hoặc 2
            $rules['status'] = 'required|in:0,2';
        }
            return $rules;
    }

    public function messages(): array
    {
        return [
            'items.required' => 'Vui lòng chọn ít nhất một sản phẩm.',
            'items.*.product_id.required' => 'Sản phẩm là bắt buộc.',
            'items.*.product_variant_id.required' => 'Biến thể là bắt buộc.',
            'items.*.discount.required' => 'Giá khuyến mãi là bắt buộc.',
        ];
    }
}
