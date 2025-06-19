<?php

namespace App\Http\Controllers\client;

use App\Models\Banner;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\ProductVariant;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

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
            ->get();

        // Lấy 3 sản phẩm mới nhất trong tháng hiện tại
        $latestProducts = Product::where('status', 'active')
            ->with(['variants' => function($query) {
                $query->orderByDesc('is_default');
            }])
            ->whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)
            ->orderBy('created_at', 'desc')
            ->take(9)
            ->get();

        // Lấy ID sản phẩm trong wishlist của người dùng
        $wishlistProductIds = [];
        if (Auth::check()) {
            $wishlistProductIds = Wishlist::where('user_id', Auth::id())
                ->pluck('product_id')
                ->toArray();
        }
            
        return view('client.index', [
            'banners' => $banners,
            'mostViewedProducts' => $mostViewedProducts,
            'latestProducts' => $latestProducts,
            'wishlistProductIds' => $wishlistProductIds
        ]);
    }

    public function incrementView($id)
    {
        $product = Product::findOrFail($id);
        $product->increment('views');
        return response()->json(['success' => true, 'views' => $product->views]);
    }

    public function getProduct($id)
    {
        $product = Product::with(['variants' => function($query) {
            $query->whereNull('deleted_at')
                ->with(['combinations' => function($query) {
                    $query->with(['attribute_value' => function($query) {
                        $query->whereNull('deleted_at')
                            ->with('attribute_type');
                    }]);
                }]);
        }])
        ->where('status', 'active')
        ->findOrFail($id);

        return response()->json($product);
    }

    public function getVariant($id)
    {
        $variant = ProductVariant::with(['combinations' => function($query) {
            $query->with(['attribute_value' => function($query) {
                $query->whereNull('deleted_at')
                    ->with('attribute_type');
            }]);
        }])
        ->whereNull('deleted_at')
        ->findOrFail($id);

        return response()->json($variant);
    }
}