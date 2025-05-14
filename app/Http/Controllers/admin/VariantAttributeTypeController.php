<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreAttributeTypeRequest;
use App\Http\Requests\Admin\UpdateAttributeTypeRequest;
use App\Models\VariantAttributeType;
use Illuminate\Http\Request;

class VariantAttributeTypeController
{
    public function index()
    {
        $attributeTypes = VariantAttributeType::paginate(10);
        return view('admin.attributes.index', compact('attributeTypes'));
    }

    public function create()
    {
        return view('admin.attributes.create');
    }

    public function store(StoreAttributeTypeRequest $request)
    {
        $data = $request->validated();
        VariantAttributeType::create($data);
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type created successfully.');
    }

    public function edit(VariantAttributeType $attributeType)
    {
        return view('admin.attributes.edit', compact('attributeType'));
    }

    public function update(UpdateAttributeTypeRequest $request, VariantAttributeType $attributeType)
    {
        $data = $request->validated();
        $attributeType->update($data);
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type updated successfully.');
    }

    public function destroy(VariantAttributeType $attributeType)
    {
        $attributeType->delete();
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type deleted successfully.');
    }

    public function trash()
    {
        $attributeTypes = VariantAttributeType::onlyTrashed()->paginate(10);
        return view('admin.attributes.trash', compact('attributeTypes'));
    }

    public function restore($id)
    {
        $attributeType = VariantAttributeType::onlyTrashed()->findOrFail($id);
        $attributeType->restore();
        return redirect()->route('admin.attributes.trash')->with('success', 'Attribute type restored successfully.');
    }

    public function forceDelete($id)
    {
        $attributeType = VariantAttributeType::onlyTrashed()->findOrFail($id);
        $attributeType->forceDelete();
        return redirect()->route('admin.attributes.trash')->with('success', 'Attribute type permanently deleted.');
    }
}
