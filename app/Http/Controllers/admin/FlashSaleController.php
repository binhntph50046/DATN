<?php

namespace App\Http\Controllers\admin;

use App\Http\Requests\Admin\FlashSaleRequest;
use App\Models\FlashSale;
use App\Models\FlashSaleItem;
use App\Models\Product;
use App\Models\ProductVariant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;


class FlashSaleController
{
    // Hiển thị danh sách flash sales
    public function index(Request $request)
    {
        $query = FlashSale::query();

        if ($request->filled('name')) {
            $query->where('name', 'like', '%' . $request->name . '%');
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('start_time')) {
            $query->where('start_time', '>=', $request->start_time);
        }

        if ($request->filled('end_time')) {
            $query->where('end_time', '<=', $request->end_time);
        }

        $flashSales = $query->orderBy('start_time', 'desc')->paginate(10);

        return view('admin.flash-sales.index', compact('flashSales'));
    }



    // Hiển thị form tạo flash sale mới
    public function create()
    {
        $products = Product::select('id', 'name')->get();

        return view('admin.flash-sales.create', compact('products'));
    }

public function store(FlashSaleRequest $request)
{
    $variantIds = array_column($request->items, 'product_variant_id');

    // Kiểm tra trùng biến thể
    if (count($variantIds) !== count(array_unique($variantIds))) {
        return redirect()->back()
            ->withInput()
            ->withErrors(['items' => 'Các biến thể sản phẩm trong flash sale không được trùng nhau.']);
    }

    try {
        DB::beginTransaction();

        // Kiểm tra tồn kho trước khi tạo
        foreach ($request->items as $item) {
            $variant = ProductVariant::findOrFail($item['product_variant_id']);
            if ($variant->stock < $item['count']) {
                throw new \Exception("Biến thể [{$variant->name}] không đủ hàng trong kho.");
            }
        }

        // Tạo flash sale
        $flashSale = FlashSale::create([
            'name' => $request->name,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'status' => 0, // chưa kích hoạt
        ]);

        foreach ($request->items as $item) {
            FlashSaleItem::create([
                'flash_sale_id' => $flashSale->id,
                'product_variant_id' => $item['product_variant_id'],
                'count' => $item['count'],
                'discount' => $item['discount'],
                'discount_type' => $item['discount_type'],
                'buy_limit' => $item['buy_limit'],
            ]);

            // Trừ tồn kho
            $variant = ProductVariant::findOrFail($item['product_variant_id']);
            $variant->stock -= $item['count'];
            $variant->save();
        }

        DB::commit();

        return redirect()->route('admin.flash-sales.index')->with('success', 'Flash sale đã được tạo và trừ kho.');
    } catch (\Exception $e) {
        DB::rollBack();
        return redirect()->back()->withInput()->withErrors([
            'error' => 'Đã có lỗi xảy ra: ' . $e->getMessage()
        ]);
    }
}


    public function edit($id)
    {
        // $flashSale = FlashSale::with(['items.product.variants'])->findOrFail($id);
        $flashSale = FlashSale::with(['items.variant.product'])->findOrFail($id);

        $products = Product::with('variants')->get();

        return view('admin.flash-sales.edit', compact('flashSale', 'products'));
    }

public function update(Request $request, $id)
{
    $request->validate([
        'status' => 'required|in:0,1,2',
    ]);

    $flashSale = FlashSale::with('items.variant')->findOrFail($id);

    DB::transaction(function () use ($request, $flashSale) {
        $newStatus = (int) $request->status;

        if ($newStatus === 1) {
            // Trường hợp Active: end cái đang active khác nếu có
            $currentActive = FlashSale::with('items.variant')
                ->where('status', 1)
                ->where('id', '!=', $flashSale->id)
                ->first();

            if ($currentActive) {
                // Trả stock cho cái đang active hiện tại (sắp bị end)
                foreach ($currentActive->items as $item) {
                    $variant = $item->variant;
                    if ($variant) {
                        $variant->stock += $item->count;
                        $variant->save();
                    }
                }

                $currentActive->update(['status' => 2]);
            }

            // Không cần trừ stock nữa vì đã trừ khi tạo
            $flashSale->update(['status' => 1]);
        }

        elseif ($newStatus === 2) {
            // Trường hợp End chính nó → hoàn trả stock
            foreach ($flashSale->items as $item) {
                $variant = $item->variant;
                if ($variant) {
                    $variant->stock += $item->count;
                    $variant->save();
                }
            }

            $flashSale->update(['status' => 2]);
        }

        elseif ($newStatus === 0) {
            // Inactive → không hoàn trả gì, chỉ update trạng thái
            $flashSale->update(['status' => 0]);
        }
    });

    return redirect()->route('admin.flash-sales.index')->with('success', 'Trạng thái flash sale đã được cập nhật.');
}




    // Xóa flash sale
    public function destroy($id)
    {
        $flashSale = FlashSale::findOrFail($id);
        $flashSale->delete();

        return redirect()->route('admin.flash-sales.index')->with('success', 'Flash sale deleted successfully.');
    }

    // (Tuỳ chọn) Xem chi tiết flash sale
    public function show($id)
    {
        $flashSale = FlashSale::findOrFail($id);
        return view('admin.flash-sales.show', compact('flashSale'));
    }

    public function getVariantsByProduct($productId)
    {
        $variants = ProductVariant::where('product_id', $productId)->get(['id', 'name', 'sku']);
        return response()->json($variants);
    }
}
