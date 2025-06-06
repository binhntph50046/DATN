<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\ResendInvoiceRequest;

class OrderController 
{
    public function index(Request $request)
    {
        $query = Order::where('user_id', Auth::id());

        if ($request->has('status') && $request->status != null) {
            $query->where('status', $request->status);
        }

        $orders = $query->orderBy('created_at', 'desc')->paginate(10);

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

    public function requestResendInvoice($id)
    {
        $order = Order::findOrFail($id);
        ResendInvoiceRequest::create([
            'order_id' => $order->id,
            'user_id' => Auth::id(),
            'status' => 'pending',
        ]);
        return redirect()->back()->with('success', 'Yêu cầu gửi lại hóa đơn đã được gửi, chờ admin duyệt.');
    }
} 