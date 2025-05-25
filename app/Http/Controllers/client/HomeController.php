<?php

namespace App\Http\Controllers\client;

use App\Models\Banner;
use App\Models\Product;

class HomeController
{
    public function index()
    {
        // banners
        $banners = Banner::where('status', 'active')
            ->orderBy('order')
            ->get();
            
        // Get most viewed products
        $mostViewedProducts = Product::where('status', 'active')
            ->orderBy('views', 'desc')
            ->take(10)
            ->get();
            
        return view('client.index', [
            'banners' => $banners,
            'mostViewedProducts' => $mostViewedProducts
        ]);
    }

    public function incrementView($id)
    {
        $product = Product::findOrFail($id);
        $product->increment('views');
        return response()->json(['success' => true, 'views' => $product->views]);
    }
}
