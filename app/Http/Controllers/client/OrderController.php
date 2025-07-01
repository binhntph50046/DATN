<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\ResendInvoiceRequest;
use App\Models\ProductReview;

class OrderController
{
    public function index(Request $request)
    {
        if (Auth::check()) {
            // Người dùng đã đăng nhập
            $query = Order::where('user_id', Auth::id());
        } else {
            // Người dùng chưa đăng nhập
            return view('client.order.guest_tracking');
        }

        if ($request->has('status') && $request->status != null) {
            $query->where('status', $request->status);
        }

        $orders = $query->orderBy('created_at', 'desc')->paginate(10);

        $reviewedOrders = ProductReview::where('user_id', Auth::id())
            ->pluck('order_id')
            ->toArray();

        return view('client.order.index', compact('orders', 'reviewedOrders'));
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

        // Nếu đơn hàng đã thanh toán qua VNPay
        if ($order->payment_method === 'vnpay' && $order->is_paid) {
            return redirect()->back()->with('warning', 'Đơn hàng đã được thanh toán qua VNPay. Vui lòng liên hệ với chúng tôi qua hotline hoặc email để được hỗ trợ hoàn tiền.');
        }

        $order->update([
            'status' => 'cancelled',
            'cancel_reason' => $request->cancellation_reason
        ]);

        return redirect()->back()->with('success', 'Đã hủy đơn hàng thành công!');
    }

    public function guestTracking(Request $request)
    {
        // Nếu có order_code trong request (người dùng đã tra cứu)
        if ($request->has('order_code')) {
            $order = Order::where('order_code', $request->order_code)
                ->where('shipping_email', $request->email)
                ->first();

            if (!$order) {
                return redirect()->back()->with('error', 'Không tìm thấy đơn hàng. Vui lòng kiểm tra lại mã đơn hàng và email.');
            }

            // Nếu tìm thấy đơn hàng, chuyển đến trang tracking
            return redirect()->route('order.tracking', ['order' => $order->id]);
        }

        // Nếu không có order_code, hiển thị form tra cứu
        return view('client.order.guest_tracking');
    }
}
