<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\Category;
use App\Models\ProductVariant;
use App\Models\VariantAttributeType;
use App\Models\VariantAttributeValue;
use App\Models\VariantCombination;
use App\Models\ProductSpecification;
use App\Http\Requests\Admin\StoreProductRequest;
use App\Http\Requests\Admin\UpdateProductRequest;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

class ProductController
{
    public function index()
    {
        $products = Product::with(['category', 'variants'])->latest()->paginate(10);
        $categories = Category::where('type', 1)->get();
        return view('admin.products.index', compact('products', 'categories'));
    }

    public function create()
    {
        $categories = Category::where('type', 1)->get();
        $attributeTypes = VariantAttributeType::all();
        return view('admin.products.create', compact('categories', 'attributeTypes'));
    }

    public function store(StoreProductRequest $request)
    {
        try {
            DB::beginTransaction();

            // Create product
            $product = Product::create([
                'name' => $request->name,
                'slug' => Str::slug($request->name),
                'description' => $request->description,
                'content' => $request->content,
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months,
                'is_featured' => $request->has('is_featured'),
                'status' => 'active'
            ]);

            // Save specifications
            if ($request->has('specifications')) {
                foreach ($request->specifications as $specId => $value) {
                    if (!empty($value)) {
                    ProductSpecification::create([
                        'product_id' => $product->id,
                        'specification_id' => $specId,
                        'value' => $value
                    ]);
                    }
                }
            }

            // Create variants
            if ($request->has('variants')) {
                foreach ($request->variants as $variantData) {
                    // Create variant
                    $variant = ProductVariant::create([
                        'product_id' => $product->id,
                        'name' => $variantData['name'],
                        'slug' => $variantData['slug'],
                        'stock' => $variantData['stock'],
                        'purchase_price' => $variantData['purchase_price'],
                        'selling_price' => $variantData['selling_price'],
                        'status' => 'active',
                        'is_default' => isset($variantData['is_default'])
                    ]);

                    // Save variant attributes
                    if (isset($variantData['attributes'])) {
                        $attributes = $variantData['attributes'];
                        
                        // Ensure attributes is an array
                        if (is_string($attributes)) {
                            $attributes = json_decode($attributes, true);
                        }
                        
                        if (is_array($attributes)) {
                    foreach ($attributes as $attr) {
                                if (isset($attr['attribute_type_id']) && isset($attr['value'])) {
                        // Create or get attribute value
                        $attributeValue = VariantAttributeValue::firstOrCreate(
                            [
                                'attribute_type_id' => $attr['attribute_type_id'],
                                'value' => $attr['value']
                            ],
                            [
                                'hex' => $attr['hex'] ?? null,
                                'status' => 'active'
                            ]
                        );

                        // Create variant combination
                        VariantCombination::create([
                            'variant_id' => $variant->id,
                            'attribute_value_id' => $attributeValue->id
                        ]);
                                }
                            }
                        }
                    }

                    // Handle variant images
                    if (isset($variantData['images'])) {
                        $images = [];
                        foreach ($variantData['images'] as $image) {
                            if ($image->isValid()) {
                            $path = $image->store('uploads/products/' . date('Y/m/d'), 'public');
                            $images[] = $path;
                            }
                        }
                        if (!empty($images)) {
                        $variant->update(['images' => json_encode($images)]);
                        }
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product created successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error creating product: ' . $e->getMessage())->withInput();
        }
    }

    public function show(Product $product)
    {
        $product->load(['category', 'variants', 'specifications', 'attributes']);
        return view('admin.products.show', compact('product'));
    }

    public function edit(Product $product)
    {
        $categories = Category::where('type', 1)->get();
        $product->load(['category', 'variants', 'specifications', 'attributes']);
        return view('admin.products.edit', compact('product', 'categories'));
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        try {
            DB::beginTransaction();

            // Update product
            $product->update([
                'name' => $request->name,
                'slug' => Str::slug($request->name),
                'description' => $request->description,
                'content' => $request->content,
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months,
                'is_featured' => $request->has('is_featured')
            ]);

            // Update specifications
            if ($request->has('specifications')) {
                $product->specifications()->delete();
                foreach ($request->specifications as $specId => $value) {
                    $product->specifications()->create([
                        'specification_id' => $specId,
                        'value' => $value
                    ]);
                }
            }

            // Update attributes
            if ($request->has('attributes')) {
                $product->attributes()->delete();
                foreach ($request->attributes as $attrId => $data) {
                    if (isset($data['selected'])) {
                        foreach ($data['values'] as $value) {
                            $product->attributes()->create([
                                'attribute_type_id' => $attrId,
                                'value' => $value
                            ]);
                        }
                    }
                }
            }

            // Update variants
            if ($request->has('variants')) {
                // Delete old variants
                $product->variants()->delete();

                foreach ($request->variants as $variantData) {
                    // Create variant
                    $variant = $product->variants()->create([
                        'sku' => $variantData['sku'],
                        'name' => $product->name . ' - ' . implode(' - ', array_values(json_decode($variantData['attributes'], true))),
                        'slug' => Str::slug($product->name . ' - ' . implode(' - ', array_values(json_decode($variantData['attributes'], true)))),
                        'purchase_price' => $variantData['purchase_price'],
                        'selling_price' => $variantData['selling_price'],
                        'discount_price' => $variantData['discount_price'] ?? null,
                        'stock' => $variantData['stock'],
                        'is_default' => isset($variantData['is_default']),
                        'status' => 'active'
                    ]);

                    // Save variant images
                    if (isset($variantData['images'])) {
                        $images = [];
                        foreach ($variantData['images'] as $image) {
                            $path = $image->store('uploads/products/' . date('Y/m/d'), 'public');
                            $images[] = $path;
                        }
                        $variant->update(['images' => json_encode($images)]);
                    }

                    // Save variant attributes
                    $attributes = json_decode($variantData['attributes'], true);
                    foreach ($attributes as $attrName => $value) {
                        $attrType = VariantAttributeType::where('name', $attrName)->first();
                        if ($attrType) {
                            $attrValue = VariantAttributeValue::firstOrCreate([
                                'attribute_type_id' => $attrType->id,
                                'value' => $value
                            ]);

                            VariantCombination::create([
                                'variant_id' => $variant->id,
                                'attribute_value_id' => $attrValue->id
                            ]);
                        }
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product updated successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error updating product: ' . $e->getMessage());
        }
    }

    public function destroy(Product $product)
    {
        try {
            $product->delete();
            return redirect()->route('admin.products.index')->with('success', 'Product moved to trash successfully');
        } catch (\Exception $e) {
            return back()->with('error', 'Error deleting product: ' . $e->getMessage());
        }
    }

    public function trash()
    {
        $products = Product::onlyTrashed()->with(['category', 'variants'])->latest()->paginate(10);
        return view('admin.products.trash', compact('products'));
    }

    public function restore($id)
    {
        try {
            $product = Product::withTrashed()->findOrFail($id);
            $product->restore();
            return redirect()->route('admin.products.trash')->with('success', 'Product restored successfully');
        } catch (\Exception $e) {
            return back()->with('error', 'Error restoring product: ' . $e->getMessage());
        }
    }

    public function forceDelete($id)
    {
        try {
            $product = Product::withTrashed()->findOrFail($id);
            
            // Delete variant images
            foreach ($product->variants as $variant) {
                if ($variant->images) {
                    $images = json_decode($variant->images, true);
                    foreach ($images as $image) {
                        Storage::disk('public')->delete($image);
                    }
                }
            }

            $product->forceDelete();
            return redirect()->route('admin.products.trash')->with('success', 'Product permanently deleted');
        } catch (\Exception $e) {
            return back()->with('error', 'Error deleting product: ' . $e->getMessage());
        }
    }
}
