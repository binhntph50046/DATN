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
        return [
            'name' => 'required|string|max:255',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'status' => 'required|boolean',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.product_variant_id' => 'required|exists:product_variants,id',
            'items.*.discount' => 'required|numeric|min:0',
            'items.*.discount_type' => 'required|in:percent,fixed',
            'items.*.count' => 'required|integer|min:1',
            'items.*.buy_limit' => 'required|integer|min:1',
        ];
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
