<?php

namespace App\Http\Controllers\admin;

use App\Http\Requests\admin\StoreProductRequest;
use App\Http\Requests\admin\UpdateProductRequest;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\ProductVariant;
use App\Models\VariantAttributeType;
use App\Models\VariantAttributeValue;
use App\Models\VariantCombination;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
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

        try {
            DB::beginTransaction();

            // Create product
            $product = Product::create($productData);

            // Handle variants
            if ($product->has_variants && !empty($data['variants'])) {
                // Reset all is_default to 0 initially
                ProductVariant::where('product_id', $product->id)->update(['is_default' => 0]);

                foreach ($data['variants'] as $index => $variantData) {
                    // Handle image upload
                    $image = $request->hasFile("variants.{$index}.image")
                        ? $this->moveImageToUploadsProducts($request->file("variants.{$index}.image"))
                        : null;

                    // Generate unique SKU
                    $sku = Str::slug($variantData['slug']) . '-' . Str::random(6);

                    // Create variant
                    $productVariant = ProductVariant::create([
                        'product_id' => $product->id,
                        'sku' => $sku,
                        'name' => $variantData['name'],
                        'slug' => $variantData['slug'],
                        'stock' => $variantData['stock'] ?? 0,
                        'purchase_price' => $variantData['purchase_price'] ?? 0,
                        'selling_price' => $variantData['selling_price'] ?? 0,
                        'discount_price' => $variantData['discount_price'] ?? null,
                        'image' => $image,
                        'status' => 'active',
                        'is_default' => isset($variantData['is_default']) && $variantData['is_default'] == 1 ? 1 : 0,
                    ]);

                    // Process attributes
                    $attributes = json_decode($variantData['attributes'], true);
                    if (json_last_error() === JSON_ERROR_NONE && is_array($attributes)) {
                        foreach ($attributes as $attr) {
                            $value = trim($attr['value']);
                            if (!empty($value)) {
                                // Create or find attribute value
                                $attributeValue = VariantAttributeValue::firstOrCreate(
                                    [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => $value,
                                    ],
                                    [
                                        'status' => 'active',
                                        'created_at' => now(),
                                        'updated_at' => now(),
                                    ]
                                );

                                // Link variant to attribute value via combination
                                VariantCombination::create([
                                    'variant_id' => $productVariant->id,
                                    'attribute_value_id' => $attributeValue->id,
                                ]);
                            }
                        }
                    } else {
                        Log::error("Invalid JSON attributes for variant: {$variantData['name']}");
                    }
                }

                // Ensure only one variant is default
                $defaultVariant = null;
                foreach ($data['variants'] as $index => $variantData) {
                    if (isset($variantData['is_default']) && $variantData['is_default'] == 1) {
                        $defaultVariant = $variantData;
                        break;
                    }
                }

                // If no default is set, make the first variant default
                if (!$defaultVariant && !empty($data['variants'])) {
                    $defaultVariant = $data['variants'][0];
                }

                if ($defaultVariant) {
                    ProductVariant::where('product_id', $product->id)
                        ->where('slug', '!=', $defaultVariant['slug'])
                        ->update(['is_default' => 0]);
                    ProductVariant::where('product_id', $product->id)
                        ->where('slug', $defaultVariant['slug'])
                        ->update(['is_default' => 1]);
                }
            } else {
                // For simple product, create a default variant
                $image = $request->hasFile('image')
                    ? $this->moveImageToUploadsProducts($request->file('image'))
                    : null;
                $sku = Str::slug($product->name) . '-simple-' . Str::random(6);

                $variantData = [
                    'product_id' => $product->id,
                    'sku' => $sku,
                    'name' => $product->name,
                    'slug' => Str::slug($product->name),
                    'stock' => $data['stock'] ?? 0,
                    'purchase_price' => $data['purchase_price'] ?? 0,
                    'selling_price' => $data['selling_price'] ?? 0,
                    'discount_price' => $data['discount_price'] ?? null,
                    'image' => $image,
                    'status' => 'active',
                    'is_default' => 1,  // Simple products have only one variant, so it's always default
                ];

                ProductVariant::create($variantData);

                // Handle product attributes for simple product
                if (!empty($data['product_attributes'])) {
                    foreach ($data['product_attributes'] as $attr) {
                        if (!empty($attr['attribute_type_id'])) {  // Chỉ yêu cầu attribute_type_id
                            $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                            if ($attributeType) {
                                ProductAttribute::create([
                                    'product_id' => $product->id,
                                    'attribute_name' => $attributeType->name,
                                    'attribute_value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                ]);
                            } else {
                                Log::warning("Attribute type ID {$attr['attribute_type_id']} not found for product ID {$product->id}");
                            }
                        }
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product created successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to create product: ' . $e->getMessage());
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to create product: ' . $e->getMessage()]);
        }
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
        $product->load('variants.attributes.attributeType', 'attributes');

        // Chuẩn bị attributeValues
        $attributeValues = [];
        $variants = $product->variants;

        if ($variants->isNotEmpty()) {
            foreach ($variants as $variant) {
                foreach ($variant->attributes as $attribute) {
                    $attributeTypeId = $attribute->attributeType->id;
                    $attributeValue = $attribute->value;
                    $hex = $attribute->hex ?? '';

                    // Nhóm theo attribute_type_id
                    if (!isset($attributeValues[$attributeTypeId])) {
                        $attributeValues[$attributeTypeId] = [
                            'attribute_type_id' => $attributeTypeId,
                            'values' => [],
                            'hex' => [],
                        ];
                    }

                    // Thêm giá trị và hex vào mảng
                    if (!in_array($attributeValue, $attributeValues[$attributeTypeId]['values'])) {
                        $attributeValues[$attributeTypeId]['values'][] = $attributeValue;
                        $attributeValues[$attributeTypeId]['hex'][] = $hex;
                    }
                }
            }
        }

        // Chuyển mảng attributeValues thành dạng tuần tự
        $attributeValues = array_values($attributeValues);

        // Ghi log để debug
        Log::info('Attribute Values for product ID ' . $product->id, [
            'variants_count' => $variants->count(),
            'attributeValues' => $attributeValues,
        ]);

        return view('admin.products.edit-variant', compact('product', 'categories', 'attributeTypes', 'attributeValues', 'variants'));
    }

    /**
     * Khôi phục sản phẩm đã bị xóa mềm
     */
    public function restore($id)
    {
        $product = \App\Models\Product::withTrashed()->findOrFail($id);
        $product->restore();
        return redirect()->route('admin.products.trash')->with('success', 'Product restored successfully!');
    }

    /**
     * Xóa vĩnh viễn sản phẩm đã bị xóa mềm
     */
    public function forceDelete($id)
    {
        $product = \App\Models\Product::withTrashed()->findOrFail($id);
        // Xóa ảnh của các variant nếu có
        foreach ($product->variants as $variant) {
            if ($variant->image && \Storage::disk('public')->exists($variant->image)) {
                \Storage::disk('public')->delete($variant->image);
            }
        }
        // Xóa ảnh sản phẩm nếu có
        if ($product->image && \Storage::disk('public')->exists($product->image)) {
            \Storage::disk('public')->delete($product->image);
        }
        $product->forceDelete();
        return redirect()->route('admin.products.trash')->with('success', 'Product deleted permanently!');
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        try {
            $data = $request->validated();

            // Generate slug if name changes
            $data['slug'] = $data['slug'] ?? Str::slug($data['name']);
            $data['has_variants'] = $request->input('has_variants', 0);

            // Check if product name has changed
            $nameChanged = $data['name'] !== $product->getOriginal('name');

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

            DB::beginTransaction();

            // Update product
            $product->update($productData);

            // Handle variants
            if ($product->has_variants && !empty($data['variants'])) {
                $existingVariantIds = $product->variants->pluck('id')->toArray();
                $newVariantIds = [];

                // Reset all is_default to 0 initially
                ProductVariant::where('product_id', $product->id)->update(['is_default' => 0]);

                foreach ($data['variants'] as $index => $variantData) {
                    // Check if variant exists based on slug
                    $existingVariant = $product->variants->firstWhere('slug', $variantData['slug']);
                    if ($existingVariant) {
                        // Update existing variant
                        $image = $request->hasFile("variants.{$index}.image")
                            ? $this->moveImageToUploadsProducts($request->file("variants.{$index}.image"))
                            : $existingVariant->image;

                        $existingVariant->update([
                            'name' => $variantData['name'],
                            'slug' => $variantData['slug'],
                            'stock' => $variantData['stock'] ?? 0,
                            'purchase_price' => $variantData['purchase_price'] ?? 0,
                            'selling_price' => $variantData['selling_price'] ?? 0,
                            'discount_price' => $variantData['discount_price'] ?? null,
                            'image' => $image,
                            'status' => 'active',
                            'is_default' => isset($variantData['is_default']) && $variantData['is_default'] == 1 ? 1 : 0,
                        ]);

                        // Clear existing combinations
                        $existingVariant->combinations()->delete();
                        $newVariantIds[] = $existingVariant->id;
                    } else {
                        // Create new variant with unique slug
                        $baseSlug = Str::slug($variantData['slug']);
                        $slug = $baseSlug;
                        $counter = 1;
                        while (ProductVariant::where('slug', $slug)->exists()) {
                            $slug = $baseSlug . '-' . $counter++;
                        }

                        $image = $request->hasFile("variants.{$index}.image")
                            ? $this->moveImageToUploadsProducts($request->file("variants.{$index}.image"))
                            : null;
                        $sku = $slug . '-' . Str::random(6);

                        $productVariant = ProductVariant::create([
                            'product_id' => $product->id,
                            'sku' => $sku,
                            'name' => $variantData['name'],
                            'slug' => $slug,
                            'stock' => $variantData['stock'] ?? 0,
                            'purchase_price' => $variantData['purchase_price'] ?? 0,
                            'selling_price' => $variantData['selling_price'] ?? 0,
                            'discount_price' => $variantData['discount_price'] ?? null,
                            'image' => $image,
                            'status' => 'active',
                            'is_default' => isset($variantData['is_default']) && $variantData['is_default'] == 1 ? 1 : 0,
                        ]);

                        $newVariantIds[] = $productVariant->id;
                    }

                    // Process attributes
                    $attributes = json_decode($variantData['attributes'], true);
                    if (json_last_error() === JSON_ERROR_NONE && is_array($attributes)) {
                        foreach ($attributes as $attr) {
                            $value = trim($attr['value']);
                            if (!empty($value)) {
                                // Create or find attribute value
                                $attributeValue = VariantAttributeValue::firstOrCreate(
                                    [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => $value,
                                    ],
                                    [
                                        'status' => 'active',
                                        'created_at' => now(),
                                        'updated_at' => now(),
                                    ]
                                );

                                // Link variant to attribute value via combination
                                VariantCombination::create([
                                    'variant_id' => $existingVariant ? $existingVariant->id : $productVariant->id,
                                    'attribute_value_id' => $attributeValue->id,
                                ]);
                            }
                        }
                    } else {
                        Log::error("Invalid JSON attributes for variant: {$variantData['name']}");
                    }
                }

                // Ensure only one variant is default
                $defaultVariant = null;
                foreach ($data['variants'] as $index => $variantData) {
                    if (isset($variantData['is_default']) && $variantData['is_default'] == 1) {
                        $defaultVariant = $variantData;
                        break;
                    }
                }

                // If no default is set, make the first variant default
                if (!$defaultVariant && !empty($data['variants'])) {
                    $defaultVariant = $data['variants'][0];
                }

                if ($defaultVariant) {
                    ProductVariant::where('product_id', $product->id)
                        ->where('slug', '!=', $defaultVariant['slug'])
                        ->update(['is_default' => 0]);
                    ProductVariant::where('product_id', $product->id)
                        ->where('slug', $defaultVariant['slug'])
                        ->update(['is_default' => 1]);
                }

                // Delete variants that are no longer in the data
                $variantsToDelete = array_diff($existingVariantIds, $newVariantIds);
                ProductVariant::whereIn('id', $variantsToDelete)->each(function ($variant) {
                    if ($variant->image && Storage::disk('public')->exists($variant->image)) {
                        Storage::disk('public')->delete($variant->image);
                    }
                    $variant->combinations()->delete();
                    $variant->delete();
                });
            } else {
                // For simple product, update or create the variant
                $existingVariant = $product->variants()->first();  // Lấy variant đầu tiên

                $image = $request->hasFile('image')
                    ? $this->moveImageToUploadsProducts($request->file('image'))
                    : ($existingVariant ? $existingVariant->image : null);

                $sku = $existingVariant ? $existingVariant->sku : (Str::slug($product->name) . '-simple-' . Str::random(6));

                // Determine slug: keep old slug if name unchanged, otherwise generate new unique slug
                $slug = $existingVariant ? $existingVariant->slug : Str::slug($product->name);
                if (!$existingVariant || $nameChanged) {
                    $baseSlug = Str::slug($product->name);
                    $slug = $baseSlug;
                    if (!$existingVariant || ($existingVariant && $existingVariant->slug !== $baseSlug)) {
                        $counter = 1;
                        while (ProductVariant::where('slug', $slug)->where('id', '!=', $existingVariant ? $existingVariant->id : null)->exists()) {
                            $slug = $baseSlug . '-' . $counter++;
                        }
                    }
                }

                $variantData = [
                    'product_id' => $product->id,
                    'sku' => $sku,
                    'name' => $product->name,
                    'slug' => $slug,
                    'stock' => $data['stock'] ?? 0,
                    'purchase_price' => $data['purchase_price'] ?? 0,
                    'selling_price' => $data['selling_price'] ?? 0,
                    'discount_price' => $data['discount_price'] ?? null,
                    'image' => $image,
                    'status' => 'active',
                    'is_default' => 1,
                ];

                if ($existingVariant) {
                    $existingVariant->update($variantData);
                } else {
                    ProductVariant::create($variantData);
                }

                // Handle product attributes for simple product
                $product->attributes()->delete();
                if (!empty($data['product_attributes'])) {
                    foreach ($data['product_attributes'] as $index => $attr) {
                        if (!empty($attr['attribute_type_id'])) {
                            $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                            if ($attributeType) {
                                // Log attribute data for debugging
                                Log::info("Processing attribute for product ID {$product->id}, index {$index}", [
                                    'attribute_type_id' => $attr['attribute_type_id'],
                                    'value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                ]);

                                ProductAttribute::create([
                                    'product_id' => $product->id,
                                    'attribute_name' => $attributeType->name,
                                    'attribute_value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                ]);
                            } else {
                                Log::warning("Attribute type ID {$attr['attribute_type_id']} not found for product ID {$product->id}");
                            }
                        } else {
                            Log::warning("Missing attribute_type_id for product ID {$product->id}, index {$index}");
                        }
                    }
                } else {
                    Log::info("No product attributes provided for product ID {$product->id}");
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product updated successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to update product: ' . $e->getMessage());
            return redirect()
                ->back()
                ->withInput()
                ->withErrors(['error' => 'Failed to update product: ' . $e->getMessage()]);
        }
    }

    public function destroy(Product $product)
    {
        foreach ($product->variants as $variant) {
            if ($variant->image && Storage::disk('public')->exists($variant->image)) {
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
