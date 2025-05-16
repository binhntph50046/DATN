<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreAttributeTypeRequest;
use App\Http\Requests\Admin\UpdateAttributeTypeRequest;
use App\Models\AttributeType;
use Illuminate\Http\Request;

class VariantAttributeTypeController extends Controller
{
    public function index()
    {
        $attributeTypes = AttributeType::paginate(10);
        return view('admin.attributes.types.index', compact('attributeTypes'));
    }

    public function create()
    {
        return view('admin.attributes.types.create');
    }

    public function store(StoreAttributeTypeRequest $request)
    {
        $data = $request->validated();
        AttributeType::create($data);
        return redirect()->route('admin.attributes.types.index')->with('success', 'Attribute type created successfully.');
    }

    public function edit(AttributeType $attributeType)
    {
        return view('admin.attributes.types.edit', compact('attributeType'));
    }

    public function update(UpdateAttributeTypeRequest $request, AttributeType $attributeType)
    {
        $data = $request->validated();
        $attributeType->update($data);
        return redirect()->route('admin.attributes.types.index')->with('success', 'Attribute type updated successfully.');
    }

    public function destroy(AttributeType $attributeType)
    {
        $attributeType->delete();
        return redirect()->route('admin.attributes.types.index')->with('success', 'Attribute type deleted successfully.');
    }
}
