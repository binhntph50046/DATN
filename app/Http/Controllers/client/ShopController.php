<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ShopController
{
    public function index()
    {
        $categories = Category::with(['products' => function ($query) {
            $query->with('reviews')
                ->where('status', 1)
                ->orderBy('created_at', 'desc');
        }])->where('status', 1)->get();
        // Flash Sale
        $flashSaleItems = $this->getActiveFlashSaleItems();
        $flashSaleTimeRange = $this->getFlashSaleTimeRange();
        return view('client.shop.index', compact('categories', 'flashSaleItems', 'flashSaleTimeRange'));
    }
    protected function getActiveFlashSaleItems()
    {
        $now = Carbon::now();

        $flashSaleItems = DB::table('flash_sale_items')
            ->join('flash_sales', 'flash_sale_items.flash_sale_id', '=', 'flash_sales.id')
            ->join('product_variants', 'flash_sale_items.product_variant_id', '=', 'product_variants.id')
            ->join('products', 'product_variants.product_id', '=', 'products.id')
            ->where('flash_sales.status', 1)
            ->where('flash_sales.start_time', '<=', $now)
            ->where('flash_sales.end_time', '>=', $now)
            ->select(
                'flash_sale_items.*',
                'product_variants.name as variant_name',
                'product_variants.selling_price',
                'product_variants.slug as variant_slug',
                'product_variants.images as variant_images',
                'products.name as product_name',
                'products.slug as product_slug'
            )
            ->get();


        $flashSaleItems->transform(function ($item) {
            $images = $item->variant_images;

            // Decode 2 lần nếu cần
            $decoded = json_decode($images, true);
            if (is_string($decoded)) {
                $decoded = json_decode($decoded, true);
            }

            // Nếu ra mảng, lấy ảnh đầu tiên
            if (is_array($decoded) && isset($decoded[0])) {
                // Đảm bảo path không có dấu \
                $item->first_image = str_replace('\\', '/', $decoded[0]);
            } else {
                $item->first_image = null;
            }

            return $item;
        });

        // dd($flashSaleItems);

        return $flashSaleItems;
    }
    protected function getFlashSaleTimeRange()
    {
        $now = Carbon::now();

        $flashSale = DB::table('flash_sales')
            ->where('status', 1)
            ->where('start_time', '<=', $now)
            ->where('end_time', '>=', $now)
            ->orderBy('start_time', 'asc')
            ->first();

        if ($flashSale) {
            return [
                'start_time' => Carbon::parse($flashSale->start_time),
                'end_time' => Carbon::parse($flashSale->end_time),
            ];
        }

        return null;
    }
}
