<?php

namespace App\Http\Controllers\admin;

use Illuminate\Routing\Controller;
use Illuminate\Http\Request;
use App\Models\OrderReturn;
use Illuminate\Support\Facades\Auth;
use App\Events\OrderStatusUpdated;
class OrderReturnController extends Controller
{
    /**
     * Hiển thị danh sách yêu cầu hoàn hàng
     */
    public function index()
    {
        // Lấy tất cả yêu cầu hoàn hàng, mới nhất lên đầu
        $returns = OrderReturn::with(['order', 'user', 'admin'])->latest()->paginate(20);
        return view('admin.order_returns.index', compact('returns'));
    }

    /**
     * Hiển thị chi tiết một yêu cầu hoàn hàng
     */
    public function show($id)
    {
        $return = OrderReturn::with(['order', 'user', 'admin'])->findOrFail($id);
        return view('admin.order_returns.show', compact('return'));
    }

    /**
     * Duyệt yêu cầu hoàn hàng
     */
    public function approve(Request $request, $id)
    {
        $return = \App\Models\OrderReturn::with('items.orderItem.product')->findOrFail($id);

        // Tính tổng tiền hoàn lại
        $refundAmount = 0;
        $restockArr = $request->input('restock', []);
        foreach ($return->items as $item) {
            $refundAmount += $item->orderItem->price * $item->quantity;
            $restock = isset($restockArr[$item->id]);
            $item->restock = $restock;
            $item->save();
            if ($restock) {
                $item->orderItem->product->increment('stock', $item->quantity);
            }
        }

        // Cập nhật trạng thái hoàn hàng
        $return->update([
            'status' => 'approved',
            'admin_id' => Auth::id(),
            'processed_at' => now(),
        ]);
        event(new OrderStatusUpdated($return->order));

        // Cập nhật số tiền đã hoàn vào đơn hàng
        $order = $return->order;
        $order->refunded_amount = ($order->refunded_amount ?? 0) + $refundAmount;
        $order->total_price = $order->total_price - $refundAmount;

        // Tính tổng số lượng sản phẩm trong đơn và số lượng đã hoàn
        $totalOrderQty = $order->items->sum('quantity');
        $totalReturnedQty = 0;
        foreach ($order->returns as $r) {
            if ($r->status == 'approved') {
                foreach ($r->items as $item) {
                    $totalReturnedQty += $item->quantity;
                }
            }
        }
        if ($totalReturnedQty >= $totalOrderQty) {
            $order->status = 'returned';
        } elseif ($totalReturnedQty > 0) {
            $order->status = 'partially_returned';
        }
        $order->save();

       

        return redirect()->route('admin.order-returns.index')->with('success', 'Đã duyệt yêu cầu hoàn hàng. Đã hoàn lại ' . number_format($refundAmount) . ' VNĐ cho khách.');
    }
    /**
     * Từ chối yêu cầu hoàn hàng
     */
    public function reject($id)
    {
        $return = OrderReturn::findOrFail($id);
        $return->update([
            'status' => 'rejected',
            'admin_id' => Auth::id(),
            'processed_at' => now(),
        ]);
        return redirect()->route('admin.order-returns.index')->with('success', 'Đã từ chối yêu cầu hoàn hàng.');
    }
}
