<?php

namespace App\Http\Controllers\admin;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
// Illuminate\Support\Facades\Storage; // Bị loại bỏ vì không còn dùng cho ảnh sản phẩm

class ProductController
{
    public function index()
    {
        $products = Product::with('category')->latest()->paginate(10);
        return view('admin.products.index', compact('products'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.products.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'content' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'discount_price' => 'nullable|numeric|min:0',
            'category_id' => 'required|exists:categories,id',
            'model' => 'nullable|string|max:100',
            'series' => 'nullable|string|max:100',
            'stock' => 'required|integer|min:0',
            'warranty_months' => 'required|integer|min:0',
            'is_featured' => 'boolean',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'specifications' => 'nullable|array',
            'specifications.keys.*' => 'nullable|string',
            'specifications.values.*' => 'nullable|string',
            'features' => 'nullable|array',
            'features.*' => 'nullable|string',
        ], [
            'name.required' => 'Product name is required.',
            'name.max' => 'Product name cannot exceed 255 characters.',
            'price.required' => 'Price is required.',
            'price.numeric' => 'Price must be a number.',
            'price.min' => 'Price cannot be negative.',
            'discount_price.numeric' => 'Discount price must be a number.',
            'discount_price.min' => 'Discount price cannot be negative.',
            'category_id.required' => 'Please select a category.',
            'category_id.exists' => 'Selected category is invalid.',
            'model.max' => 'Model name cannot exceed 100 characters.',
            'series.max' => 'Series name cannot exceed 100 characters.',
            'stock.required' => 'Stock quantity is required.',
            'stock.integer' => 'Stock must be a whole number.',
            'stock.min' => 'Stock cannot be negative.',
            'warranty_months.required' => 'Warranty period is required.',
            'warranty_months.integer' => 'Warranty period must be a whole number.',
            'warranty_months.min' => 'Warranty period cannot be negative.',
            'status.required' => 'Product status is required.',
            'status.in' => 'Invalid product status.',
            'image.image' => 'The file must be an image.',
            'image.mimes' => 'The image must be a file of type: jpeg, png, jpg, gif.',
            'image.max' => 'The image size cannot exceed 2MB.',
            'specifications.array' => 'Specifications must be in the correct format.',
            'specifications.keys.*.string' => 'Specification names must be text.',
            'specifications.values.*.string' => 'Specification values must be text.',
            'features.array' => 'Features must be in the correct format.',
            'features.*.string' => 'Features must be text.',
        ]);

        $data = $request->all();
        $data['slug'] = Str::slug($request->name);

        // Process specifications
        if (isset($data['specifications'])) {
            $specifications = [];
            if (isset($data['specifications']['keys']) && isset($data['specifications']['values'])) {
                foreach ($data['specifications']['keys'] as $index => $key) {
                    if (!empty($key) && isset($data['specifications']['values'][$index])) {
                        $specifications[] = [
                            'key' => $key,
                            'value' => $data['specifications']['values'][$index]
                        ];
                    }
                }
            }
            $data['specifications'] = $specifications;
        }

        // Process features
        if (isset($data['features'])) {
            $data['features'] = array_filter($data['features'], function($feature) {
                return !empty($feature);
            });
        }

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/products');
            $image->move($destinationPath, $imageName);
            $data['image'] = 'uploads/products/' . $imageName;
        }

        Product::create($data);

        return redirect()->route('admin.products.index')
            ->with('success', 'Sản phẩm đã được tạo thành công.');
    }

    public function edit(Product $product)
    {
        $categories = Category::all();
        return view('admin.products.edit', compact('product', 'categories'));
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'content' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'discount_price' => 'nullable|numeric|min:0',
            'category_id' => 'required|exists:categories,id',
            'model' => 'nullable|string|max:100',
            'series' => 'nullable|string|max:100',
            'stock' => 'required|integer|min:0',
            'warranty_months' => 'required|integer|min:0',
            'is_featured' => 'boolean',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'specifications' => 'nullable|array',
            'specifications.keys.*' => 'nullable|string',
            'specifications.values.*' => 'nullable|string',
            'features' => 'nullable|array',
            'features.*' => 'nullable|string',
        ], [
            'name.required' => 'Product name is required.',
            'name.max' => 'Product name cannot exceed 255 characters.',
            'price.required' => 'Price is required.',
            'price.numeric' => 'Price must be a number.',
            'price.min' => 'Price cannot be negative.',
            'discount_price.numeric' => 'Discount price must be a number.',
            'discount_price.min' => 'Discount price cannot be negative.',
            'category_id.required' => 'Please select a category.',
            'category_id.exists' => 'Selected category is invalid.',
            'model.max' => 'Model name cannot exceed 100 characters.',
            'series.max' => 'Series name cannot exceed 100 characters.',
            'stock.required' => 'Stock quantity is required.',
            'stock.integer' => 'Stock must be a whole number.',
            'stock.min' => 'Stock cannot be negative.',
            'warranty_months.required' => 'Warranty period is required.',
            'warranty_months.integer' => 'Warranty period must be a whole number.',
            'warranty_months.min' => 'Warranty period cannot be negative.',
            'status.required' => 'Product status is required.',
            'status.in' => 'Invalid product status.',
            'image.image' => 'The file must be an image.',
            'image.mimes' => 'The image must be a file of type: jpeg, png, jpg, gif.',
            'image.max' => 'The image size cannot exceed 2MB.',
            'specifications.array' => 'Specifications must be in the correct format.',
            'specifications.keys.*.string' => 'Specification names must be text.',
            'specifications.values.*.string' => 'Specification values must be text.',
            'features.array' => 'Features must be in the correct format.',
            'features.*.string' => 'Features must be text.',
        ]);

        $data = $request->all();
        $data['slug'] = Str::slug($request->name);

        // Process specifications
        if (isset($data['specifications'])) {
            $specifications = [];
            if (isset($data['specifications']['keys']) && isset($data['specifications']['values'])) {
                foreach ($data['specifications']['keys'] as $index => $key) {
                    if (!empty($key) && isset($data['specifications']['values'][$index])) {
                        $specifications[] = [
                            'key' => $key,
                            'value' => $data['specifications']['values'][$index]
                        ];
                    }
                }
            }
            $data['specifications'] = $specifications;
        }

        // Process features
        if (isset($data['features'])) {
            $data['features'] = array_filter($data['features'], function($feature) {
                return !empty($feature);
            });
        }

        if ($request->hasFile('image')) {
            // Delete old image if it exists
            if ($product->image) {
                $oldImagePath = public_path($product->image);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/products');
            $image->move($destinationPath, $imageName);
            $data['image'] = 'uploads/products/' . $imageName;
        }

        $product->update($data);

        return redirect()->route('admin.products.index')
            ->with('success', 'Sản phẩm đã được cập nhật thành công.');
    }

    public function destroy(Product $product)
    {
        if ($product->image) {
            $imagePath = public_path($product->image);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }

        $product->delete();

        return redirect()->route('admin.products.index')
            ->with('success', 'Sản phẩm đã được xóa thành công.');
    }
}
