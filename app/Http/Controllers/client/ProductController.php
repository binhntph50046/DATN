<?php

namespace App\Http\Controllers\client;

use App\Models\Product;
use App\Models\ProductView;
use App\Models\ProductVariant;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class ProductController
{
    public function show($slug)
    {
        $product = Product::with([
            'category',
            'variants' => function($query) {
                $query->with(['combinations.attributeValue.attributeType']);
            },
            'specifications.specification',
            'defaultVariant'
        ])->where('slug', $slug)->firstOrFail();
            
        // Increment view count
        $product->increment('views');
        
        // Get related products (same category, excluding current product)
        $relatedProducts = Product::where('category_id', $product->category_id)
            ->where('slug', '!=', $slug)
            ->take(4)
            ->get();
        // Lưu dữ liệu xem sản phẩm
        ProductView::create([
            'user_id' => Auth::id(),
            'product_id' => $product->id,
        ]);

        return view('client.product.product-detail', compact('product', 'relatedProducts'));
    }

    public function getProductDetails($id): JsonResponse
    {
        $product = Product::with([
            'category',
            'variants' => function($query) {
                $query->with(['combinations.attributeValue.attributeType']);
            },
            'specifications.specification',
            'defaultVariant'
        ])->findOrFail($id);

        return response()->json($product);
    }

    public function getVariant($id): JsonResponse
    {
        $variant = ProductVariant::with(['combinations' => function($query) {
            $query->with(['attributeValue' => function($query) {
                $query->whereNull('deleted_at')
                    ->with('attributeType');
            }]);
        }])
        ->whereNull('deleted_at')
        ->findOrFail($id);

        return response()->json($variant);
    }
}
