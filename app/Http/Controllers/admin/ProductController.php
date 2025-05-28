<?php

namespace App\Http\Controllers\admin;

use Illuminate\Support\Facades\Log;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use App\Models\ProductVariant;
use App\Models\VariantCombination;
use Illuminate\Support\Facades\DB;
use App\Models\ProductSpecification;
use App\Models\VariantAttributeType;
use App\Models\VariantAttributeValue;
use App\Http\Requests\admin\StoreProductRequest;
use App\Models\Specification;
use App\Http\Requests\admin\UpdateProductRequest;

class ProductController
{
    public function index()
    {
        $products = Product::with([
            'category', 
            'variants',
            'defaultVariant'
        ])->latest()->paginate(10);
        
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

            $productData = [
                'name' => $request->name,
                'slug' => Str::slug($request->name),
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months ?? 12,
                'description' => $request->description,
                'content' => $request->content,
                'is_featured' => $request->has('is_featured') ? 1 : 0,
                'status' => 'active',
                'views' => 0, // Set default views to 0
            ];

            $product = Product::create($productData);

            // Save specifications
            if ($request->has('specifications')) {
                foreach ($request->specifications as $spec) {
                    if (!empty($spec['value']) && !empty($spec['specification_id'])) {
                        ProductSpecification::create([
                            'product_id' => $product->id,
                            'specification_id' => $spec['specification_id'],
                            'value' => $spec['value'],
                        ]);
                    }
                }
            }

            // Validate attributes have at least one valid attribute
            $validAttributes = [];
            $attributes = $request->input('attributes', []);
            if (!empty($attributes)) {
                foreach ($attributes as $index => $attribute) {
                    if (!empty($attribute['attribute_type_id']) && !empty($attribute['value'])) {
                        $validAttributes[] = $attribute;
                    }
                }
            }
            if (empty($validAttributes)) {
                throw new \Exception('At least one attribute is required to create variants.');
            }

            // Create variants
            if ($request->has('variants') && !empty($request->variants)) {
                // If variants are created from form
                foreach ($request->variants as $index => $variant) {
                    if (empty($variant['name'])) {
                        continue;
                    }

                    $sku = 'SP-' . str_pad($product->id . ($index + 1), 5, '0', STR_PAD_LEFT);

                    // Handle image upload
                    $imagePaths = [];
                    if ($request->hasFile("variants.{$index}.images")) {
                        $destinationPath = public_path('uploads/products');
                        if (!file_exists($destinationPath)) {
                            mkdir($destinationPath, 0777, true);
                        }
                        foreach ($request->file("variants.{$index}.images") as $image) {
                            if ($image->isValid()) {
                                $filename = time() . '_' . $index . '_' . $image->getClientOriginalName();
                                $image->move($destinationPath, $filename);
                                $path = 'uploads/products/' . $filename;
                                $imagePaths[] = $path;
                            }
                        }
                    }

                    $productVariant = ProductVariant::create([
                        'product_id' => $product->id,
                        'name' => $variant['name'],
                        'slug' => Str::slug($variant['name']),
                        'sku' => $sku,
                        'stock' => $variant['stock'] ?? 0,
                        'purchase_price' => $variant['purchase_price'] ?? 0,
                        'selling_price' => $variant['selling_price'] ?? 0,
                        'images' => json_encode($imagePaths),
                        'is_default' => isset($variant['is_default']) && $variant['is_default'] ? 1 : 0,
                    ]);

                    // Save variant attributes
                    if (isset($variant['attributes']) && is_array($variant['attributes'])) {
                        foreach ($variant['attributes'] as $attr) {
                            if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                                $attrValue = VariantAttributeValue::firstOrCreate(
                                    [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => array_map('trim', explode(',', $attr['value'])),
                                    ],
                                    [
                                        'hex' => isset($attr['hex']) ? array_map('trim', explode(',', $attr['hex'])) : [],
                                        'status' => 'active',
                                    ]
                                );
                                VariantCombination::create([
                                    'variant_id' => $productVariant->id,
                                    'attribute_value_id' => $attrValue->id,
                                ]);
                            }
                        }
                    }
                }
            } else {
                // Create variants automatically from attributes
                $this->createVariantsFromAttributes($product, $validAttributes, $request);
            }

