<?php
namespace App\Services\Product;

use App\Models\Product;
use App\Models\ProductView;
use App\Models\SearchHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductSuggestionService
{
    public function suggestByPrice(Product $product)
    {
        return Product::whereBetween('price', [$product->price - 50000, $product->price + 50000])
                      ->where('id', '!=', $product->id)
                      ->limit(6)
                      ->get();
    }

    public function suggestByViewHistory($userId)
    {
        $viewed = ProductView::where('user_id', $userId)->latest()->limit(5)->pluck('product_id');

        return Product::whereIn('category_id', function ($q) use ($viewed) {
            $q->select('category_id')->from('products')->whereIn('id', $viewed);
        })->whereNotIn('id', $viewed)->limit(6)->get();
    }

    public function suggestBySearchHistory($userId)
    {
        $keyword = SearchHistory::where('user_id', $userId)->latest()->value('keyword');

        return Product::where('name', 'like', "%$keyword%")
                      ->orWhere('description', 'like', "%$keyword%")
                      ->limit(6)->get();
    }

    public function suggestTrendingThisWeek()
    {
        $ids = DB::table('ec_order_product')
            ->whereBetween('created_at', [now()->subDays(7), now()])
            ->select('product_id', DB::raw('count(*) as total'))
            ->groupBy('product_id')
            ->orderByDesc('total')
            ->limit(6)
            ->pluck('product_id');

        return Product::whereIn('id', $ids)->get();
    }
}
// This service class provides methods to suggest products based on various criteria such as price, view history, search history, and trending products.