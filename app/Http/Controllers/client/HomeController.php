<?php

namespace App\Http\Controllers\client;

use App\Models\Banner;
use App\Models\Product;
use Carbon\Carbon;

class HomeController
{
    public function index()
    {
        // banners
        $banners = Banner::where('status', 'active')
            ->orderBy('order')
            ->get();
            
        // Lấy sản phẩm theo nhóm 3 sản phẩm một hàng
        $mostViewedProducts = Product::where('status', 'active')
            ->with(['variants' => function($query) {
                $query->orderByDesc('is_default');
            }])
            ->orderBy('views', 'desc')
            ->take(9) // Lấy 9 sản phẩm (3 hàng)
            ->get()
            ->chunk(3); // Chia thành các nhóm 3 sản phẩm

        // Lấy 3 sản phẩm mới nhất trong tháng hiện tại
        $latestProducts = Product::where('status', 'active')
            ->with(['variants' => function($query) {
                $query->orderByDesc('is_default');
            }])
            ->whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)
            ->orderBy('created_at', 'desc')
            ->take(3)
            ->get();
            
        return view('client.index', [
            'banners' => $banners,
            'mostViewedProducts' => $mostViewedProducts,
            'latestProducts' => $latestProducts
        ]);
    }

    public function incrementView($id)
    {
        $product = Product::findOrFail($id);
        $product->increment('views');
        return response()->json(['success' => true, 'views' => $product->views]);
    }
}
