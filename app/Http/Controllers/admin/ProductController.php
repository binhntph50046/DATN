<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreProductRequest;
use App\Http\Requests\Admin\UpdateProductRequest;
use App\Models\AttributeType;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\ProductVariant;
use App\Models\VariantAttribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('category')->paginate(10);
        return view('admin.products.index', compact('products'));
    }

    public function createSimple()
    {
        $categories = Category::where('status', 'active')->get();
        $attributeTypes = AttributeType::where('status', 'active')->get();
        return view('admin.products.create-simple', compact('categories', 'attributeTypes'));
    }

    public function createVariant()
    {
        $categories = Category::where('status', 'active')->get();
        $attributeTypes = AttributeType::where('status', 'active')->get();
        return view('admin.products.create-variant', compact('categories', 'attributeTypes'));
    }

    public function store(StoreProductRequest $request)
    {
        $data = $request->validated();

        // Handle image upload
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('products', 'public');
        }

        // Generate slug if not provided
        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);
        $data['has_variants'] = $request->input('has_variants', 0);  // 1 nếu có biến thể, 0 nếu không

        // Create product
        $product = Product::create(array_diff_key($data, ['attribute_values' => '', 'product_attributes' => '']));

        // Handle product attributes (not used for cross-combination)
        if (!empty($data['product_attributes'])) {
            foreach ($data['product_attributes'] as $attr) {
                if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                    ProductAttribute::create([
                        'product_id' => $product->id,
                        'attribute_type_id' => $attr['attribute_type_id'],
                        'value' => $attr['value'],
                    ]);
                }
            }
        }

        // Handle variants if has_variants = 1
        if ($product->has_variants) {
            $attributeValues = $data['attribute_values'] ?? [];
            $variantsData = [];

            if (!empty($attributeValues)) {
                $totalCombinations = array_reduce($attributeValues, fn($carry, $values) => $carry * count($values), 1);
                if ($totalCombinations > 100) {  // Giới hạn số lượng biến thể
                    return redirect()->back()->withErrors(['attribute_values' => 'Too many combinations (' . $totalCombinations . '). Please reduce the number of values.']);
                }
                $combinations = $this->generateCombinations($attributeValues);
                foreach ($combinations as $index => $combination) {
                    $variantName = $product->name . '-' . implode('-', $combination);
                    $variantsData[] = [
                        'product_id' => $product->id,
                        'sku' => Str::slug($variantName) . '-' . $index,
                        'name' => $variantName,
                        'stock' => 0,  // Default, user can edit later
                        'purchase_price' => 0,
                        'selling_price' => 0,
                        'status' => 'active',
                        'attributes' => array_map(function ($value, $typeId) {
                            return ['attribute_type_id' => $typeId, 'value' => $value];
                        }, $combination, array_keys($attributeValues)),
                    ];
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
            // For simple product, create a default variant with basic info
            ProductVariant::create([
                'product_id' => $product->id,
                'sku' => Str::slug($product->name) . '-simple',
                'name' => $product->name,
                'stock' => $data['stock'] ?? 0,
                'purchase_price' => $data['purchase_price'] ?? 0,
                'selling_price' => $data['selling_price'] ?? 0,
                'status' => 'active',
            ]);
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

        $categories = Category::where('status', 'active')->get();
        $attributeTypes = AttributeType::where('status', 'active')->get();
        $product->load('variants', 'attributes');
        return view('admin.products.edit-simple', compact('product', 'categories', 'attributeTypes'));
    }

    public function editVariant(Product $product)
    {
        if (!$product->has_variants) {
            return redirect()->route('admin.products.edit-simple', $product)->with('error', 'This product does not have variants. Use the simple edit form.');
        }

        $categories = Category::where('status', 'active')->get();
        $attributeTypes = AttributeType::where('status', 'active')->get();
        $product->load('variants.attributes', 'attributes');
        return view('admin.products.edit-variant', compact('product', 'categories', 'attributeTypes'));
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        $data = $request->validated();

        // Handle image upload
        if ($request->hasFile('image')) {
            if ($product->image) {
                Storage::disk('public')->delete($product->image);
            }
            $data['image'] = $request->file('image')->store('products', 'public');
        }

        // Update slug if name changes
        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);
        $data['has_variants'] = $request->input('has_variants', 0);

        // Update product
        $product->update(array_diff_key($data, ['attribute_values' => '', 'product_attributes' => '', 'stock' => '', 'purchase_price' => '', 'selling_price' => '']));

        // Handle product attributes
        $product->attributes()->delete();
        if (!empty($data['product_attributes'])) {
            foreach ($data['product_attributes'] as $attr) {
                if (!empty($attr['attribute_type_id']) && !empty($attr['value'])) {
                    ProductAttribute::create([
                        'product_id' => $product->id,
                        'attribute_type_id' => $attr['attribute_type_id'],
                        'value' => $attr['value'],
                    ]);
                }
            }
        }

        // Handle variants
        $product->variants()->delete();

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
                    $variantsData[] = [
                        'product_id' => $product->id,
                        'sku' => Str::slug($variantName) . '-' . $index,
                        'name' => $variantName,
                        'stock' => 0,
                        'purchase_price' => 0,
                        'selling_price' => 0,
                        'status' => 'active',
                        'attributes' => array_map(function ($value, $typeId) {
                            return ['attribute_type_id' => $typeId, 'value' => $value];
                        }, $combination, array_keys($attributeValues)),
                    ];
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
            // For simple product, update the default variant
            ProductVariant::create([
                'product_id' => $product->id,
                'sku' => Str::slug($product->name) . '-simple',
                'name' => $product->name,
                'stock' => $data['stock'] ?? 0,
                'purchase_price' => $data['purchase_price'] ?? 0,
                'selling_price' => $data['selling_price'] ?? 0,
                'status' => 'active',
            ]);
        }

        return redirect()->route('admin.products.index')->with('success', 'Product updated successfully.');
    }

    public function destroy(Product $product)
    {
        if ($product->image) {
            Storage::disk('public')->delete($product->image);
        }

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
}
