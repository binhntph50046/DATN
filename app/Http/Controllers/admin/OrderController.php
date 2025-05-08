<?php

namespace App\Http\Controllers\admin;

use Illuminate\Routing\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::with(['user'])->latest()->paginate(10);
        return view('admin.orders.index', compact('orders'));
    }

    public function show(Order $order)
    {
        $order->load(['user']);
        return view('admin.orders.show', compact('order'));
    }

    public function edit(Order $order)
    {
        return view('admin.orders.edit', compact('order'));
    }

    public function update(Request $request, Order $order)
    {
        if (
            ($order->status === 'pending' && $request->status === 'confirmed') ||
            ($order->status === 'confirmed' && $request->status === 'preparing') ||
            ($order->status === 'preparing' && $request->status === 'shipping') ||
            ($order->status === 'shipping' && $request->status === 'completed') ||
            ($order->status === 'completed' && $request->status === 'cancelled')
        ) {
            $order->update([
                'status' => $request->status
            ]);
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['success' => true, 'status' => $order->status]);
            }
            return redirect()->route('admin.orders.show', $order->id)
                ->with('success', 'Đơn hàng đã được xác nhận thành công');
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['success' => false]);
        }
        return redirect()->route('admin.orders.show', $order->id)
            ->with('error', 'Không thể thay đổi trạng thái đơn hàng');
    }

    public function destroy(Order $order)
    {
        $order->delete();
        return redirect()->route('admin.orders.index')
            ->with('success', 'Order deleted successfully');
    }
}

