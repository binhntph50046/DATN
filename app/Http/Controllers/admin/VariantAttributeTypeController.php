<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreAttributeTypeRequest;
use App\Http\Requests\Admin\UpdateAttributeTypeRequest;
use App\Models\VariantAttributeType;
use App\Models\Category;
use Illuminate\Http\Request;

class VariantAttributeTypeController
{
    public function index(Request $request)
    {
        $categories = Category::where('type', 1)->get();
        $query = VariantAttributeType::query();
        
        if ($request->filled('category_id')) {
            $query->whereJsonContains('category_ids', $request->category_id);
        }
        
        $attributeTypes = $query->paginate(10);
        return view('admin.attributes.index', compact('attributeTypes', 'categories'));
    }

    public function create()
    {
        $categories = Category::where('type', 1)->get();
        return view('admin.attributes.create', compact('categories'));
    }

    public function store(StoreAttributeTypeRequest $request)
    {
        $data = $request->only(['name', 'status', 'category_ids']);
        VariantAttributeType::create($data);
        return redirect()->route('admin.attributes.index')->with('success', 'Attribute type created successfully.');
    }

    public function edit(VariantAttributeType $attributeType)
    {
        $categories = Category::where('type', 1)->get();
        return view('admin.attributes.edit', compact('attributeType', 'categories'));
    }

    public function update(UpdateAttributeTypeRequest $request, VariantAttributeType $attributeType)
    {
        $data = $request->only(['name', 'status', 'category_ids']);
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
}
