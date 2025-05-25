<?php

namespace App\Http\Controllers\client;

use App\Models\Product;

class ProductController
{
    public function productDetail($id)
    {
        $product = Product::with([
            'category',
            'variants' => function($query) {
                $query->with(['combinations.attributeValue.attributeType']);
            },
            'specifications.specification',
            'defaultVariant'
        ])->findOrFail($id);
            
        // Increment view count
        $product->increment('views');
        
        // Get related products (same category, excluding current product)
        $relatedProducts = Product::where('category_id', $product->category_id)
            ->where('id', '!=', $id)
            ->take(4)
            ->get();
            
        return view('client.product.product-detail', compact('product', 'relatedProducts'));
    }
}
