<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class StoreAttributeTypeRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;  // Adjust based on your authorization logic
    }

    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'category_ids' => 'required|array',
            'category_ids.*' => 'exists:categories,id',
            'status' => 'required|in:active,inactive'
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'The attribute type name is required.',
            'category_ids.required' => 'Please select at least one category.',
            'category_ids.*.exists' => 'One or more selected categories are invalid.',
            'status.required' => 'The status field is required.',
            'status.in' => 'The status must be either active or inactive.'
        ];
    }
}
