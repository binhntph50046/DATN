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
        // dd($products);

        return view('admin.flash-sales.create', compact('products'));
    }

    // Lưu flash sale mới
    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'title' => 'required|string|max:255',
    //         'start_time' => 'required|date',
    //         'end_time' => 'required|date|after:start_time',
    //         'status' => 'required|in:active,inactive',
    //     ]);

    //     $flashSale = new FlashSale();
    //     $flashSale->title = $request->title;
    //     $flashSale->start_time = $request->start_time;
    //     $flashSale->end_time = $request->end_time;
    //     $flashSale->status = $request->status;
    //     $flashSale->slug = Str::slug($request->title); // tạo slug nếu cần
    //     $flashSale->save();

    //     return redirect()->route('admin.flash-sales.index')->with('success', 'Flash sale created successfully.');
    // }

    public function store(FlashSaleRequest $request)
    {
        // Lấy danh sách product_variant_id từ request
        $variantIds = array_column($request->items, 'product_variant_id');

        // Kiểm tra trùng biến thể
        if (count($variantIds) !== count(array_unique($variantIds))) {
            return redirect()->back()
                ->withInput()
                ->withErrors(['items' => 'Các biến thể sản phẩm trong flash sale không được trùng nhau.']);
        }
        try {
            DB::beginTransaction();

            $flashSale = FlashSale::create([
                'name' => $request->name,
                'start_time' => $request->start_time,
                'end_time' => $request->end_time,
                'status' => $request->status,
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
            }

            DB::commit();

            return redirect()->route('admin.flash-sales.index')->with('success', 'Flash sale created successfully.');
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
        $flashSale = FlashSale::findOrFail($id);

        // Chỉ cập nhật trường status
        $request->validate([
            'status' => 'required|boolean',
        ]);

        $flashSale->update($request->only('status'));

        // Không xử lý update hay thêm xóa flash sale items nữa

        return redirect()->route('admin.flash-sales.index')->with('success', 'Flash sale status updated successfully!');
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

    public function returnStock($id)
    {
        $flashSale = FlashSale::findOrFail($id);

        if ($flashSale->status != 2) {
            return redirect()->back()->with('error', 'Flash Sale chưa kết thúc hoặc không thể hoàn trả stock.');
        }

        foreach ($flashSale->items as $item) {
            // Giả sử variant có trường stock để quản lý tồn kho
            $variant = $item->variant;

            if ($variant) {
                // Hoàn trả lại số lượng tồn kho theo count còn lại
                $variant->stock += $item->count;
                $variant->save();

                // Reset count trong flash sale item nếu muốn
                // $item->count = 0;
                // $item->save();
            }
        }

        return redirect()->back()->with('success', 'Hoàn trả stock thành công!');
    }
}
