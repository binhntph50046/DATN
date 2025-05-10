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
                'sale_price' => 'nullable|numeric|min:0',
                'stock' => 'required|integer|min:0',
                'discount_price' => 'nullable|numeric|min:0',
                'features' => 'nullable|array',
                'features.*' => 'required|string',
                'specifications' => 'nullable|array',
                'specifications.*.key' => 'required|string',
                'specifications.*.value' => 'required|string',
            ]);
        }

        // Add conditional validation for stock
        if ($request->has_variants) {
            $rules['stock'] = 'nullable|integer|min:0';
        }

        $messages = [
            'required' => ':attribute is required.',
            'string' => ':attribute must be a string.',
            'max' => ':attribute must not exceed :max characters.',
            'in' => ':attribute is invalid.',
            'exists' => ':attribute does not exist.',
            'integer' => ':attribute must be an integer.',
            'min' => ':attribute must be at least :min.',
            'numeric' => ':attribute must be a number.',
            'array' => ':attribute must be an array.',
            'image' => ':attribute must be an image.',
            'mimes' => ':attribute must be a file of type: :values.',
            'unique' => ':attribute has already been taken.',
            'boolean' => ':attribute must be true or false.',
        ];

        $attributes = [
            'name' => 'Product name',
            'description' => 'Description',
            'content' => 'Content',
            'category_id' => 'Category',
            'model' => 'Model',
            'series' => 'Series',
            'warranty_months' => 'Warranty period',
            'is_featured' => 'Featured product',
            'status' => 'Status',
            'image' => 'Image',
            'has_variants' => 'Has variants',
            'purchase_price' => 'Purchase price',
            'selling_price' => 'Selling price',
            'sale_price' => 'Sale price',
            'stock' => 'Stock',
            'discount_price' => 'Discount price',
            'sku' => 'SKU',
            'features' => 'Features',
            'specifications' => 'Specifications',
            'attributes' => 'Attributes',
            'variants' => 'Variants',
        ];

        $validator = Validator::make($request->all(), $rules, $messages, $attributes);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput()
                ->with('error', 'Please check your information.')
                ->with('scroll_to_error', true);
        }

        try {
            DB::beginTransaction();

            // Prepare base product data
            $data = $request->except(['variants', 'attributes', 'features', 'specifications']);
            $data['slug'] = Str::slug($request->name);
            $data['is_featured'] = $request->has('is_featured') ? 1 : 0;

            // Add stock and discount_price only for non-variant products
            if (!$request->has_variants) {
                $data['stock'] = $request->stock;
                $data['discount_price'] = $request->discount_price;
            }

            // Handle product image upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('uploads/products');
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }
                $image->move($destinationPath, $imageName);
                $data['image'] = 'uploads/products/' . $imageName;
            }

            // Create product
            $product = Product::create($data);

            if ($request->has_variants) {
                // Handle product with variants
                if (!isset($request->variants) || empty($request->variants)) {
                    throw new \Exception('At least one variant is required for products with variants.');
                }

                // Reset stock and discount_price for variant products
                $data['stock'] = null;
                $data['discount_price'] = null;

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
                        if (!file_exists($destinationPath)) {
                            mkdir($destinationPath, 0777, true);
                        }
                        $image->move($destinationPath, $imageName);
                        $variant->image = 'uploads/products/variants/' . $imageName;
                        $variant->save();
                    }

                    // Create variant attributes
                    if (!isset($variantData['attributes']) || empty($variantData['attributes'])) {
                        throw new \Exception('Variant attributes are required.');
                    }
                    $this->createVariantAttributes($variant, $variantData['attributes']);
                }
            } else {
                // Handle simple product
                if (!isset($request->purchase_price) || !isset($request->selling_price)) {
                    throw new \Exception('Purchase price and selling price are required for simple products.');
                }

                // Add features if provided
                if (isset($request->features) && !empty($request->features)) {
                    foreach ($request->features as $feature) {
                        $product->attributes()->create([
                            'attribute_name' => 'feature',
                            'attribute_value' => $feature
                        ]);
                    }
                }

                // Add specifications if provided
                if (isset($request->specifications) && !empty($request->specifications)) {
                    foreach ($request->specifications as $spec) {
                        $product->attributes()->create([
                            'attribute_name' => $spec['key'],
                            'attribute_value' => $spec['value']
                        ]);
                    }
                }
            }

            DB::commit();

            return redirect()
                ->route('admin.products.index')
                ->with('success', 'Product created successfully.');

        } catch (\Exception $e) {
            DB::rollBack();
            
            // Delete uploaded images if any
            if (isset($data['image']) && file_exists(public_path($data['image']))) {
                unlink(public_path($data['image']));
            }

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to create product: ' . $e->getMessage());
        }
    }

    public function edit(Product $product)
    {
        $categories = Category::where('status', 'active')->get();
        return view('admin.products.edit', compact('product', 'categories'));
    }

    public function update(Request $request, Product $product)
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
                'variants.*.sku' => 'required|string|unique:product_variants,sku,' . $product->id . ',product_id',
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
                'sale_price' => 'nullable|numeric|min:0',
                'stock' => 'required|integer|min:0',
                'discount_price' => 'nullable|numeric|min:0',
                'features' => 'nullable|array',
                'features.*' => 'required|string',
                'specifications' => 'nullable|array',
                'specifications.*.key' => 'required|string',
                'specifications.*.value' => 'required|string',
            ]);
        }

        // Add conditional validation for stock
        if ($request->has_variants) {
            $rules['stock'] = 'nullable|integer|min:0';
        }

        $messages = [
            'required' => ':attribute is required.',
            'string' => ':attribute must be a string.',
            'max' => ':attribute must not exceed :max characters.',
            'in' => ':attribute is invalid.',
            'exists' => ':attribute does not exist.',
            'integer' => ':attribute must be an integer.',
            'min' => ':attribute must be at least :min.',
            'numeric' => ':attribute must be a number.',
            'array' => ':attribute must be an array.',
            'image' => ':attribute must be an image.',
            'mimes' => ':attribute must be a file of type: :values.',
            'unique' => ':attribute has already been taken.',
            'boolean' => ':attribute must be true or false.',
        ];

        $attributes = [
            'name' => 'Product name',
            'description' => 'Description',
            'content' => 'Content',
            'category_id' => 'Category',
            'model' => 'Model',
            'series' => 'Series',
            'warranty_months' => 'Warranty period',
            'is_featured' => 'Featured product',
            'status' => 'Status',
            'image' => 'Image',
            'has_variants' => 'Has variants',
            'purchase_price' => 'Purchase price',
            'selling_price' => 'Selling price',
            'sale_price' => 'Sale price',
            'stock' => 'Stock',
            'discount_price' => 'Discount price',
            'sku' => 'SKU',
            'features' => 'Features',
            'specifications' => 'Specifications',
            'attributes' => 'Attributes',
            'variants' => 'Variants',
        ];

        $validator = Validator::make($request->all(), $rules, $messages, $attributes);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput()
                ->with('error', 'Please check your information.')
                ->with('scroll_to_error', true);
        }

        try {
            DB::beginTransaction();

            // Prepare base product data
            $data = [
                'name' => $request->name,
                'description' => $request->description,
                'content' => $request->content,
                'category_id' => $request->category_id,
                'model' => $request->model,
                'series' => $request->series,
                'warranty_months' => $request->warranty_months,
                'is_featured' => $request->has('is_featured') ? 1 : 0,
                'status' => $request->status,
                'has_variants' => $request->has_variants,
                'slug' => Str::slug($request->name)
            ];

            // Add stock and discount_price only for non-variant products
            if (!$request->has_variants) {
                $data['stock'] = $request->stock;
                $data['discount_price'] = $request->discount_price;
            } else {
                $data['stock'] = null;
                $data['discount_price'] = null;
            }

            // Handle product type change
            if ($product->has_variants != $request->has_variants) {
                // Delete all related data
                $product->attributes()->delete();
                foreach ($product->variants as $variant) {
                    if ($variant->image) {
                        $oldImagePath = public_path($variant->image);
                        if (file_exists($oldImagePath)) {
                            unlink($oldImagePath);
                        }
                    }
                }
                $product->variants()->delete();

                // Reset product fields
                $data['purchase_price'] = null;
                $data['selling_price'] = null;
                $data['sale_price'] = null;
                $data['stock'] = null;
                $data['discount_price'] = null;
            }

            // Handle product image
            if ($request->hasFile('image')) {
                // Delete old image if exists
                if ($product->image && file_exists(public_path($product->image))) {
                    unlink(public_path($product->image));
                }

                $image = $request->file('image');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('uploads/products');
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }
                $image->move($destinationPath, $imageName);
                $data['image'] = 'uploads/products/' . $imageName;
            }

            // Update product with new data
            $product->update($data);

            if ($request->has_variants) {
                // Delete existing variants and their attributes
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
                        if (isset($variantData['image']) && $variantData['image'] instanceof \Illuminate\Http\UploadedFile) {
                            // Delete old variant image if exists
                            if ($variant->image && file_exists(public_path($variant->image))) {
                                unlink(public_path($variant->image));
                            }

                            $image = $variantData['image'];
                            $imageName = time() . '_' . $variant->id . '.' . $image->getClientOriginalExtension();
                            $destinationPath = public_path('uploads/products/variants');
                            if (!file_exists($destinationPath)) {
                                mkdir($destinationPath, 0777, true);
                            }
                            $image->move($destinationPath, $imageName);
                            $variant->image = 'uploads/products/variants/' . $imageName;
                            $variant->save();
                        }

                        // Create variant attributes
                        if (isset($variantData['attributes'])) {
                            foreach ($variantData['attributes'] as $attr) {
                                $variant->attributes()->create([
                                    'name' => $attr['name'],
                                    'value' => $attr['value'],
                                    'display_name' => $attr['display_name'] ?? $attr['value']
                                ]);
                            }
                        }
                    }
                }
            } else {
                // Delete existing attributes
                $product->attributes()->delete();

                // Add non-variant product fields
                $product->update([
                    'purchase_price' => $request->purchase_price,
                    'selling_price' => $request->selling_price,
                    'sale_price' => $request->sale_price,
                    'stock' => $request->stock
                ]);

                // Add features if provided
                if (isset($request->features) && !empty($request->features)) {
                    foreach ($request->features as $feature) {
                        $product->attributes()->create([
                            'attribute_name' => 'feature',
                            'attribute_value' => $feature
                        ]);
                    }
                }

                // Add specifications if provided
                if (isset($request->specifications) && !empty($request->specifications)) {
                    foreach ($request->specifications as $spec) {
                        $product->attributes()->create([
                            'attribute_name' => $spec['key'],
                            'attribute_value' => $spec['value']
                        ]);
                    }
                }
            }

            DB::commit();

            return redirect()
                ->route('admin.products.index')
                ->with('success', 'Product updated successfully.');

        } catch (\Exception $e) {
            DB::rollBack();
            
            // Delete uploaded images if any
            if (isset($data['image']) && file_exists(public_path($data['image']))) {
                unlink(public_path($data['image']));
            }

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to update product: ' . $e->getMessage());
        }
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
