<?php

namespace App\Http\Controllers\admin;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
// Illuminate\Support\Facades\Storage; // Bị loại bỏ vì không còn dùng cho ảnh sản phẩm

class ProductController
{
    public function index(Request $request)
    {
        $query = Product::with('category');

        // Filter by status
        if ($request->has('status') && $request->status !== '') {
            $query->where('status', $request->status);
        }

        // Filter by category
        if ($request->has('category_id') && $request->category_id !== '') {
            $query->where('category_id', $request->category_id);
        }

        // Filter by price range
        if ($request->has('min_price') && $request->min_price !== '') {
            $query->where('price', '>=', $request->min_price);
        }
        if ($request->has('max_price') && $request->max_price !== '') {
            $query->where('price', '<=', $request->max_price);
        }

        // Filter by model
        if ($request->has('model') && $request->model !== '') {
            $query->where('model', 'like', '%' . $request->model . '%');
        }

        // Filter by series
        if ($request->has('series') && $request->series !== '') {
            $query->where('series', 'like', '%' . $request->series . '%');
        }

        // Filter by search term
        if ($request->has('name') && $request->name !== '') {
            $search = $request->name;
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('model', 'like', "%{$search}%")
                    ->orWhere('series', 'like', "%{$search}%");
            });
        }

        // Show trashed items if requested
        if ($request->has('trashed') && $request->trashed) {
            $query->onlyTrashed();
        }

        $products = $query->latest()->paginate(10)->withQueryString();
        $categories = Category::where('status', 'active')->where('type', 1)->get();

        return view('admin.products.index', compact('products', 'categories'));
    }

    public function show(Product $product)
    {
        return view('admin.products.show', compact('product'));
    }

    public function create()
    {
        $categories = Category::where('status', 'active')->where('type', 1)->get();
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
            $data['features'] = array_filter($data['features'], function ($feature) {
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
            ->with('success', 'Product created successfully.');
    }

    public function edit(Product $product)
    {
        $categories = Category::where('status', 'active')->get();
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
            $data['features'] = array_filter($data['features'], function ($feature) {
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
            ->with('success', 'Product updated successfully.');
    }

    public function destroy(Request $request, Product $product)
    {
        if ($request->has('force_delete')) {
            // Permanently delete the product
            if ($product->image) {
                $imagePath = public_path($product->image);
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                }
            }
            $product->forceDelete();
            $message = 'Product permanently deleted successfully.';
        } else {
            // Soft delete the product
            $product->delete();
            $message = 'Product moved to trash successfully.';
        }

        return redirect()->route('admin.products.index')
            ->with('success', $message);
    }

    public function trash(Request $request)
    {
        $query = Product::onlyTrashed()->with('category');

        // Filter by status
        if ($request->has('status') && $request->status !== '') {
            $query->where('status', $request->status);
        }

        // Filter by category
        if ($request->has('category_id') && $request->category_id !== '') {
            $query->where('category_id', $request->category_id);
        }

        // Filter by search term
        if ($request->has('name') && $request->name !== '') {
            $search = $request->name;
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('model', 'like', "%{$search}%")
                    ->orWhere('series', 'like', "%{$search}%");
            });
        }

        $products = $query->latest()->paginate(10)->withQueryString();
        $categories = Category::all();

        return view('admin.products.trash', compact('products', 'categories'));
    }

    public function restore($id)
    {
        $product = Product::withTrashed()->findOrFail($id);
        $product->restore();

        return redirect()->route('admin.products.trash')
            ->with('success', 'Product restored successfully.');
    }

    public function forceDelete($id)
    {
        $product = Product::withTrashed()->findOrFail($id);

        // Delete the image file if it exists
        if ($product->image && file_exists(public_path($product->image))) {
            unlink(public_path($product->image));
        }

        $product->forceDelete();

        return redirect()->route('admin.products.trash')
            ->with('success', 'Product permanently deleted.');
    }
}