            // Ensure at least one default variant
            $this->ensureDefaultVariant($product);

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product created successfully!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error creating product: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());

            return back()->withInput()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        try {
            DB::beginTransaction();

            // Handle marked images for deletion
            if ($request->has('images_to_delete')) {
                $imagesToDelete = is_array($request->images_to_delete) ? $request->images_to_delete : [];
                foreach ($imagesToDelete as $imagePath) {
                    // Xóa ảnh khỏi variant
                    $variants = $product->variants;
                    foreach ($variants as $variant) {
                        $images = json_decode($variant->images, true);
                        if (is_array($images)) {
                            $images = array_filter($images, function($img) use ($imagePath) {
                                return $img !== $imagePath;
                            });
                            $variant->images = json_encode(array_values($images));
                            $variant->save();
                        }
                    }

                    // Xóa file vật lý nếu không còn variant nào sử dụng
                    $imageVariantsCount = ProductVariant::where('images', 'like', '%"' . addslashes($imagePath) . '"%')->count();
                    if ($imageVariantsCount == 0) {
                        $fullPath = public_path($imagePath);
                        if (file_exists($fullPath)) {
                            @unlink($fullPath);
                        }
                    }
                }
            }

            $oldProductName = $product->name; // Save old product name
            $data = [
                'name' => $request->name,
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months ?? 12,
                'description' => $request->description,
                'content' => $request->content,
                'is_featured' => $request->has('is_featured') ? 1 : 0,
                'status' => $request->status ?? 'active',
            ];

            // Update slug if name changes
            if ($oldProductName !== $request->name) {
                $data['slug'] = Str::slug($request->name);
            }
            
            $product->update($data);

            // Update variant names if product name changed
            if ($oldProductName !== $request->name) {
                foreach ($product->variants as $variant) {
                    $variantName = $variant->name;
                    $parts = explode(' - ', $variantName);
                    array_shift($parts); // Remove old product name
                    $newVariantName = $request->name . ' - ' . implode(' - ', $parts);
                    
                    $variant->update([
                        'name' => $newVariantName,
                        'slug' => Str::slug($newVariantName)
                    ]);
                }
            }

            // Handle specifications
            // Always forceDelete all old specifications
            $product->specifications()->forceDelete();
            if ($request->has('specifications')) {
                foreach ($request->specifications as $spec) {
                    if (!empty($spec['value']) && !empty($spec['specification_id'])) {
                        ProductSpecification::create([
                            'product_id' => $product->id,
                            'specification_id' => $spec['specification_id'],
                            'value' => $spec['value'],
                        ]);
                    }
                }
            }

            // Handle variants
            if ($request->has('variants')) {
                $variantsToDelete = is_array($request->variants_to_delete) ? $request->variants_to_delete : [];
                // Get all old variant ids of the product (including soft deleted)
                $oldVariantIds = ProductVariant::withTrashed()->where('product_id', $product->id)->pluck('id')->toArray();
                // Get all old attribute_value_ids of the product
                $oldAttrValueIds = \App\Models\VariantCombination::whereIn('variant_id', $oldVariantIds)->pluck('attribute_value_id')->toArray();

                // Hard delete marked variants
                foreach ($variantsToDelete as $variantId) {
                    $variant = ProductVariant::withTrashed()->find($variantId);
                    if ($variant) {
                        $variant->combinations()->forceDelete();
                        // Delete variant images (only physically delete if no other variants use them)
                        $images = json_decode($variant->images, true);
                        if (is_array($images)) {
                            foreach ($images as $img) {
                                $imgPath = public_path($img);
                                $imageVariantsCount = ProductVariant::where('images', 'like', '%"' . addslashes($img) . '"%')
                                    ->where('id', '!=', $variant->id)
                                    ->count();
                                if ($imageVariantsCount == 0 && file_exists($imgPath)) {
                                    @unlink($imgPath);
                                }
                            }
                        }
                        $variant->delete();
                    }
                }

                // Update or create new variants
                foreach ($request->variants as $index => $variantData) {
                    $variantName = $variantData['name'];
                    if ($oldProductName !== $request->name) {
                        // Extract attributes from old variant name
                        $parts = explode(' - ', $variantName);
                        array_shift($parts); // Remove old product name
                        // Create new variant name with new product name
                        $variantName = $request->name . ' - ' . implode(' - ', $parts);
                    }
                    $variantSlug = Str::slug($variantName);

                    if (empty($variantData['id'])) {
                        $sku = $this->generateUniqueSku($product->id);
                        $variant = ProductVariant::create([
                            'product_id' => $product->id,
                            'name' => $variantName,
                            'slug' => $variantSlug,
                            'sku' => $sku,
                            'stock' => $variantData['stock'] ?? 0,
                            'purchase_price' => $variantData['purchase_price'] ?? 0,
                            'selling_price' => $variantData['selling_price'] ?? 0,
                            'is_default' => isset($variantData['is_default']) && $variantData['is_default'] ? 1 : 0,
                        ]);

                        // Create combinations for new variant
                        if (isset($variantData['attributes']) && is_array($variantData['attributes'])) {
                            foreach ($variantData['attributes'] as $attr) {
                                if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                                    $attrValue = VariantAttributeValue::firstOrCreate(
                                        [
                                            'attribute_type_id' => $attr['attribute_type_id'],
                                            'value' => array_map('trim', explode(',', $attr['value'])),
                                        ],
                                        [
                                            'hex' => isset($attr['hex']) ? array_map('trim', explode(',', $attr['hex'])) : [],
                                            'status' => 'active',
                                        ]
                                    );
                                    VariantCombination::create([
                                        'variant_id' => $variant->id,
                                        'attribute_value_id' => $attrValue->id,
                                    ]);
                                }
                            }
                        }
                    } else {
                        $variant = ProductVariant::find($variantData['id']);
                        if ($variant) {
                            // Only delete and recreate combinations if attributes have changed
                            $hasAttributeChanges = false;
                            if (isset($variantData['attributes']) && is_array($variantData['attributes'])) {
                                $currentCombinations = $variant->combinations()->with('attributeValue')->get();
                                $newAttributes = collect($variantData['attributes'])->map(function($attr) {
                                    return [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => array_map('trim', explode(',', $attr['value'])),
                                        'hex' => isset($attr['hex']) ? array_map('trim', explode(',', $attr['hex'])) : [],
                                    ];
                                })->toArray();

                                if (count($currentCombinations) !== count($newAttributes)) {
                                    $hasAttributeChanges = true;
                                } else {
                                    foreach ($currentCombinations as $index => $combination) {
                                        $newAttr = $newAttributes[$index] ?? null;
                                        if (!$newAttr || 
                                            $combination->attributeValue->attribute_type_id != $newAttr['attribute_type_id'] ||
                                            $combination->attributeValue->value != $newAttr['value'] ||
                                            $combination->attributeValue->hex != $newAttr['hex']) {
                                            $hasAttributeChanges = true;
                                            break;
                                        }
                                    }
                                }
                            }

                            if ($hasAttributeChanges) {
                                $variant->combinations()->forceDelete();
                            }

                            if ($request->hasFile("variants.{$index}.images")) {
                                $oldImages = json_decode($variant->images, true);
                                if (is_array($oldImages)) {
                                    foreach ($oldImages as $img) {
                                        $imgPath = public_path($img);
                                        $imageVariantsCount = ProductVariant::where('images', 'like', '%"' . addslashes($img) . '"%')
                                            ->where('id', '!=', $variant->id)
                                            ->count();
                                        if ($imageVariantsCount == 0 && file_exists($imgPath)) {
                                            @unlink($imgPath);
                                        }
                                    }
                                }
                            }

                            $variant->update([
                                'name' => $variantName,
                                'slug' => $variantSlug,
                                'stock' => $variantData['stock'] ?? 0,
                                'purchase_price' => $variantData['purchase_price'] ?? 0,
                                'selling_price' => $variantData['selling_price'] ?? 0,
                                'is_default' => isset($variantData['is_default']) && $variantData['is_default'] ? 1 : 0,
                            ]);

                            // Recreate combinations only if attributes have changed
                            if ($hasAttributeChanges && isset($variantData['attributes']) && is_array($variantData['attributes'])) {
                                foreach ($variantData['attributes'] as $attr) {
                                    if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                                        $attrValue = VariantAttributeValue::firstOrCreate(
                                            [
                                                'attribute_type_id' => $attr['attribute_type_id'],
                                                'value' => array_map('trim', explode(',', $attr['value'])),
                                            ],
                                            [
                                                'hex' => isset($attr['hex']) ? array_map('trim', explode(',', $attr['hex'])) : [],
                                                'status' => 'active',
                                            ]
                                        );
                                        VariantCombination::create([
                                            'variant_id' => $variant->id,
                                            'attribute_value_id' => $attrValue->id,
                                        ]);
                                    }
                                }
                            }
                        }
                    }

                    // Handle new image upload
                    if ($request->hasFile("variants.{$index}.images")) {
                        $imagePaths = [];
                        $destinationPath = public_path('uploads/products');
                        if (!file_exists($destinationPath)) {
                            mkdir($destinationPath, 0777, true);
                        }
                        foreach ($request->file("variants.{$index}.images") as $image) {
                            if ($image->isValid()) {
                                $filename = time() . '_' . $index . '_' . $image->getClientOriginalName();
                                $image->move($destinationPath, $filename);
                                $path = 'uploads/products/' . $filename;
                                $imagePaths[] = $path;
                            }
                        }
                        $variant->images = json_encode($imagePaths);
                        $variant->save();
                    }
                }

                // HARD DELETE old attribute_value_ids if no combinations use them
                foreach ($oldAttrValueIds as $attrValueId) {
                    $count = \App\Models\VariantCombination::where('attribute_value_id', $attrValueId)->count();
                    if ($count == 0) {
                        \App\Models\VariantAttributeValue::withTrashed()->where('id', $attrValueId)->forceDelete();
                    }
                }
            }

            // Ensure at least one default variant
            $this->ensureDefaultVariant($product);

            // Trong hàm update, sau khi xử lý variants_to_delete và images_to_delete, thêm xử lý attributes_to_delete nếu có
            if ($request->has('attributes_to_delete')) {
                $attributesToDelete = is_array($request->attributes_to_delete) ? $request->attributes_to_delete : [];
                foreach ($attributesToDelete as $attrId) {
                    // Xóa thật attribute value (nếu không còn combination nào dùng)
                    $count = \App\Models\VariantCombination::where('attribute_value_id', $attrId)->count();
                    if ($count == 0) {
                        \App\Models\VariantAttributeValue::withTrashed()->where('id', $attrId)->forceDelete();
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product updated successfully!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error updating product: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return back()->withInput()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }

    public function edit(Product $product)
    {
        $categories = Category::where('type', 1)->get();
        $categoryId = $product->category_id;

        // Get specifications belonging to product's category
        $specifications = Specification::where('status', 'active')
            ->whereJsonContains('category_ids', (string)$categoryId)
            ->get();

        // Get product specification values (by specification_id)
        $productSpecs = ProductSpecification::where('product_id', $product->id)->get()->keyBy('specification_id');

        // Prepare data array for view
        $specificationsData = $specifications->map(function($spec) use ($productSpecs) {
            return [
                'id' => $spec->id,
                'name' => $spec->name,
                'value' => $productSpecs[$spec->id]->value ?? '',
            ];
        });

        // Get variant attributes by category
        $attributeTypes = VariantAttributeType::where('status', 'active')
            ->whereJsonContains('category_ids', (string)$categoryId)
            ->get();

        // Load variants with combinations and images
        $product->load(['variants' => function($query) {
            $query->whereNull('deleted_at')->with(['combinations.attributeValue.attributeType']);
        }]);

        // Prepare attributeValues for form (gộp tất cả giá trị của từng attribute_type_id từ tất cả biến thể)
        $attributeValues = [];
        if ($product->variants->isNotEmpty()) {
            $attributeMap = [];
            foreach ($product->variants as $variant) {
                foreach ($variant->combinations as $comb) {
                    $typeId = $comb->attributeValue->attribute_type_id;
                    // Value
                    $value = $comb->attributeValue->value;
                    if (is_string($value)) {
                        $decoded = json_decode($value, true);
                        $value = is_array($decoded) ? $decoded : [$value];
                    }
                    // Hex
                    $hex = $comb->attributeValue->hex;
                    if (is_string($hex)) {
                        $decoded = json_decode($hex, true);
                        $hex = is_array($decoded) ? $decoded : [$hex];
                    }
                    // Gộp value/hex theo typeId
                    if (!isset($attributeMap[$typeId])) {
                        $attributeMap[$typeId] = ['value' => [], 'hex' => []];
                    }
                    foreach ($value as $v) {
                        if ($v !== '' && !in_array($v, $attributeMap[$typeId]['value'])) {
                            $attributeMap[$typeId]['value'][] = $v;
                        }
                    }
                    foreach ($hex as $h) {
                        if ($h !== '' && !in_array($h, $attributeMap[$typeId]['hex'])) {
                            $attributeMap[$typeId]['hex'][] = $h;
                        }
                    }
                }
            }
            // Đưa về dạng mảng cho view
            foreach ($attributeMap as $typeId => $data) {
                $attributeValues[] = [
                    'attribute_type_id' => $typeId,
                    'value' => $data['value'],
                    'hex' => $data['hex'],
                    ];
            }
        }

        return view('admin.products.edit', compact(
            'product',
            'categories',
            'attributeTypes',
            'specificationsData',
            'attributeValues'
        ));
    }

    private function generateUniqueSku($productId)
    {
        do {
            $random = str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
            $sku = 'SP-' . $random;
        } while (ProductVariant::where('sku', $sku)->exists());

        return $sku;
    }

    private function createVariantsFromAttributes($product, $attributes, $request)
    {
        // Create all combinations from attributes
        $attributeValueIds = [];
        foreach ($attributes as $attribute) {
            $values = array_map('trim', explode(',', $attribute['value']));
            $hexes = !empty($attribute['hex']) ? array_map('trim', explode(',', $attribute['hex'])) : [];

            while (count($hexes) < count($values)) {
                $hexes[] = null;
            }

            $attrValues = [];
            foreach ($values as $i => $value) {
                if (!empty($value)) {
                    $attrValue = VariantAttributeValue::firstOrCreate(
                        [
                            'attribute_type_id' => $attribute['attribute_type_id'],
                            'value' => array_map('trim', explode(',', $value)),
                        ],
                        [
                            'hex' => $hexes[$i] ?? null,
                            'status' => 'active',
                        ]
                    );
                    $attrValues[] = $attrValue;
                }
            }
            $attributeValueIds[] = $attrValues;
        }

        // Create combinations
        $combinations = $this->generateCombinations($attributeValueIds);

        foreach ($combinations as $index => $combination) {
            $variantName = $product->name . ' - ' . implode(' - ', array_map(function ($attr) {
                return $attr->value;
            }, $combination));

            $sku = $this->generateUniqueSku($product->id);

            $productVariant = ProductVariant::create([
                'product_id' => $product->id,
                'name' => $variantName,
                'slug' => Str::slug($variantName),
                'sku' => $sku,
                'stock' => 0,
                'purchase_price' => 0,
                'selling_price' => 0,
                'images' => json_encode([]),
                'is_default' => $index === 0 ? 1 : 0,
            ]);

            // Save attribute combinations
            foreach ($combination as $attrValue) {
                VariantCombination::create([
                    'variant_id' => $productVariant->id,
                    'attribute_value_id' => $attrValue->id,
                ]);
            }
        }
    }

    private function generateCombinations($arrays)
    {
        if (empty($arrays)) {
            return [];
        }

        if (count($arrays) === 1) {
            return array_map(function ($item) {
                return [$item];
            }, $arrays[0]);
        }

        $result = [];
        $first = array_shift($arrays);
        $remainingCombinations = $this->generateCombinations($arrays);

        foreach ($first as $item) {
            foreach ($remainingCombinations as $combination) {
                $result[] = array_merge([$item], $combination);
            }
        }

        return $result;
    }

    private function ensureDefaultVariant($product)
    {
        $hasDefault = ProductVariant::where('product_id', $product->id)
            ->where('is_default', 1)
            ->exists();

        if (!$hasDefault) {
            $firstVariant = ProductVariant::where('product_id', $product->id)->first();
            if ($firstVariant) {
                $firstVariant->update(['is_default' => 1]);
            }
        }
    }

    public function trash()
    {
        $products = Product::onlyTrashed()
            ->with([
                'category', 
                'variants',
                'defaultVariant'
            ])
            ->latest()
            ->paginate(10);
        
        return view('admin.products.trash', compact('products'));
    }

    public function restore($id)
    {
        try {
            DB::beginTransaction();
            
            $product = Product::onlyTrashed()->findOrFail($id);
            
            // Restore the product
            $product->restore();
            
            // Restore all related variants
            $product->variants()->onlyTrashed()->restore();
            
            DB::commit();
            
            return redirect()->route('admin.products.trash')
                ->with('success', 'Product restored successfully!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error restoring product: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return back()->withErrors(['error' => 'An error occurred while restoring the product.']);
        }
    }

    public function destroy(Product $product)
    {
        try {
            DB::beginTransaction();
            
            // Soft delete the product
            $product->delete();
            
            DB::commit();
            return redirect()->route('admin.products.index')
                ->with('success', 'Product moved to trash successfully!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error deleting product: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return back()->withErrors(['error' => 'An error occurred while deleting the product.']);
        }
    }

    public function show(Product $product)
    {
        $product->load(['category', 'variants', 'specifications.specification']);
        return view('admin.products.show', compact('product'));
    }
}
