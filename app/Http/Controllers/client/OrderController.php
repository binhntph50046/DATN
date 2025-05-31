<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController 
{
    public function index()
    {
        $orders = Order::where('user_id', Auth::id())
            ->with(['items.product', 'items.variant'])
            ->latest()
            ->paginate(5);
            
        return view('client.order.index', compact('orders'));
    }

    public function cancel(Request $request, $id)
    {
        $request->validate([
            'cancellation_reason' => 'required|string|max:255'
        ]);

        $order = Order::where('user_id', Auth::id())->findOrFail($id);
        
        // Chỉ cho phép hủy đơn hàng ở trạng thái pending hoặc confirmed
        if (!in_array($order->status, ['pending', 'confirmed'])) {
            return redirect()->back()->with('error', 'Không thể hủy đơn hàng ở trạng thái này!');
        }

        $order->update([
            'status' => 'cancelled',
            'cancel_reason' => $request->cancellation_reason
        ]);
        
        return redirect()->back()->with('success', 'Đã hủy đơn hàng thành công!');
    }
} 