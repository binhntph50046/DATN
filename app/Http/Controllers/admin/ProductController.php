<?php

namespace App\Http\Controllers\admin;

use App\Http\Requests\Admin\StoreProductRequest;
use App\Http\Requests\Admin\UpdateProductRequest;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\ProductVariant;
use App\Models\VariantAttribute;
use App\Models\VariantAttributeType;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductController
{
    public function index()
    {
        $products = Product::with('category')->paginate(10);
        $categories = Category::where('status', 'active')->where('type', 1)->get();
        return view('admin.products.index', compact('products', 'categories'));
    }

    public function createSimple()
    {
        $categories = Category::where('status', 'active')->where('type', 1)->get();
        $attributeTypes = VariantAttributeType::where('status', 'active')->get();
        return view('admin.products.create-simple', compact('categories', 'attributeTypes'));
    }

    public function createVariant()
    {
        $categories = Category::where('status', 'active')->where('type', 1)->get();
        $attributeTypes = VariantAttributeType::where('status', 'active')->get();
        return view('admin.products.create-variant', compact('categories', 'attributeTypes'));
    }

    public function store(StoreProductRequest $request)
    {
        $data = $request->validated();

        // Generate slug if not provided
        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);
        $data['has_variants'] = $request->input('has_variants', 0);

        // Prepare product data
        $productData = [
            'name' => $data['name'],
            'slug' => $data['slug'],
            'description' => $data['description'] ?? null,
            'content' => $data['content'] ?? null,
            'category_id' => $data['category_id'],
            'model' => $request->input('model'),
            'series' => $request->input('series'),
            'warranty_months' => $data['warranty_months'],
            'is_featured' => $data['is_featured'] ?? false,
            'status' => $data['status'],
            'has_variants' => $data['has_variants'],
        ];

        // Create product in products table
        $product = Product::create($productData);

        // Handle product attributes
        if (!empty($data['product_attributes'])) {
            foreach ($data['product_attributes'] as $attr) {
                if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                    // Get attribute type to get the name
                    $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                    if ($attributeType) {
                        ProductAttribute::create([
                            'product_id' => $product->id,
                            'attribute_name' => $attributeType->name,
                            'attribute_value' => $attr['value'],
                        ]);
                    }
                }
            }
        }

        // Prepare variant data
        $variantData = [
            'stock' => $data['stock'] ?? 0,
            'purchase_price' => $data['purchase_price'] ?? 0,
            'selling_price' => $data['selling_price'] ?? 0,
            'discount_price' => $data['discount_price'] ?? null,
            'image' => $request->hasFile('image') ? $request->file('image')->store('products', 'public') : null,
            'status' => 'active',
        ];

        // Handle variants
        if ($product->has_variants) {
            $attributeValues = $data['attribute_values'] ?? [];
            $variantsData = [];

            if (!empty($attributeValues)) {
                $totalCombinations = array_reduce($attributeValues, fn($carry, $values) => $carry * count($values), 1);
                if ($totalCombinations > 100) {
                    return redirect()->back()->withErrors(['attribute_values' => 'Too many combinations (' . $totalCombinations . '). Please reduce the number of values.']);
                }
                $combinations = $this->generateCombinations($attributeValues);
                foreach ($combinations as $index => $combination) {
                    $variantName = $product->name . '-' . implode('-', $combination);
                    $variantsData[] = array_merge([
                        'product_id' => $product->id,
                        'sku' => Str::slug($variantName) . '-' . $index,
                        'name' => $variantName,
                        'slug' => Str::slug($variantName),
                    ], $variantData, [
                        'attributes' => array_map(function ($value, $typeId) {
                            return ['attribute_type_id' => $typeId, 'value' => $value];
                        }, $combination, array_keys($attributeValues)),
                    ]);
                }
            }

            // Save variants and attributes
            foreach ($variantsData as $variant) {
                $productVariant = ProductVariant::create(array_diff_key($variant, ['attributes' => '']));
                foreach ($variant['attributes'] as $attr) {
                    if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                        VariantAttribute::create([
                            'variant_id' => $productVariant->id,
                            'attribute_type_id' => $attr['attribute_type_id'],
                            'value' => $attr['value'],
                        ]);
                    }
                }
            }
        } else {
            // For simple product, create a default variant
            ProductVariant::create(array_merge([
                'product_id' => $product->id,
                'sku' => Str::slug($product->name) . '-simple',
                'name' => $product->name,
                'slug' => Str::slug($product->name),
            ], $variantData));
        }

        return redirect()->route('admin.products.index')->with('success', 'Product created successfully.');
    }

    public function show(Product $product)
    {
        $product->load('category', 'variants', 'attributes.attributeType', 'variants.attributes.attributeType');
        return view('admin.products.show', compact('product'));
    }

    public function editSimple(Product $product)
    {
        if ($product->has_variants) {
            return redirect()->route('admin.products.edit-variant', $product)->with('error', 'This product has variants. Use the variant edit form.');
        }

        $categories = Category::where('status', 'active')->where('type', 1)->get();
        $attributeTypes = VariantAttributeType::where('status', 'active')->get();
        $product->load('variants', 'attributes');
        return view('admin.products.edit-simple', compact('product', 'categories', 'attributeTypes'));
    }

    public function editVariant(Product $product)
    {
        if (!$product->has_variants) {
            return redirect()->route('admin.products.edit-simple', $product)->with('error', 'This product does not have variants. Use the simple edit form.');
        }

        $categories = Category::where('status', 'active')->where('type', 1)->get();
        $attributeTypes = VariantAttributeType::where('status', 'active')->get();
        $product->load('variants.attributes', 'attributes');
        return view('admin.products.edit-variant', compact('product', 'categories', 'attributeTypes'));
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        try {
            $data = $request->validated();

            // Generate slug if name changes
            $data['slug'] = $data['slug'] ?? Str::slug($data['name']);
            $data['has_variants'] = $request->input('has_variants', 0);

            // Prepare product data
            $productData = [
                'name' => $data['name'],
                'slug' => $data['slug'],
                'description' => $data['description'] ?? null,
                'content' => $data['content'] ?? null,
                'category_id' => $data['category_id'],
                'model' => $request->input('model'),
                'series' => $request->input('series'),
                'warranty_months' => $data['warranty_months'],
                'is_featured' => $data['is_featured'] ?? false,
                'status' => $data['status'],
                'has_variants' => $data['has_variants'],
            ];

            // Update product
            $product->update($productData);

            // Handle product attributes
            $product->attributes()->delete();
            if (!empty($data['product_attributes'])) {
                foreach ($data['product_attributes'] as $attr) {
                    if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                        // Get attribute type to get the name
                        $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                        if ($attributeType) {
                            ProductAttribute::create([
                                'product_id' => $product->id,
                                'attribute_name' => $attributeType->name,
                                'attribute_value' => $attr['value'],
                            ]);
                        }
                    }
                }
            }

            // Prepare variant data
            $variantData = [
                'stock' => $data['stock'] ?? 0,
                'purchase_price' => $data['purchase_price'] ?? 0,
                'selling_price' => $data['selling_price'] ?? 0,
                'discount_price' => $data['discount_price'] ?? null,
                'status' => 'active',
            ];

            // Delete all existing variants and their attributes
            foreach ($product->variants as $variant) {
                // Delete variant attributes
                $variant->attributes()->delete();
                // Delete variant combinations if any
                if (method_exists($variant, 'combinations')) {
                    $variant->combinations()->delete();
                }
                // Delete variant image if exists
                if ($variant->image) {
                    Storage::disk('public')->delete($variant->image);
                }
                // Delete variant
                $variant->delete();
            }

            if ($product->has_variants) {
                $attributeValues = $data['attribute_values'] ?? [];
                $variantsData = [];

                if (!empty($attributeValues)) {
                    $totalCombinations = array_reduce($attributeValues, fn($carry, $values) => $carry * count($values), 1);
                    if ($totalCombinations > 100) {
                        return redirect()->back()->withErrors(['attribute_values' => 'Too many combinations (' . $totalCombinations . '). Please reduce the number of values.']);
                    }

                    $combinations = $this->generateCombinations($attributeValues);
                    foreach ($combinations as $index => $combination) {
                        $variantName = $product->name . '-' . implode('-', $combination);
                        $variantSlug = Str::slug($variantName) . '-' . $index . '-' . $product->id;
                        $variantsData[] = array_merge([
                            'product_id' => $product->id,
                            'sku' => $variantSlug,
                            'name' => $variantName,
                            'slug' => $variantSlug,
                        ], $variantData, [
                            'image' => $request->hasFile('image') ? $request->file('image')->store('products', 'public') : null,
                            'attributes' => array_map(function ($value, $typeId) {
                                return ['attribute_type_id' => $typeId, 'value' => $value];
                            }, $combination, array_keys($attributeValues)),
                        ]);
                    }
                }

                // Save updated variants
                foreach ($variantsData as $variant) {
                    $productVariant = ProductVariant::create(array_diff_key($variant, ['attributes' => '']));
                    foreach ($variant['attributes'] as $attr) {
                        if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                            VariantAttribute::create([
                                'variant_id' => $productVariant->id,
                                'attribute_type_id' => $attr['attribute_type_id'],
                                'value' => $attr['value'],
                            ]);
                        }
                    }
                }
            } else {
                // For simple product, create a new variant
                $variantSlug = Str::slug($product->name) . '-simple-' . $product->id . '-' . time();
                $variantData['image'] = $request->hasFile('image') ? $this->moveImageToUploadsProducts($request->file('image')) : null;

                ProductVariant::create(array_merge([
                    'product_id' => $product->id,
                    'sku' => $variantSlug,
                    'name' => $product->name,
                    'slug' => $variantSlug,
                ], $variantData));
            }

            return redirect()->route('admin.products.index')->with('success', 'Product updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->withErrors(['error' => 'Failed to update product: ' . $e->getMessage()]);
        }
    }

    public function destroy(Product $product)
    {
        foreach ($product->variants as $variant) {
            if ($variant->image) {
                Storage::disk('public')->delete($variant->image);
            }
        }

        $product->delete();
        return redirect()->route('admin.products.index')->with('success', 'Product deleted successfully.');
    }

    public function trash()
    {
        $products = Product::onlyTrashed()->with('category')->paginate(10);
        return view('admin.products.trash', compact('products'));
    }

    private function generateCombinations(array $attributeValues)
    {
        $result = [[]];
        foreach ($attributeValues as $values) {
            $temp = [];
            foreach ($result as $prefix) {
                foreach ($values as $value) {
                    $temp[] = array_merge($prefix, [$value]);
                }
            }
            $result = $temp;
        }
        return $result;
    }

    /**
     * Move uploaded image to public/uploads/products and return relative path 'products/filename.ext'
     */
    private function moveImageToUploadsProducts($image)
    {
        $imageName = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
        $destination = public_path('uploads/products');
        if (!file_exists($destination)) {
            mkdir($destination, 0755, true);
        }
        $image->move($destination, $imageName);
        return 'products/' . $imageName;
    }

}
