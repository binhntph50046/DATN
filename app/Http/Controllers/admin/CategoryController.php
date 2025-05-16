<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class CategoryController
{
    public function index(Request $request)
    {
        $query = Category::with('children')->whereNull('parent_id');

        if ($request->filled('name')) {
            $query->where('name', 'like', '%' . $request->name . '%');
        }

        if ($request->filled('type')) {
            $query->where('type', $request->type);
        }

        if ($request->filled('category_id')) {
            $query->where('id', $request->category_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $categories = $query->orderBy('order', 'desc')->paginate(10);

        return view('admin.categories.index', compact('categories'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.categories.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:categories,id',
            'type' => 'required|in:1,2',
            'status' => 'required|in:active,inactive'
        ]);

        $data = $request->all();
        $data['slug'] = Str::slug($request->name);

        // Nếu không có danh mục cha (parent_id = null), thì lấy order lớn nhất của danh mục cha
        if (is_null($data['parent_id'])) {
            $maxOrder = Category::whereNull('parent_id')->max('order');  // Lấy giá trị order lớn nhất của các danh mục cha
            $data['order'] = $maxOrder + 1;  // Đặt order của danh mục mới là maxOrder + 1
        } else {
            // Nếu có danh mục cha, thì lấy order của danh mục cha và đặt order của danh mục con
            $parentCategory = Category::find($data['parent_id']);
            $data['order'] = $parentCategory->order;  // Gán order của danh mục con bằng order của danh mục cha
        }

        Category::create($data);

        return redirect()->route('admin.categories.index')
            ->with('success', 'Category created successfully.');
    }

    public function show(string $id)
    {
        //
    }

    public function edit(string $id)
    {
        $category = Category::findOrFail($id);
        $categories = Category::whereNull('parent_id')
            ->where('id', '!=', $id)
            ->get();
        return view('admin.categories.edit', compact('category', 'categories'));
    }

    public function update(Request $request, string $id)
    {
        $category = Category::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:categories,id',
            'type' => 'required|in:1,2',
            'status' => 'required|in:active,inactive'
        ]);

        $data = $request->all();
        $data['slug'] = Str::slug($request->name);

        $category->update($data);

        return redirect()->route('admin.categories.index')
            ->with('success', 'Category updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::findOrFail($id);
        $category->delete();

        return redirect()->route('admin.categories.index')
            ->with('success', 'Category deleted successfully.');
    }

    public function trash()
    {
        $categories = Category::onlyTrashed()->with('parent')->paginate(10);
        return view('admin.categories.trash', compact('categories'));
    }

    public function restore(string $id)
    {
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->restore();
        return redirect()->route('admin.categories.trash')->with('success', 'Category restored successfully.');
    }

    public function forceDelete(string $id)
    {
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->forceDelete();
        return redirect()->route('admin.categories.trash')->with('success', 'Category deleted permanently.');
    }

    public function changeOrder(Request $request)
    {
        $category = Category::find($request->category_id);
        
        if ($request->direction == 'up') {
            $categoryAbove = Category::where('order', '>', $category->order)
                ->orderBy('order', 'asc')
                ->first();
            
            if ($categoryAbove) {
                $tempOrder = $category->order;  
                $category->order = $categoryAbove->order;  
                $categoryAbove->order = $tempOrder; 
                $category->save();
                $categoryAbove->save(); 
            }
        }

        if ($request->direction == 'down') {
            $categoryBelow = Category::where('order', '<', $category->order)
                ->orderBy('order', 'desc')
                ->first();
            
            if ($categoryBelow) {
                $tempOrder = $category->order;  
                $category->order = $categoryBelow->order;  
                $categoryBelow->order = $tempOrder;  
                $category->save();
                $categoryBelow->save();
            }
        }

        return back()->with('success', 'Category order updated successfully!');
    }


}
