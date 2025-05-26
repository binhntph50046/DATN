<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\ProductVariant;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use App\Mail\OrderInvoice;

class CheckoutController
{
    /**
     * Hiển thị trang checkout với thông tin sản phẩm đã chọn
     */
    public function index(Request $request)
    {
        // Lấy variant_id và quantity từ request
        $variantId = $request->input('variant_id');
        $quantity = $request->input('quantity', 1);

        // Khởi tạo biến
        $variant = null;
        $attributes = [];

        // Nếu có variant_id thì lấy thông tin biến thể
        if ($variantId) {
            // Lấy thông tin biến thể kèm theo product và các thuộc tính
            $variant = ProductVariant::with(['product', 'combinations.attributeValue.attributeType'])
                ->find($variantId);

            if ($variant) {
                // Lấy các thuộc tính của biến thể (màu sắc, dung lượng, ...)
                foreach ($variant->combinations as $comb) {
                    $type = $comb->attributeValue->attributeType->name ?? '';
                    $value = is_array($comb->attributeValue->value) 
                        ? $comb->attributeValue->value[0] 
                        : (json_decode($comb->attributeValue->value, true)[0] ?? $comb->attributeValue->value);
                    $attributes[$type] = $value;
                }
            }
        }

        // Trả về view với các thông tin cần thiết
        return view('client.checkout.index', compact('variant', 'quantity', 'attributes'));
    }

    /**
     * Xử lý đặt hàng
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();

            // Validate dữ liệu đầu vào
            $request->validate([
                'variant_id' => 'required|exists:product_variants,id',
                'quantity' => 'required|integer|min:1',
                'c_fname' => 'required|string|max:255',
                'c_lname' => 'required|string|max:255',
                'c_email_address' => 'required|email|max:255',
                'c_phone' => 'required|string|max:20',
                'c_address' => 'required|string|max:255',
                'payment_method' => 'required|in:cod,bank_transfer,credit_card',
            ]);

            // Lấy thông tin biến thể
            $variant = ProductVariant::with('product')->findOrFail($request->variant_id);

            // Kiểm tra số lượng tồn kho
            if ($variant->stock < $request->quantity) {
                throw new \Exception('Số lượng sản phẩm trong kho không đủ!');
            }

            // Tính toán giá trị đơn hàng
            $price = $variant->selling_price;
            $quantity = $request->quantity;
            $subtotal = $price * $quantity;
            $discount = 0; // Có thể tính giảm giá nếu có voucher
            $shipping_fee = 0; // Có thể lấy từ phương thức vận chuyển
            $total_price = $subtotal + $shipping_fee - $discount;

            // Map payment_method nếu chọn QR/VNPay trên giao diện (ví dụ: truyền bank_transfer)
            $paymentMethod = $request->payment_method;

            // Tạo đơn hàng mới
            $order = Order::create([
                'user_id' => Auth::id(),
                'subtotal' => $subtotal,
                'discount' => $discount,
                'shipping_fee' => $shipping_fee,
                'total_price' => $total_price,
                'shipping_address' => $request->c_address,
                'shipping_name' => $request->c_fname . ' ' . $request->c_lname,
                'shipping_phone' => $request->c_phone,
                'shipping_email' => $request->c_email_address,
                'payment_method' => $paymentMethod,
                'payment_status' => 'pending',
                'shipping_method_id' => null, // Có thể lấy từ form nếu có
                'status' => 'pending',
                'is_paid' => 0,
                'notes' => $request->c_order_notes,
            ]);

            // Tạo chi tiết đơn hàng (order_items)
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $variant->product->id,
                'product_variant_id' => $variant->id,
                'quantity' => $quantity,
                'price' => $price,
                'total' => $subtotal,
            ]);

            // Cập nhật số lượng tồn kho
            $variant->decrement('stock', $quantity);

            // Commit transaction nếu mọi thứ OK
            DB::commit();

            // Gửi email hóa đơn
            try {
                Mail::to($order->shipping_email)->send(new OrderInvoice($order));
            } catch (\Exception $e) {
                // Log lỗi gửi email nhưng không ảnh hưởng đến flow chính
                Log::error('Lỗi gửi email hóa đơn: ' . $e->getMessage());
            }

            // Chuyển hướng sang trang theo dõi/tracking đơn hàng
            return redirect()->route('order.tracking', $order->id);

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => $e->getMessage()]);
        }
    }

    public function resendInvoice($orderId)
    {
        $order = Order::with(['items.product', 'items.variant'])->findOrFail($orderId);
        
        try {
            Mail::to($order->shipping_email)->send(new OrderInvoice($order));
            return redirect()->back()->with('success', 'Đã gửi lại hóa đơn qua email thành công!');
        } catch (\Exception $e) {
            Log::error('Lỗi gửi email hóa đơn: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Không thể gửi email hóa đơn: ' . $e->getMessage());
        }
    }

    public function tracking($orderId)
    {
        $order = Order::with(['items.product', 'items.variant'])->findOrFail($orderId);
        return view('client.order.tracking', compact('order'));
    }

    public function invoice($orderId)
    {
        $order = Order::with(['items.product', 'items.variant'])->findOrFail($orderId);
        return view('client.order.invoice', compact('order'));
    }
}
