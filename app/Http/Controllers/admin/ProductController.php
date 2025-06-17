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
                throw new \Exception('Cần ít nhất một thuộc tính với giá trị để tạo biến thể.');
            }

            // Create variants automatically from attributes
            $this->createVariantsFromAttributes($product, $validAttributes, $request);

            // Ensure at least one default variant
            $this->ensureDefaultVariant($product);

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Sản phẩm đã được tạo thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Lỗi khi tạo sản phẩm: ' . $e->getMessage());
            Log::error('Chi tiết lỗi: ' . $e->getTraceAsString());
            return back()->withInput()->withErrors(['error' => 'Đã xảy ra lỗi: ' . $e->getMessage()]);
        }
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        try {
            DB::beginTransaction();

            // Log request data for debugging
            Log::info('Product update request:', [
                'product_id' => $product->id,
                'has_variants' => $request->has('variants'),
                'variants_count' => $request->has('variants') ? count($request->variants) : 0,
                'images_to_delete' => $request->images_to_delete ?? 'none',
                'variants_to_delete' => $request->variants_to_delete ?? 'none',
                'has_image_deletions' => $request->has('has_image_deletions') ? $request->has_image_deletions : '0'
            ]);

            // Update product basic information
            $product->update([
                'name' => $request->name,
                'slug' => Str::slug($request->name) . '-' . time(),
                'category_id' => $request->category_id,
                'warranty_months' => $request->warranty_months ?? 12,
                'description' => $request->description,
                'content' => $request->content,
                'is_featured' => $request->has('is_featured') ? 1 : 0,
                'status' => $request->has('status') ? 'active' : 'inactive',
            ]);

            // Handle specifications - clear existing and create new ones
            ProductSpecification::where('product_id', $product->id)->delete();
            if ($request->has('specifications')) {
                $specifications = $request->specifications;
                if (is_array($specifications)) {
                    foreach ($specifications as $spec) {
                        if (!empty($spec['value']) && !empty($spec['specification_id'])) {
                            ProductSpecification::create([
                                'product_id' => $product->id,
                                'specification_id' => $spec['specification_id'],
                                'value' => $spec['value'],
                            ]);
                        }
                    }
                }
            }

            // Handle variants intelligently
            if ($request->has('variants')) {
                $variants = $request->variants;
                if (is_array($variants)) {
                    // Get existing variant IDs from the request
                    $requestedVariantIds = [];
                    $existingVariantIds = $product->variants()->whereNull('deleted_at')->pluck('id')->toArray();
                    
                    foreach ($variants as $index => $variantData) {
                        if (!is_array($variantData)) {
                            continue;
                        }
                        
                        // If variant has an ID, it's an existing variant
                        if (!empty($variantData['id'])) {
                            $requestedVariantIds[] = $variantData['id'];
                            $this->updateExistingVariant($variantData, $request, $index);
                        } else {
                            // This is a new variant
                            $this->createNewVariant($product, $variantData, $request, $index);
                        }
                    }
                    
                    // Handle variants to delete from request
                    $variantsToDelete = [];
                    if ($request->has('variants_to_delete') && !empty($request->variants_to_delete)) {
                        $variantsToDeleteData = $request->variants_to_delete;
                        if (is_string($variantsToDeleteData)) {
                            $variantsToDelete = json_decode($variantsToDeleteData, true) ?: [];
                        } elseif (is_array($variantsToDeleteData)) {
                            $variantsToDelete = $variantsToDeleteData;
                        }
                    }
                    
                    // Also soft delete variants that are no longer in the request
                    $variantsToDelete = array_merge($variantsToDelete, array_diff($existingVariantIds, $requestedVariantIds));
                    
                    if (!empty($variantsToDelete)) {
                        ProductVariant::whereIn('id', $variantsToDelete)->delete();
                        VariantCombination::whereIn('variant_id', $variantsToDelete)->delete();
                    }
                }
            } else {
                // If no variants in request, soft delete all existing variants
                $existingVariantIds = $product->variants()->whereNull('deleted_at')->pluck('id')->toArray();
                if (!empty($existingVariantIds)) {
                    ProductVariant::whereIn('id', $existingVariantIds)->delete();
                    VariantCombination::whereIn('variant_id', $existingVariantIds)->delete();
                }
            }

            // Ensure at least one default variant
            $this->ensureDefaultVariant($product);

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Sản phẩm đã được cập nhật thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Lỗi khi cập nhật sản phẩm: ' . $e->getMessage());
            Log::error('Chi tiết lỗi: ' . $e->getTraceAsString());
            return back()->withInput()->withErrors(['error' => 'Đã xảy ra lỗi: ' . $e->getMessage()]);
        }
    }

    private function updateExistingVariant($variantData, $request, $index)
    {
        $variant = ProductVariant::find($variantData['id']);
        if (!$variant) {
            return;
        }

        // Update variant basic information
        $variant->update([
            'name' => $variantData['name'],
            'slug' => Str::slug($variantData['name']),
            'stock' => $variantData['stock'] ?? 0,
            'purchase_price' => $variantData['purchase_price'] ?? 0,
            'selling_price' => $variantData['selling_price'] ?? 0,
            'is_default' => isset($variantData['is_default']) && $variantData['is_default'] ? 1 : 0,
        ]);

        // Handle image deletion
        $imagesToDelete = [];
        if ($request->has('images_to_delete') && !empty($request->images_to_delete)) {
            $imagesToDeleteData = $request->images_to_delete;
            if (is_string($imagesToDeleteData)) {
                $imagesToDelete = json_decode($imagesToDeleteData, true) ?: [];
            } elseif (is_array($imagesToDeleteData)) {
                $imagesToDelete = $imagesToDeleteData;
            }
        }

        // Handle new image uploads
        $newImagePaths = [];
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
                    $newImagePaths[] = $path;
                }
            }
        }

        // Update images: remove deleted ones, keep existing ones, add new ones
        $existingImages = [];
        if ($variant->images) {
            if (is_string($variant->images)) {
                $existingImages = json_decode($variant->images, true) ?: [];
            } elseif (is_array($variant->images)) {
                $existingImages = $variant->images;
            }
        }
        
        // Log for debugging
        Log::info('Image deletion debug:', [
            'variant_id' => $variant->id,
            'existing_images' => $existingImages,
            'images_to_delete' => $imagesToDelete,
            'new_images' => $newImagePaths,
            'has_image_deletions' => $request->has('has_image_deletions') ? $request->has_image_deletions : '0'
        ]);
        
        // Only process image updates if there are deletions or new uploads
        if (!empty($imagesToDelete) || !empty($newImagePaths) || $request->has('has_image_deletions')) {
            $updatedImages = array_filter($existingImages, function($image) use ($imagesToDelete) {
                // Normalize image path for comparison
                $normalizedImage = $image;
                
                // Remove leading slash if present
                if (strpos($normalizedImage, '/') === 0) {
                    $normalizedImage = substr($normalizedImage, 1);
                }
                
                // Ensure it starts with 'uploads/'
                if (!str_starts_with($normalizedImage, 'uploads/')) {
                    $normalizedImage = 'uploads/' . $normalizedImage;
                }
                
                // Check if this image should be deleted
                $shouldKeep = true;
                foreach ($imagesToDelete as $deletePath) {
                    // Normalize delete path too
                    $normalizedDeletePath = $deletePath;
                    if (strpos($normalizedDeletePath, '/') === 0) {
                        $normalizedDeletePath = substr($normalizedDeletePath, 1);
                    }
                    if (!str_starts_with($normalizedDeletePath, 'uploads/')) {
                        $normalizedDeletePath = 'uploads/' . $normalizedDeletePath;
                    }
                    
                    // Compare normalized paths
                    if ($normalizedImage === $normalizedDeletePath) {
                        $shouldKeep = false;
                        break;
                    }
                }
                
                Log::info('Image filter check:', [
                    'original_image' => $image,
                    'normalized_image' => $normalizedImage,
                    'images_to_delete' => $imagesToDelete,
                    'should_keep' => $shouldKeep
                ]);
                
                return $shouldKeep;
            });
            
            $allImages = array_merge($updatedImages, $newImagePaths);
            
            Log::info('Final images for variant:', [
                'variant_id' => $variant->id,
                'final_images' => $allImages
            ]);
            
            $variant->images = json_encode($allImages);
            $variant->save();
        }

        // Update combinations if attributes are provided
        if (isset($variantData['attributes']) && is_array($variantData['attributes'])) {
            // Clear existing combinations
            VariantCombination::where('variant_id', $variant->id)->delete();
            
            // Create new combinations
            foreach ($variantData['attributes'] as $attr) {
                if (!empty($attr['attribute_type_id']) && !empty($attr['selected_values'])) {
                    $selectedValues = $attr['selected_values'];
                    if (!is_array($selectedValues)) {
                        $selectedValues = [$selectedValues];
                    }
                    foreach ($selectedValues as $valueId) {
                        VariantCombination::create([
                            'variant_id' => $variant->id,
                            'attribute_value_id' => $valueId,
                        ]);
                    }
                }
            }
        }
    }

    private function createNewVariant($product, $variantData, $request, $index)
    {
        $variantName = $variantData['name'];
        $variantSlug = Str::slug($variantName);
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

        // Handle image upload for new variant
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
            
            if (!empty($imagePaths)) {
                $variant->images = json_encode($imagePaths);
                $variant->save();
            }
        }

        // Create combinations for new variant
        if (isset($variantData['attributes']) && is_array($variantData['attributes'])) {
            foreach ($variantData['attributes'] as $attr) {
                if (!empty($attr['attribute_type_id']) && !empty($attr['selected_values'])) {
                    $selectedValues = $attr['selected_values'];
                    if (!is_array($selectedValues)) {
                        $selectedValues = [$selectedValues];
                    }
                    foreach ($selectedValues as $valueId) {
                        VariantCombination::create([
                            'variant_id' => $variant->id,
                            'attribute_value_id' => $valueId,
                        ]);
                    }
                }
            }
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

        // Load only active variants (not soft deleted) with combinations and images
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
            Log::info('Bắt đầu tạo biến thể với dữ liệu:', [
                'product_id' => $product->id,
                'attributes' => $attributes
            ]);

            if (!is_array($attributes)) {
                throw new \Exception('Thuộc tính phải là một mảng');
            }

            $attributeValueIds = [];
            foreach ($attributes as $attribute) {
                if (!isset($attribute['attribute_type_id']) || empty($attribute['selected_values'])) {
                    continue;
                }

                // Ensure selected_values is always an array
                $selectedValues = $attribute['selected_values'];
                if (!is_array($selectedValues)) {
                    if (is_string($selectedValues) && strpos($selectedValues, ',') !== false) {
                        $selectedValues = array_map('trim', explode(',', $selectedValues));
                    } else {
                        $selectedValues = [$selectedValues];
                    }
                }

                $attrValues = VariantAttributeValue::select('id', 'value', 'attribute_type_id')
                    ->whereIn('id', $selectedValues)
                    ->where('attribute_type_id', $attribute['attribute_type_id'])
                    ->get();

                if ($attrValues->isNotEmpty()) {
                    $values = [];
                    foreach ($attrValues as $value) {
                        // Decode JSON value if it's a JSON string
                        $displayValue = $value->value;
                        if (is_string($displayValue)) {
                            $decoded = json_decode($displayValue, true);
                            if (json_last_error() === JSON_ERROR_NONE && $decoded !== null) {
                                $displayValue = $decoded;
                            }
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
            
            Log::info('Đã tạo các tổ hợp:', ['combinations' => $combinations]);

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
            Log::error('Lỗi trong createVariantsFromAttributes: ' . $e->getMessage());
            Log::error('Chi tiết lỗi đầy đủ:', [
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
                ->with('success', 'Sản phẩm đã được khôi phục thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Lỗi khi khôi phục sản phẩm: ' . $e->getMessage());
            Log::error('Chi tiết lỗi: ' . $e->getTraceAsString());
            return back()->withErrors(['error' => 'Đã xảy ra lỗi khi khôi phục sản phẩm.']);
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
                ->with('success', 'Sản phẩm đã được chuyển vào thùng rác thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Lỗi khi xóa sản phẩm: ' . $e->getMessage());
            Log::error('Chi tiết lỗi: ' . $e->getTraceAsString());
            return back()->withErrors(['error' => 'Đã xảy ra lỗi khi xóa sản phẩm.']);
        }
    }

    public function show(Product $product)
    {
        $product->load(['category', 'variants', 'specifications.specification']);
        return view('admin.products.show', compact('product'));
    }
}
