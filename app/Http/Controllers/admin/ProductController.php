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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class ProductController
{
    /**
     * Sinh SKU duy nhất dạng SP-xxxxx
     */
    private function generateUniqueSku()
    {
        do {
            $sku = 'SP-' . str_pad(rand(1, 99999), 5, '0', STR_PAD_LEFT);
        } while (
            ProductVariant::where('sku', $sku)->exists() ||
            ProductAttribute::where('sku', $sku)->exists()
        );
        return $sku;
    }

    public function index()
    {
        $products = Product::with(['category', 'variants' => function ($query) {
            $query->where('is_default', true);
        }])->paginate(10);

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
                    // Handle multiple file uploads
                    $files = $request->file("variants.{$index}.images");
                    $filePaths = $files ? $this->moveFilesToUploadsProducts($files) : [];

                    // Log mảng $filePaths
                    Log::info("Files for variant {$index}", [
                        'file_count' => is_array($files) ? count($files) : ($files ? 1 : 0),
                        'file_paths' => $filePaths,
                        'file_count_paths' => count($filePaths),
                    ]);

                    // Generate unique SKU
                    $sku = $this->generateUniqueSku();

                    // Encode files to JSON
                    $jsonFiles = json_encode($filePaths);
                    if (json_last_error() !== JSON_ERROR_NONE) {
                        Log::error('JSON encode error for files', [
                            'variant_index' => $index,
                            'error' => json_last_error_msg(),
                            'files' => $filePaths,
                        ]);
                        $jsonFiles = json_encode([]);
                    }

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
                        'images' => $jsonFiles,
                        'status' => 'active',
                        'is_default' => isset($variantData['is_default']) && $variantData['is_default'] == 1 ? 1 : 0,
                    ]);

                    // Log sau khi lưu
                    Log::info('Variant created', [
                        'variant_id' => $productVariant->id,
                        'images_in_db' => $productVariant->images,
                    ]);

                    // Process attributes
                    $attributes = json_decode($variantData['attributes'], true);
                    if (json_last_error() === JSON_ERROR_NONE && is_array($attributes)) {
                        foreach ($attributes as $attr) {
                            $value = trim($attr['value']);
                            $hex = isset($attr['hex']) ? trim($attr['hex']) : null;
                            if (!empty($value)) {
                                // Create or find attribute value
                                $attributeValue = VariantAttributeValue::firstOrCreate(
                                    [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => $value,
                                    ],
                                    [
                                        'hex' => $hex,
                                        'status' => 'active',
                                        'created_at' => now(),
                                        'updated_at' => now(),
                                    ]
                                );

                                // Update hex if provided
                                if ($hex && $attributeValue->hex !== $hex) {
                                    $attributeValue->update(['hex' => $hex]);
                                }

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
                $files = Arr::wrap($request->file('images'));
                $filePaths = [];

                Log::info('Files received for simple product', [
                    'files_count' => count($files),
                    'files' => array_map(function ($file) {
                        return [
                            'name' => $file->getClientOriginalName(),
                            'size' => $file->getSize(),
                            'mime' => $file->getMimeType(),
                        ];
                    }, $files)
                ]);

                if (!empty($files)) {
                    $uploadedFiles = $this->moveFilesToUploadsProducts($files);
                    if (!empty($uploadedFiles)) {
                        $filePaths = $uploadedFiles;
                        Log::info('Files uploaded successfully', [
                            'count' => count($uploadedFiles),
                            'paths' => $uploadedFiles
                        ]);
                    } else {
                        Log::warning('No files were uploaded after processing', [
                            'files_count' => count($files)
                        ]);
                    }
                } else {
                    Log::warning('No files were uploaded');
                }

                // Add existing images if any
                if ($request->has('existing_images')) {
                    $existing = $request->input('existing_images', []);
                    $existing = is_array($existing) ? $existing : [];
                    $filePaths = array_merge($filePaths, $existing);
                    Log::info('Added existing images', ['count' => count($existing)]);
                }

                // Remove duplicate file paths and reset array keys
                $filePaths = array_values(array_unique($filePaths));

                // Generate SKU
                $sku = $this->generateUniqueSku();

                // Prepare variant data with all required fields
                $variantData = [
                    'product_id' => $product->id,
                    'sku' => $sku,
                    'name' => $product->name,
                    'slug' => Str::slug($product->name),
                    'stock' => (int) ($data['stock'] ?? 0),
                    'purchase_price' => (float) ($data['purchase_price'] ?? 0),
                    'selling_price' => (float) ($data['selling_price'] ?? 0),
                    'discount_price' => isset($data['discount_price']) && $data['discount_price'] !== '' ? (float) $data['discount_price'] : null,
                    'images' => !empty($filePaths) ? json_encode($filePaths) : json_encode([]),
                    'status' => 'active',
                    'is_default' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];

                // Log the data before creating the variant
                Log::info('Creating product variant with data:', $variantData);

                try {
                    // Create the variant
                    $productVariant = ProductVariant::create($variantData);

                    // Update the product with the default variant ID
                    $product->update([
                        'default_variant_id' => $productVariant->id
                    ]);

                    Log::info('Product variant created successfully', [
                        'variant_id' => $productVariant->id,
                        'product_id' => $productVariant->product_id
                    ]);
                } catch (\Exception $e) {
                    Log::error('Failed to create product variant', [
                        'error' => $e->getMessage(),
                        'data' => $variantData
                    ]);
                    throw $e;  // Re-throw to trigger the transaction rollback
                }

                // Log sau khi lưu
                Log::info('Simple product variant created', [
                    'variant_id' => $productVariant->id,
                    'images_in_db' => $productVariant->images,
                ]);

                // Handle product attributes for simple product
                if (!empty($data['product_attributes'])) {
                    foreach ($data['product_attributes'] as $attr) {
                        if (!empty($attr['attribute_type_id'])) {
                            $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                            if ($attributeType) {
                                ProductAttribute::create([
                                    'product_id' => $product->id,
                                    'attribute_name' => $attributeType->name,
                                    'attribute_value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                    'sku' => $this->generateUniqueSku(),
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
        $product->load('category', 'variants', 'attributes.attributeType', 'variants.combinations.attributeValue.attributeType');
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
        $product->load('variants.combinations.attributeValue.attributeType', 'attributes');

        // Prepare attributeValues
        $attributeValues = [];
        $variants = $product->variants;

        if ($variants->isNotEmpty()) {
            foreach ($variants as $variant) {
                foreach ($variant->combinations as $combination) {
                    $attributeValue = $combination->attributeValue;
                    $attributeTypeId = $attributeValue->attribute_type_id;
                    $value = $attributeValue->value;
                    $hex = $attributeValue->hex ?? '';

                    // Group by attribute_type_id
                    if (!isset($attributeValues[$attributeTypeId])) {
                        $attributeValues[$attributeTypeId] = [
                            'attribute_type_id' => $attributeTypeId,
                            'values' => [],
                            'hex' => [],
                        ];
                    }

                    // Add value and hex to array
                    if (!in_array($value, $attributeValues[$attributeTypeId]['values'])) {
                        $attributeValues[$attributeTypeId]['values'][] = $value;
                        $attributeValues[$attributeTypeId]['hex'][] = $hex;
                    }
                }
            }
        }

        // Convert to sequential array
        $attributeValues = array_values($attributeValues);

        // Log for debugging
        Log::info('Attribute Values for product ID ' . $product->id, [
            'variants_count' => $variants->count(),
            'attributeValues' => $attributeValues,
        ]);

        return view('admin.products.edit-variant', compact('product', 'categories', 'attributeTypes', 'attributeValues', 'variants'));
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
                    // Xử lý ảnh tải lên mới
                    $newFiles = $request->file("variants.{$index}.images");
                    $newFilePaths = [];
                    
                    if ($newFiles) {
                        $newFilePaths = $this->moveFilesToUploadsProducts($newFiles);
                    }

                    // Lấy ảnh cũ nếu có
                    $existingImages = [];
                    if ($existingVariant && $existingVariant->images) {
                        $existingImages = json_decode($existingVariant->images, true) ?? [];
                    }

                    // Kết hợp ảnh cũ và ảnh mới
                    $filePaths = array_merge($existingImages, $newFilePaths);

                    // Log thông tin ảnh
                    Log::info("Files for variant {$index} (update)", [
                        'new_files_count' => is_array($newFiles) ? count($newFiles) : ($newFiles ? 1 : 0),
                        'existing_images' => $existingImages,
                        'new_file_paths' => $newFilePaths,
                        'all_file_paths' => $filePaths,
                    ]);

                    // Encode files to JSON
                    $jsonFiles = json_encode($filePaths);
                    if (json_last_error() !== JSON_ERROR_NONE) {
                        Log::error('JSON encode error for files (update)', [
                            'variant_index' => $index,
                            'error' => json_last_error_msg(),
                            'files' => $filePaths,
                        ]);
                        $jsonFiles = json_encode([]);
                    }

                    if ($existingVariant) {
                        // Kiểm tra xem tên có thay đổi không
                        $nameChanged = ($variantData['name'] ?? '') !== $existingVariant->name;
                        
                        // Update existing variant with all fields
                        $updateData = [
                            'name' => $variantData['name'] ?? $existingVariant->name,
                            'stock' => (int) ($data['stock'] ?? $existingVariant->stock),
                            'purchase_price' => (float) ($data['purchase_price'] ?? $existingVariant->purchase_price),
                            'selling_price' => (float) ($data['selling_price'] ?? $existingVariant->selling_price),
                            'discount_price' => isset($data['discount_price']) && $data['discount_price'] !== '' ? (float) $data['discount_price'] : $existingVariant->discount_price,
                            'updated_at' => now()
                        ];
                        
                        // Chỉ cập nhật slug nếu tên thay đổi
                        if ($nameChanged) {
                            $baseSlug = Str::slug($variantData['name']);
                            $timestamp = now()->timestamp;
                            $updateData['slug'] = $baseSlug . '-' . $timestamp;
                            
                            // Nếu vẫn trùng (rất hiếm), thêm số ngẫu nhiên
                            while (ProductVariant::where('slug', $updateData['slug'])->where('id', '!=', $existingVariant->id)->exists()) {
                                $updateData['slug'] = $baseSlug . '-' . $timestamp . '-' . rand(1000, 9999);
                            }
                        }

// Cập nhật ảnh cho biến thể
                        $updateData['images'] = $jsonFiles;

                        $existingVariant->update($updateData);
                        $productVariant = $existingVariant;

                        Log::info('Variant updated', [
                            'variant_id' => $existingVariant->id,
                            'update_data' => $updateData
                        ]);
                    } else {
                        // Create new variant if none exists
                        $variantData['created_at'] = now();
                        $variantData['sku'] = $this->generateUniqueSku();
                        $variantData['status'] = 'active';
                        $variantData['is_default'] = 1;
                        $variantData['product_id'] = $product->id;

                        // Ensure required fields have default values
                        $variantData['stock'] = $variantData['stock'] ?? 0;
                        $variantData['purchase_price'] = $variantData['purchase_price'] ?? 0;
                        $variantData['selling_price'] = $variantData['selling_price'] ?? 0;
                        
                        // Tạo slug duy nhất với timestamp để tránh trùng lặp
                        $baseSlug = Str::slug($variantData['name']);
                        $timestamp = now()->timestamp;
                        $variantData['slug'] = $baseSlug . '-' . $timestamp;
                        
                        // Nếu vẫn trùng (rất hiếm), thêm số ngẫu nhiên
                        while (ProductVariant::where('slug', $variantData['slug'])->exists()) {
                            $variantData['slug'] = $baseSlug . '-' . $timestamp . '-' . rand(1000, 9999);
                        }

                        $productVariant = ProductVariant::create($variantData);

                        Log::info('New variant created', [
                            'variant_id' => $productVariant->id,
                            'data' => $variantData
                        ]);

                        $newVariantIds[] = $productVariant->id;
                    }

                    // Log sau khi lưu
                    Log::info('Variant updated/created', [
                        'variant_id' => $existingVariant ? $existingVariant->id : $productVariant->id,
                        'images_in_db' => $existingVariant ? $existingVariant->images : $productVariant->images,
                    ]);

                    // Tạo mảng để lưu trữ các attribute value mới
                    $newAttributeValueIds = [];
                    
                    // Process attributes
                    $attributes = json_decode($variantData['attributes'], true);
                    if (json_last_error() === JSON_ERROR_NONE && is_array($attributes)) {
                        foreach ($attributes as $attr) {
                            $value = trim($attr['value']);
                            $hex = isset($attr['hex']) ? trim($attr['hex']) : null;
                            if (!empty($value)) {
                                // Create or find attribute value
                                $attributeValue = VariantAttributeValue::firstOrCreate(
                                    [
                                        'attribute_type_id' => $attr['attribute_type_id'],
                                        'value' => $value,
                                    ],
                                    [
                                        'hex' => $hex,
                                        'status' => 'active',
                                        'created_at' => now(),
                                        'updated_at' => now(),
                                    ]
                                );

                                // Update hex if provided
                                if ($hex && $attributeValue->hex !== $hex) {
                                    $attributeValue->update(['hex' => $hex]);
                                }

                                // Lưu trữ các attribute value IDs mới để thêm sau
                                $variantId = $existingVariant ? $existingVariant->id : $productVariant->id;
                                $newAttributeValueIds[] = [
                                    'variant_id' => $variantId,
                                    'attribute_value_id' => $attributeValue->id
                                ];
                            }
                        }
                        
                        // Xử lý cập nhật variant combinations
                        if (!empty($newAttributeValueIds)) {
                            try {
                                // Nhóm theo variant_id
                                $groupedByVariant = [];
                                foreach ($newAttributeValueIds as $item) {
                                    $groupedByVariant[$item['variant_id']][] = $item['attribute_value_id'];
                                }
                                
                                // Xử lý từng variant
                                foreach ($groupedByVariant as $vId => $attrValueIds) {
                                    // Bắt đầu transaction
                                    DB::beginTransaction();
                                    
                                    try {
                                        // Xóa các tổ hợp cũ
                                        VariantCombination::where('variant_id', $vId)->delete();
                                        
                                        // Thêm các tổ hợp mới
                                        $combinations = [];
                                        $now = now();
                                        foreach ($attrValueIds as $attrValueId) {
                                            $combinations[] = [
                                                'variant_id' => $vId,
                                                'attribute_value_id' => $attrValueId,
                                                'created_at' => $now,
                                                'updated_at' => $now
                                            ];
                                        }
                                        
                                        if (!empty($combinations)) {
                                            VariantCombination::insert($combinations);
                                        }
                                        
                                        DB::commit();
                                    } catch (\Exception $e) {
                                        DB::rollBack();
                                        Log::error('Error updating variant combinations: ' . $e->getMessage());
                                        throw $e;
                                    }
                                }
                            } catch (\Exception $e) {
                                Log::error('Error processing variant combinations: ' . $e->getMessage());
                                throw $e;
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
                    $files = json_decode($variant->images, true);
                    if (is_array($files)) {
                        foreach ($files as $file) {
                            if ($file && Storage::disk('public')->exists($file)) {
                                Storage::disk('public')->delete($file);
                            }
                        }
                    }
                    $variant->combinations()->delete();
                    $variant->delete();
                });
            } else {
                // Get the existing variant or create a new one
                $variantId = $request->input('variant_id');
                $existingVariant = $variantId ? ProductVariant::find($variantId) : $product->variants()->first();
                $filePaths = [];

                // Log dữ liệu đầu vào
                Log::info('Update product data', [
                    'product_id' => $product->id,
                    'variant_id' => $variantId,
                    'existing_variant' => $existingVariant ? $existingVariant->toArray() : null,
                    'input_data' => $request->except(['_token', '_method', 'images'])
                ]);

                // Handle new file uploads
                $files = $request->file('images');
                
                if ($request->hasFile('images')) {
                    $files = is_array($files) ? $files : [$files];
                    
                    $uploadedFiles = $this->moveFilesToUploadsProducts($files);

                    if (!empty($uploadedFiles)) {
                        $filePaths = array_merge($filePaths, $uploadedFiles);
                        Log::info('New files uploaded successfully in update', [
                            'count' => count($uploadedFiles),
                            'paths' => $uploadedFiles
                        ]);
                    } else {
                        Log::warning('No files were uploaded after processing in update', [
                            'files_count' => count($files)
                        ]);
                    }
                }

                // Handle existing images
                if ($request->has('existing_images')) {
                    $existing = $request->input('existing_images', []);
                    $existing = is_array($existing) ? $existing : [];
                    $filePaths = array_merge($filePaths, $existing);
                    Log::info('Using existing images from request', ['existing' => $existing]);
                } elseif ($existingVariant && $existingVariant->images) {
                    // If no existing images in request but we have an existing variant with images, keep its images
                    $existingImages = json_decode($existingVariant->images, true) ?? [];
                    $filePaths = array_merge($filePaths, $existingImages);
                    Log::info('Using existing images from variant', ['existing_images' => $existingImages]);
                } else {
                    Log::info('No existing images to process');
                }

                // Handle removed images
                if ($request->has('removed_images')) {
                    $removed = $request->input('removed_images', []);
                    $removed = is_array($removed) ? $removed : [];

                    // Remove the paths from our file paths
                    $filePaths = array_diff($filePaths, $removed);

                    // Delete the actual files
                    foreach ($removed as $fileToDelete) {
                        $filePath = public_path($fileToDelete);
                        if (file_exists($filePath)) {
                            @unlink($filePath);
                        }
                    }
                }

                // Remove duplicate file paths and reset array keys
                $filePaths = array_values(array_unique($filePaths));

                // Remove duplicate file paths and reset array keys
                $filePaths = array_values(array_unique($filePaths));

                // Update variant data with images if we have any
                if (!empty($filePaths)) {
                    $variantData['images'] = json_encode($filePaths);
                    Log::info('Final images to save:', ['images' => $variantData['images']]);
                } elseif ($existingVariant && !$request->has('existing_images') && !$request->has('removed_images')) {
                    // Keep existing images if no changes were made
                    $variantData['images'] = $existingVariant->images;
                    Log::info('Keeping existing images, no changes made');
                } else {
                    $variantData['images'] = json_encode([]);
                    Log::info('No images to save');
                }

                Log::info('Final variant images data', [
                    'images' => $variantData['images'],
                    'has_existing_images' => $request->has('existing_images'),
                    'has_removed_images' => $request->has('removed_images')
                ]);

                $sku = $existingVariant ? $existingVariant->sku : $this->generateUniqueSku();

                // Encode files to JSON
                $jsonFiles = json_encode($filePaths);
                if (json_last_error() !== JSON_ERROR_NONE) {
                    Log::error('JSON encode error for simple product files (update)', [
                        'error' => json_last_error_msg(),
                        'files' => $filePaths,
                    ]);
                    $jsonFiles = json_encode([]);
                }

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

                // Lấy dữ liệu từ request
                $variantData = [
                    'product_id' => $product->id,
                    'sku' => $sku,
                    'name' => $data['name'] ?? $product->name,
                    'slug' => $slug,
                    'stock' => (int) ($request->input('stock', $existingVariant->stock ?? 0)),
                    'purchase_price' => (float) ($request->input('purchase_price', $existingVariant->purchase_price ?? 0)),
                    'selling_price' => (float) ($request->input('selling_price', $existingVariant->selling_price ?? 0)),
                    'discount_price' => $request->filled('discount_price') ? (float) $request->input('discount_price') : null,
                    'status' => 'active',
                    'is_default' => 1,
                    'updated_at' => now(),
                    'images' => !empty($filePaths) ? json_encode($filePaths) : ($existingVariant->images ?? '[]'),
                ];

                // Log dữ liệu trước khi cập nhật
                Log::info('Updating variant with data:', [
                    'variant_id' => $existingVariant ? $existingVariant->id : 'new',
                    'data' => $variantData,
                    'request_data' => $request->except(['_token', '_method', 'images'])
                ]);

                if ($existingVariant) {
                    $existingVariant->update($variantData);
                    Log::info('Variant updated successfully', [
                        'variant_id' => $existingVariant->id,
                        'updated_data' => $existingVariant->toArray()
                    ]);
                } else {
                    $productVariant = ProductVariant::create($variantData);
                    Log::info('Simple product variant created', [
                        'variant_id' => $productVariant->id,
                        'created_data' => $productVariant->toArray()
                    ]);
                }

                // Handle product attributes for simple product
                $product->attributes()->delete();
                if (!empty($data['product_attributes'])) {
                    foreach ($data['product_attributes'] as $index => $attr) {
                        if (!empty($attr['attribute_type_id'])) {
                            $attributeType = VariantAttributeType::find($attr['attribute_type_id']);
                            if ($attributeType) {
                                Log::info("Processing attribute for product ID {$product->id}, index {$index}", [
                                    'attribute_type_id' => $attr['attribute_type_id'],
                                    'value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                    'sku' => $this->generateUniqueSku(),
                                ]);

                                ProductAttribute::create([
                                    'product_id' => $product->id,
                                    'attribute_name' => $attributeType->name,
                                    'attribute_value' => $attr['value'] ?? null,
                                    'hex' => $attr['hex'] ?? null,
                                    'sku' => $this->generateUniqueSku(),
                                ]);
                            } else {
                                Log::warning("Attribute type ID {$attr['attribute_type_id']} not found for product ID {$product->id}");
                            }
                        } else {
                            Log::warning("Missing attribute_type_id for product ID {$product->id}, index {$index}");
                        }
                    }
                }
            }

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product updated successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to update product: ' . $e->getMessage());
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to update product: ' . $e->getMessage()]);
        }
    }

    public function destroy(Product $product)
    {
        try {
            DB::beginTransaction();

            // Delete all variant images
            foreach ($product->variants as $variant) {
                $files = json_decode($variant->images, true);
                if (is_array($files)) {
                    foreach ($files as $file) {
                        if ($file && Storage::disk('public')->exists($file)) {
                            Storage::disk('public')->delete($file);
                        }
                    }
                }
                // Delete variant combinations
                $variant->combinations()->delete();
            }

            // Delete the product (will soft delete if using soft deletes)
            $product->delete();

            DB::commit();
            return redirect()->route('admin.products.index')->with('success', 'Product deleted successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to delete product: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to delete product: ' . $e->getMessage());
        }
    }

    public function trash()
    {
        $products = Product::onlyTrashed()->with('category')->paginate(10);
        return view('admin.products.trash', compact('products'));
    }

    public function restore($id)
    {
        $product = Product::withTrashed()->findOrFail($id);
        $product->restore();
        return redirect()->route('admin.products.trash')->with('success', 'Product restored successfully!');
    }

    public function forceDelete($id)
    {
        try {
            DB::beginTransaction();

            $product = Product::withTrashed()->with(['variants.combinations'])->findOrFail($id);

            // Delete all variant images and combinations
            foreach ($product->variants as $variant) {
                // Delete variant images
                $files = json_decode($variant->images, true);
                if (is_array($files)) {
                    foreach ($files as $file) {
                        if ($file && Storage::disk('public')->exists($file)) {
                            Storage::disk('public')->delete($file);
                        }
                    }
                }

                // Delete variant combinations
                if ($variant->combinations) {
                    $variant->combinations()->delete();
                }
            }

            // Force delete the product and its variants
            $product->variants()->forceDelete();
            $product->attributes()->forceDelete();
            $product->forceDelete();

            DB::commit();
            return redirect()->route('admin.products.trash')->with('success', 'Product deleted permanently!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to permanently delete product: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to permanently delete product: ' . $e->getMessage());
        }
    }

    /**
     * Move uploaded files to public/uploads/products/YYYY/MM/DD and return array of relative paths
     */
    private function moveFilesToUploadsProducts($files)
    {
        $filePaths = [];
        $basePath = 'uploads/products/' . date('Y/m/d');
        $destination = public_path($basePath);

        Log::info('Starting file upload process', [
            'basePath' => $basePath,
            'destination' => $destination,
            'file_count' => is_array($files) ? count($files) : 1,
            'is_uploaded_file' => $files instanceof \Illuminate\Http\UploadedFile ? 'yes' : 'no'
        ]);

        // Create directory if it doesn't exist
        if (!file_exists($destination)) {
            Log::info('Creating directory: ' . $destination);
            if (!mkdir($destination, 0755, true)) {
                $error = error_get_last();
                Log::error('Failed to create directory', [
                    'destination' => $destination,
                    'error' => $error
                ]);
                throw new \Exception('Failed to create directory: ' . ($error['message'] ?? 'Unknown error'));
            }
        }

        // Check if directory is writable
        if (!is_writable($destination)) {
            $error = error_get_last();
            Log::error('Directory is not writable', [
                'destination' => $destination,
                'permissions' => substr(sprintf('%o', fileperms($destination)), -4),
                'owner' => fileowner($destination),
                'group' => filegroup($destination)
            ]);
            throw new \Exception('Directory is not writable: ' . $destination);
        }

        // Handle single file or array of files
        $fileArray = is_array($files) ? $files : [$files];

        foreach ($fileArray as $file) {
            if ($file instanceof \Illuminate\Http\UploadedFile && $file->isValid()) {
                // Log file info
                Log::info('Processing file', [
                    'original_name' => $file->getClientOriginalName(),
                    'size' => $file->getSize(),
                    'mime' => $file->getMimeType(),
                    'error' => $file->getError(),
                    'error_message' => $file->getErrorMessage()
                ]);

                // Generate a unique filename
                $extension = strtolower($file->getClientOriginalExtension());
                $forbiddenExtensions = ['php', 'php3', 'php4', 'php5', 'phtml', 'exe', 'js', 'html', 'htm', 'htaccess'];

                if (in_array($extension, $forbiddenExtensions)) {
                    Log::warning('Dangerous file type detected', [
                        'extension' => $extension,
                        'original_name' => $file->getClientOriginalName(),
                        'mime_type' => $file->getMimeType()
                    ]);
                    continue;
                }

                // Generate a unique filename
                $fileName = Str::random(20) . '_' . time() . '.' . $extension;
                $filePath = $basePath . '/' . $fileName;

                try {
                    // Move the file to the public directory
                    $file->move($destination, $fileName);
                    $filePaths[] = $filePath;
                    Log::info('File uploaded successfully', [
                        'original_name' => $file->getClientOriginalName(),
                        'stored_path' => $filePath,
                        'full_path' => $destination . '/' . $fileName
                    ]);
                } catch (\Exception $e) {
                    Log::error('Failed to upload file: ' . $e->getMessage(), [
                        'file' => $file->getClientOriginalName(),
                        'error' => $e->getMessage(),
                        'size' => $file->getSize(),
                        'mime' => $file->getMimeType(),
                        'trace' => $e->getTraceAsString()
                    ]);
                }
            } else {
                Log::warning('Invalid file detected', [
                    'file' => is_object($file) ? get_class($file) : gettype($file)
                ]);
            }
        }

        Log::info('Files processed', [
            'count' => count($filePaths),
            'paths' => $filePaths,
        ]);

        return $filePaths;
    }
}
