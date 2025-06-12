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
        $categories = Category::where('type', 1)->where('status', 'active')->get();
        $attributeTypes = VariantAttributeType::all();
        return view('admin.products.create', compact('categories', 'attributeTypes'));
    }

    public function store(StoreProductRequest $request)
    {
        try {
            DB::beginTransaction();

            $productData = [
                'name' => $request->name,
                'slug' => Str::slug($request->name) . '-' . time(),
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months ?? 12,
                'description' => $request->description,
                'content' => $request->content,
                'is_featured' => $request->has('is_featured') ? 1 : 0,
                'status' => 'active',
                'views' => 0,
            ];

            $product = Product::create($productData);

            // Save specifications if any
            if ($request->has('specifications') && is_array($request->specifications)) {
                foreach ($request->specifications as $spec) {
                    if (!empty($spec['value'])) {
                        $product->specifications()->create([
                            'specification_id' => $spec['specification_id'],
                            'value' => $spec['value']
                        ]);
                    }
                }
            }

            // Validate attributes have at least one valid attribute
            $validAttributes = [];
            $attributes = $request->input('attributes', []);
            if (!empty($attributes)) {
                foreach ($attributes as $index => $attribute) {
                    if (!empty($attribute['attribute_type_id']) && !empty($attribute['selected_values'])) {
                        $validAttributes[] = [
                            'attribute_type_id' => $attribute['attribute_type_id'],
                            'selected_values' => $attribute['selected_values']
                        ];
                    }
                }
            }
            if (empty($validAttributes)) {
                throw new \Exception('At least one attribute with values is required to create variants.');
            }

            // Create variants automatically from attributes
            $this->createVariantsFromAttributes($product, $validAttributes, $request);

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

            $oldCategoryId = $product->category_id;
            $newCategoryId = $request->category_id;
            $categoryChanged = $request->has('category_changed') && $request->category_changed === 'true';

            // If category has changed, handle deletions
            if ($categoryChanged && $oldCategoryId !== $newCategoryId) {
                // Force delete all specifications
                $product->specifications()->forceDelete();

                // Get all variant IDs (including soft deleted ones)
                $variantIds = $product->variants()->withTrashed()->pluck('id')->toArray();

                // Force delete all variant combinations
                VariantCombination::whereIn('variant_id', $variantIds)->forceDelete();

                // Soft delete all variants
                $product->variants()->delete();

                // Handle image deletion
                if ($request->has('images_to_delete')) {
                    $imagesToDelete = is_array($request->images_to_delete) ? $request->images_to_delete : json_decode($request->images_to_delete, true);
                    if (is_array($imagesToDelete)) {
                        foreach ($imagesToDelete as $imagePath) {
                            $fullPath = public_path($imagePath);
                            if (file_exists($fullPath)) {
                                @unlink($fullPath);
                            }
                        }
                    }
                }
            } else {
                // Handle normal image deletion (not category change)
                if ($request->has('images_to_delete')) {
                    $imagesToDelete = is_array($request->images_to_delete) ? $request->images_to_delete : json_decode($request->images_to_delete, true);
                    if (is_array($imagesToDelete)) {
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

            // Only process specifications and variants if category hasn't changed
            if (!$categoryChanged) {
                // Handle specifications
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
                    $variantsToDelete = is_array($request->variants_to_delete) ? $request->variants_to_delete : json_decode($request->variants_to_delete, true) ?? [];

                    // Hard delete marked variants
                    foreach ($variantsToDelete as $variantId) {
                        $variant = ProductVariant::withTrashed()->find($variantId);
                        if ($variant) {
                            $variant->combinations()->forceDelete();
                            // Delete variant images
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
                            $variant->forceDelete();
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
                                    if (!empty($attr['attribute_type_id']) && !empty($attr['selected_values'])) {
                                        foreach ($attr['selected_values'] as $valueId) {
                                            // Create link between variant and attribute value
                                            VariantCombination::create([
                                                'variant_id' => $variant->id,
                                                'attribute_value_id' => $valueId,
                                            ]);
                                        }
                                    }
                                }
                            }
                        } else {
                            $variant = ProductVariant::find($variantData['id']);
                            if ($variant) {
                                // Only delete and recreate combinations if attributes have changed
                                $hasAttributeChanges = false;
                                if (isset($variantData['attributes']) && is_array($variantData['attributes'])) {
                                    $currentCombinations = $variant->combinations()->pluck('attribute_value_id')->toArray();
                                    $newValueIds = collect($variantData['attributes'])->flatMap(function($attr) {
                                        return $attr['selected_values'] ?? [];
                                    })->toArray();

                                    sort($currentCombinations);
                                    sort($newValueIds);

                                    if (count($currentCombinations) !== count($newValueIds) || 
                                        implode(',', $currentCombinations) !== implode(',', $newValueIds)) {
                                        $hasAttributeChanges = true;
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
                                        if (!empty($attr['attribute_type_id']) && !empty($attr['selected_values'])) {
                                            foreach ($attr['selected_values'] as $valueId) {
                                                // Create link between variant and attribute value
                                                VariantCombination::create([
                                                    'variant_id' => $variant->id,
                                                    'attribute_value_id' => $valueId,
                                                ]);
                                            }
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
                }
            }

            // Ensure at least one default variant
            $this->ensureDefaultVariant($product);

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
        $categories = Category::where('type', 1)->where('status', 'active')->get();
        $categoryId = $product->category_id;

        // Get specifications belonging to product's category
        $specifications = Specification::where('status', 'active')
            ->whereJsonContains('category_ids', (string)$categoryId)
            ->get();

        // Get product specification values (by specification_id)
        $productSpecs = ProductSpecification::where('product_id', $product->id)
            ->get()
            ->keyBy('specification_id');

        // Prepare data array for view
        $specificationsData = $specifications->map(function($spec) use ($productSpecs) {
            $value = '';
            if (isset($productSpecs[$spec->id])) {
                $specValue = $productSpecs[$spec->id]->value;
                $value = is_array($specValue) ? implode(', ', $specValue) : $specValue;
            }
            
            return [
                'id' => $spec->id,
                'name' => is_array($spec->name) ? implode(', ', $spec->name) : $spec->name,
                'value' => $value
            ];
        });

        // Get variant attributes by category
        $attributeTypes = VariantAttributeType::where('status', 'active')
            ->whereJsonContains('category_ids', (string)$categoryId)
            ->with(['attributeValues' => function($query) {
                $query->where('status', 'active');
            }])
            ->get();

        // Load variants with combinations and images
        $product->load(['variants' => function($query) {
            $query->whereNull('deleted_at')
                ->with(['combinations.attributeValue.attributeType']);
        }]);

        // Prepare attributeValues for form
        $attributeValues = [];
        if ($product->variants->isNotEmpty()) {
            $attributeMap = [];
            foreach ($product->variants as $variant) {
                foreach ($variant->combinations as $comb) {
                    $typeId = $comb->attributeValue->attribute_type_id;
                    $valueId = $comb->attribute_value_id;
                    
                    if (!isset($attributeMap[$typeId])) {
                        $attributeMap[$typeId] = [
                            'attribute_type_id' => $typeId,
                            'selected_values' => []
                        ];
                    }
                    
                    if (!in_array($valueId, $attributeMap[$typeId]['selected_values'])) {
                        $attributeMap[$typeId]['selected_values'][] = $valueId;
                    }
                }
            }
            
            // Sort by attribute type ID to ensure consistent order
            ksort($attributeMap);
            $attributeValues = array_values($attributeMap);
        }

        // Log the prepared data for debugging
        Log::info('Edit product data:', [
            'product_id' => $product->id,
            'specifications' => $specificationsData->toArray(),
            'attribute_values' => $attributeValues,
            'attribute_types' => $attributeTypes->toArray()
        ]);

        return view('admin.products.edit', compact(
            'product',
            'categories',
            'attributeTypes',
            'specificationsData',
            'attributeValues'
        ));
    }

    public function getAttributeValues($attributeTypeId)
    {
        $values = \App\Models\VariantAttributeValue::where('attribute_type_id', $attributeTypeId)
            ->where('status', 'active')
            ->get()
            ->map(function($value) {
                // Đảm bảo trả về đúng cấu trúc mà view đang mong đợi
                $displayValue = $value->value;
                if (is_string($displayValue) && json_decode($displayValue) !== null) {
                    $displayValue = json_decode($displayValue, true);
                }
                if (is_array($displayValue)) {
                    $displayValue = implode(', ', $displayValue);
                }

                $hexValue = $value->hex;
                if (is_string($hexValue) && json_decode($hexValue) !== null) {
                    $hexValue = json_decode($hexValue, true);
                }
                if (is_array($hexValue) && !empty($hexValue)) {
                    $hexValue = implode(', ', $hexValue);
                }
                
                return [
                    'id' => $value->id,
                    'value' => $displayValue,
                    'hex' => $hexValue,
                    'attribute_type_id' => $value->attribute_type_id
                ];
            });

        Log::info('Attribute values being returned:', [
            'attribute_type_id' => $attributeTypeId,
            'values' => $values->toArray()
        ]);
        
        return response()->json($values);
    }

    private function generateUniqueSku($productId)
    {
        do {
            $random = str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
            $sku = 'SP-' . $random;
        } while (ProductVariant::where('sku', $sku)->exists());

        return $sku;
    }

    private function generateCombinations($arrays) 
    {
        if (empty($arrays)) {
            return [];
        }

        // Bắt đầu với mảng đầu tiên
        $result = array_map(function($item) {
            return [$item];
        }, $arrays[0]);

        // Lặp qua các mảng còn lại để tạo tổ hợp
        for ($i = 1; $i < count($arrays); $i++) {
            $temp = [];
            foreach ($result as $existing) {
                foreach ($arrays[$i] as $item) {
                    $temp[] = array_merge($existing, [$item]);
                }
            }
            $result = $temp;
        }
        
        return $result;
    }

    private function createVariantsFromAttributes($product, $attributes, $request)
    {
        try {
            Log::info('Starting createVariantsFromAttributes with data:', [
                'product_id' => $product->id,
                'attributes' => $attributes
            ]);

            if (!is_array($attributes)) {
                throw new \Exception('Attributes must be an array');
            }

            $attributeValueIds = [];
            foreach ($attributes as $attribute) {
                if (!isset($attribute['attribute_type_id']) || empty($attribute['selected_values'])) {
                    continue;
                }

                $selectedValues = is_array($attribute['selected_values']) ? 
                    $attribute['selected_values'] : 
                    [$attribute['selected_values']];

                $attrValues = VariantAttributeValue::select('id', 'value', 'attribute_type_id')
                    ->whereIn('id', $selectedValues)
                    ->where('attribute_type_id', $attribute['attribute_type_id'])
                    ->get();

                if ($attrValues->isNotEmpty()) {
                    $values = [];
                    foreach ($attrValues as $value) {
                        // Decode JSON value if it's a JSON string
                        $displayValue = $value->value;
                        if (is_string($displayValue) && json_decode($displayValue) !== null) {
                            $displayValue = json_decode($displayValue, true);
                        }
                        
                        // Convert array to string if necessary
                        if (is_array($displayValue)) {
                            $displayValue = implode(', ', $displayValue);
                        }

                        $values[] = [
                            'id' => $value->id,
                            'attribute_type_id' => $value->attribute_type_id,
                            'display_value' => $displayValue
                        ];
                    }
                    if (!empty($values)) {
                        $attributeValueIds[] = $values;
                    }
                }
            }

            $combinations = $this->generateCombinations($attributeValueIds);
            
            Log::info('Generated combinations:', ['combinations' => $combinations]);

            foreach ($combinations as $index => $combination) {
                $variantAttributeValues = [];
                $attributeIds = [];
                
                foreach ($combination as $attrValue) {
                    if (isset($attrValue['display_value'])) {
                        $variantAttributeValues[] = $attrValue['display_value'];
                    }
                    if (isset($attrValue['id'])) {
                        $attributeIds[] = $attrValue['id'];
                    }
                }

                $variantName = $product->name;
                if (!empty($variantAttributeValues)) {
                    $variantName .= ' - ' . implode(' - ', $variantAttributeValues);
                }

                $slug = Str::slug($variantName) . '-' . time() . '-' . $index;
                $sku = $this->generateUniqueSku($product->id);
                
                $imagePaths = [];
                if (isset($request->variants[$index]) && $request->hasFile("variants.{$index}.images")) {
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

                $variantData = $request->variants[$index] ?? [];
                
                $productVariant = ProductVariant::create([
                    'product_id' => $product->id,
                    'name' => $variantName,
                    'slug' => $slug,
                    'sku' => $sku,
                    'stock' => $variantData['stock'] ?? 0,
                    'purchase_price' => $variantData['purchase_price'] ?? 0,
                    'selling_price' => $variantData['selling_price'] ?? 0,
                    'images' => json_encode($imagePaths),
                    'is_default' => isset($variantData['is_default']) && $variantData['is_default'] ? 1 : ($index === 0 ? 1 : 0),
                ]);

                foreach ($attributeIds as $attributeId) {
                    VariantCombination::create([
                        'variant_id' => $productVariant->id,
                        'attribute_value_id' => $attributeId
                    ]);
                }
            }

        } catch (\Exception $e) {
            Log::error('Error in createVariantsFromAttributes: ' . $e->getMessage());
            Log::error('Full error details:', [
                'attributes' => $attributes,
                'trace' => $e->getTraceAsString()
            ]);
            throw $e;
        }
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
