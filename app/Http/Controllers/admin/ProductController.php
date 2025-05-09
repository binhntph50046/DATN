<?php

namespace App\Http\Controllers\admin;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
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
        $rules = [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'content' => 'nullable|string',
            'category_id' => 'required|exists:categories,id',
            'model' => 'nullable|string|max:100',
            'series' => 'nullable|string|max:100',
            'warranty_months' => 'required|integer|min:0',
            'is_featured' => 'nullable|boolean',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'has_variants' => 'required|boolean',
        ];

        // Add validation rules based on product type
        if ($request->has_variants) {
            $rules = array_merge($rules, [
                'attributes' => 'required|array|min:1',
                'attributes.*.name' => 'required|string',
                'attributes.*.values' => 'required|array|min:1',
                'attributes.*.values.*' => 'required|string',
                'variants' => 'required|array|min:1',
                'variants.*.sku' => 'required|string|unique:product_variants,sku',
                'variants.*.purchase_price' => 'required|numeric|min:0',
                'variants.*.selling_price' => 'required|numeric|min:0',
                'variants.*.sale_price' => 'nullable|numeric|min:0',
                'variants.*.stock' => 'required|integer|min:0',
                'variants.*.is_default' => 'nullable|boolean',
                'variants.*.image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
                'variants.*.attributes' => 'required|array',
                'variants.*.attributes.*.name' => 'required|string',
                'variants.*.attributes.*.value' => 'required|string',
                'variants.*.attributes.*.display_name' => 'nullable|string',
            ]);
        } else {
            $rules = array_merge($rules, [
                'purchase_price' => 'required|numeric|min:0',
                'selling_price' => 'required|numeric|min:0',
                'features' => 'nullable|array',
                'features.*' => 'required|string',
                'specifications' => 'nullable|array',
                'specifications.*.key' => 'required|string',
                'specifications.*.value' => 'required|string',
            ]);
        }

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput()
                ->with('error', 'Please check the form for errors.')
                ->with('scroll_to_error', true);
        }

        try {
            \DB::beginTransaction();

            $data = $request->except(['variants', 'attributes', 'features', 'specifications']);
            $data['slug'] = Str::slug($request->name);
            $data['is_featured'] = $request->has('is_featured') ? 1 : 0;

            // Handle image upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('uploads/products');
                $image->move($destinationPath, $imageName);
                $data['image'] = 'uploads/products/' . $imageName;
            }

            // Create product
            $product = Product::create($data);

            if ($request->has_variants) {
                // Handle product with variants
                if (isset($request->variants)) {
                    foreach ($request->variants as $variantData) {
                        $variant = $product->variants()->create([
                            'sku' => $variantData['sku'],
                            'purchase_price' => $variantData['purchase_price'],
                            'selling_price' => $variantData['selling_price'],
                            'sale_price' => $variantData['sale_price'] ?? null,
                            'stock' => $variantData['stock'],
                            'is_default' => isset($variantData['is_default']) ? 1 : 0,
                            'status' => isset($variantData['status']) ? 'active' : 'inactive'
                        ]);

                        // Handle variant image
                        if (isset($variantData['image'])) {
                            $image = $variantData['image'];
                            $imageName = time() . '_' . $variant->id . '.' . $image->getClientOriginalExtension();
                            $destinationPath = public_path('uploads/products/variants');
                            $image->move($destinationPath, $imageName);
                            $variant->image = 'uploads/products/variants/' . $imageName;
                            $variant->save();
                        }

                        // Create variant attributes
                        $this->createVariantAttributes($variant, $variantData['attributes']);
                    }
                }
            } else {
                // Handle simple product features
                if (isset($request->features)) {
                    foreach ($request->features as $feature) {
                        $product->attributes()->create([
                            'attribute_name' => 'feature',
                            'attribute_value' => $feature
                        ]);
                    }
                }

                // Handle simple product specifications
                if (isset($request->specifications)) {
                    foreach ($request->specifications as $spec) {
                        $product->attributes()->create([
                            'attribute_name' => $spec['key'],
                            'attribute_value' => $spec['value']
                        ]);
                    }
                }
            }

            \DB::commit();

            return redirect()->route('admin.products.index')
                ->with('success', 'Product created successfully.');

        } catch (\Exception $e) {
            \DB::rollBack();
            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'An error occurred while creating the product: ' . $e->getMessage());
        }
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
            'category_id' => 'required|exists:categories,id',
            'model' => 'nullable|string|max:100',
            'series' => 'nullable|string|max:100',
            'warranty_months' => 'required|integer|min:0',
            'is_featured' => 'nullable|boolean',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'has_variants' => 'required|boolean',
            'purchase_price' => 'required_if:has_variants,0|numeric|min:0',
            'selling_price' => 'required_if:has_variants,0|numeric|min:0',
            'attributes' => 'required_if:has_variants,1|array',
            'attributes.*.name' => 'required_if:has_variants,1|string',
            'attributes.*.values' => 'required_if:has_variants,1|array',
            'attributes.*.values.*' => 'required_if:has_variants,1|string',
            'variants' => 'required_if:has_variants,1|array',
            'variants.*.sku' => 'required_if:has_variants,1|string',
            'variants.*.purchase_price' => 'required_if:has_variants,1|numeric|min:0',
            'variants.*.selling_price' => 'required_if:has_variants,1|numeric|min:0',
            'variants.*.sale_price' => 'nullable|numeric|min:0',
            'variants.*.stock' => 'required_if:has_variants,1|integer|min:0',
            'variants.*.is_default' => 'nullable|boolean',
            'variants.*.image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'variants.*.attributes' => 'required_if:has_variants,1|array',
            'variants.*.attributes.*.name' => 'required_if:has_variants,1|string',
            'variants.*.attributes.*.value' => 'required_if:has_variants,1|string',
            'variants.*.attributes.*.display_name' => 'nullable|string',
        ]);

        $data = $request->except(['variants', 'attributes']);
        $data['slug'] = Str::slug($request->name);
        $data['is_featured'] = $request->has('is_featured') ? 1 : 0;

        // Handle image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
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

        // Update product
        $product->update($data);

        if ($request->has_variants) {
            // Delete existing variants and their attributes
            foreach ($product->variants as $variant) {
                if ($variant->image) {
                    $oldImagePath = public_path($variant->image);
                    if (file_exists($oldImagePath)) {
                        unlink($oldImagePath);
                    }
                }
            }
            $product->variants()->delete();
            
            // Create new variants
            if (isset($request->variants)) {
                foreach ($request->variants as $variantData) {
                    $variant = $product->variants()->create([
                        'sku' => $variantData['sku'],
                        'purchase_price' => $variantData['purchase_price'],
                        'selling_price' => $variantData['selling_price'],
                        'sale_price' => $variantData['sale_price'] ?? null,
                        'stock' => $variantData['stock'],
                        'is_default' => isset($variantData['is_default']) ? 1 : 0,
                        'status' => isset($variantData['status']) ? 'active' : 'inactive'
                    ]);

                    // Handle variant image
                    if (isset($variantData['image'])) {
                        $image = $variantData['image'];
                        $imageName = time() . '_' . $variant->id . '.' . $image->getClientOriginalExtension();
                        $destinationPath = public_path('uploads/products/variants');
                        $image->move($destinationPath, $imageName);
                        $variant->image = 'uploads/products/variants/' . $imageName;
                        $variant->save();
                    }

                    // Create variant attributes
                    $this->updateVariantAttributes($variant, $variantData['attributes']);
                }
            }
        } else {
            // Delete existing attributes
            $product->attributes()->delete();
            
            // Create new attributes for simple product
            if (isset($request->attributes)) {
                foreach ($request->attributes as $attr) {
                    $product->attributes()->create([
                        'attribute_name' => $attr['name'],
                        'attribute_value' => $attr['values'][0]
                    ]);
                }
            }
        }

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

    private function createVariantAttributes($variant, $attributes)
    {
        // Sort attributes by name to ensure consistent order
        $sortedAttributes = collect($attributes)->sortBy('name')->values();
        
        foreach ($sortedAttributes as $attr) {
            $variant->attributes()->create([
                'name' => $attr['name'],
                'value' => $attr['value'],
                'display_name' => $attr['display_name'] ?? $attr['value']
            ]);
        }
    }

    private function updateVariantAttributes($variant, $attributes)
    {
        // Delete existing attributes
        $variant->attributes()->delete();
        
        // Sort attributes by name to ensure consistent order
        $sortedAttributes = collect($attributes)->sortBy('name')->values();
        
        // Create new attributes
        foreach ($sortedAttributes as $attr) {
            $variant->attributes()->create([
                'name' => $attr['name'],
                'value' => $attr['value'],
                'display_name' => $attr['display_name'] ?? $attr['value']
            ]);
        }
    }
}
