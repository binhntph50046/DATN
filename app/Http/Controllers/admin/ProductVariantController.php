<?php

namespace App\Http\Controllers\admin;

use App\Models\ProductVariant;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductVariantController
{
    public function index(Request $request)
    {
        $query = ProductVariant::with(['product', 'attributeValues']);

        if ($request->filled('name')) {
            $query->where('name', 'like', '%' . $request->name . '%');
        }
        if ($request->filled('product_id')) {
            $query->where('product_id', $request->product_id);
        }
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $variants = $query->paginate(20)->appends($request->query());
        $trashCount = ProductVariant::onlyTrashed()->count();
        $products = Product::select('id', 'name')->orderBy('name')->get();
        return view('admin.variants.index', compact('variants', 'trashCount', 'products'));
    }

    public function trash()
    {
        $variants = ProductVariant::onlyTrashed()->with(['product', 'attributeValues'])->paginate(20);
        return view('admin.variants.trash', compact('variants'));
    }

    public function restore($id)
    {
        $variant = ProductVariant::onlyTrashed()->findOrFail($id);
        $variant->restore();
        $variant->combinations()->withTrashed()->restore();
        return redirect()->route('admin.variants.trash')->with('success', 'Khôi phục biến thể thành công!');
    }

    public function update(Request $request, ProductVariant $variant)
    {
        $request->validate([
            'purchase_price' => 'required|numeric|min:0',
            'selling_price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'status' => 'required|in:active,inactive',
            'images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp',
        ]);

        $variant->purchase_price = $request->purchase_price;
        $variant->selling_price = $request->selling_price;
        $variant->stock = $request->stock;
        $variant->status = $request->status;

        // Xử lý ảnh mới nếu có
        if ($request->hasFile('images')) {
            $images = [];
            foreach ($request->file('images') as $img) {
                $filename = time().'_'.uniqid().'_'.$img->getClientOriginalName();
                $img->move(public_path('uploads/products'), $filename);
                $images[] = 'uploads/products/'.$filename;
            }
            $variant->images = $images;
        }
        $variant->save();
        return redirect()->route('admin.variants.index')->with('success', 'Cập nhật biến thể thành công!');
    }

    public function destroy(ProductVariant $variant)
    {
        $variant->combinations()->delete();
        $variant->delete();
        return redirect()->route('admin.variants.index')->with('success', 'Đã xóa biến thể thành công!');
    }
} 