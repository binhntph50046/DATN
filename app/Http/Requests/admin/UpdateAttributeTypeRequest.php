<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateAttributeTypeRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;  // Adjust based on your authorization logic
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255', Rule::unique('variant_attribute_types')->ignore($this->attributeType)],
            'status' => ['required', Rule::in(['active', 'inactive'])],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'The attribute type name is required.',
            'name.string' => 'The attribute type name must be a string.',
            'name.max' => 'The attribute type name may not be greater than 255 characters.',
            'name.unique' => 'This attribute type name already exists.',
            'status.required' => 'The status is required.',
            'status.in' => 'The status must be either active or inactive.',
        ];
    }
}
