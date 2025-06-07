<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Routing\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Events\OrderStatusUpdated;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $query = Order::query();

        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('shipping_name', 'like', "%$search%")
                  ->orWhere('shipping_email', 'like', "%$search%")
                  ->orWhere('id', $search);
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $orders = $query->latest()->paginate(10)->appends($request->all());
        return view('admin.orders.index', compact('orders'));
    }
    public function show($id)
    {
        $order = Order::withTrashed()->with(['user', 'items.product', 'items.variant'])->findOrFail($id);
        return view('admin.orders.show', compact('order'));
    }
    public function updateStatus(Request $request, $id)
    {
        $order = Order::findOrFail($id);
       // Nếu đơn đã bị huỷ hoặc đã hoàn thành thì không cho cập nhật nữa

    if (in_array($order->status, ['cancelled', 'completed'])) {
        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'success' => false,
                'message' => 'Đơn hàng đã ' . ($order->status === 'cancelled' ? 'bị hủy' : 'hoàn thành') . ', không thể cập nhật trạng thái.'
            ]);
        }
        return redirect()->route('admin.orders.show', $order->id)
            ->with('error', 'Không thể cập nhật trạng thái vì đơn hàng đã ' . ($order->status === 'cancelled' ? 'bị hủy' : 'hoàn thành') . '.');
    }
        // danh sách các trạng thái có thể thay đổi từ trạng thái hiện tại
        $status = [
            "pending" => ["confirmed", "cancelled"],
            "confirmed" => ["preparing", "cancelled"],
            "preparing" => ["shipping","cancelled"],
            "shipping" => ["completed"],
            "completed" => [],
            "cancelled" => []
        ];
        $new_status = $request->status;
        if(isset($status[$order->status]) && in_array($new_status, $status[$order->status])) {
            $order->update(['status' => $new_status]);
            event(new OrderStatusUpdated($order));
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['success' => true, 'status' => $order->status]);
            }   
            return redirect()->route('admin.orders.show', $order->id)
                    ->with('success', 'Cập nhật trạng thái đơn hàng thành công');
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['success' => false]);
        }
        return redirect()->route('admin.orders.show', $order->id)
            ->with('error', 'Không thể cập nhật trạng thái đơn hàng');
    }
}


