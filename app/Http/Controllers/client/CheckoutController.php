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
        /** @var \App\Models\User|null $user */
        $user = Auth::user();

        // Lấy variant_id và quantity từ request
        $variantId = $request->input('variant_id');
        $quantity = $request->input('quantity', 1);

        // Khởi tạo biến
        $variant = null;
        $attributes = [];

        // Nếu có variant_id thì lấy thông tin biến thể
        if ($variantId) {
            $variant = ProductVariant::with(['product', 'combinations.attributeValue.attributeType'])
                ->find($variantId);

            if ($variant) {
                foreach ($variant->combinations as $comb) {
                    $type = $comb->attributeValue->attributeType->name ?? '';
                    $value = is_array($comb->attributeValue->value)
                        ? $comb->attributeValue->value[0]
                        : (json_decode($comb->attributeValue->value, true)[0] ?? $comb->attributeValue->value);
                    $attributes[$type] = $value;
                }
            }
        }

        // Kiểm tra nếu user là admin hoặc staff
        if (Auth::check() && ($user && ($user->hasRole('admin') || $user->hasRole('staff')))) {
            $slug = $variant && $variant->product ? $variant->product->slug : $request->input('slug');
            if (!$slug) {
                return redirect()->route('home')->with('error', 'Tài khoản admin và nhân viên không được phép mua hàng!');
            }
            return redirect()->route('product.detail', ['slug' => $slug])->with('error', 'Tài khoản admin và nhân viên không được phép mua hàng!');
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
                'c_fname' => 'required|string|max:255',
                'c_email_address' => 'required|email|max:255',
                'c_phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:11',
                'c_address' => 'required|string|max:255',
                'payment_method' => 'required|in:cod,bank_transfer,credit_card,vnpay',
            ]);

            // Nếu là mua ngay (có variant_id)
            if ($request->has('variant_id')) {
                $request->validate([
                    'variant_id' => 'required|exists:product_variants,id',
                    'quantity' => 'required|integer|min:1',
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

                // Tạo đơn hàng mới
                $order = Order::create([
                    'user_id' => Auth::id(),
                    'subtotal' => $subtotal,
                    'discount' => $discount,
                    'shipping_fee' => $shipping_fee,
                    'total_price' => $total_price,
                    'shipping_address' => $request->c_address,
                    'shipping_name' => $request->c_fname,
                    'shipping_phone' => $request->c_phone,
                    'shipping_email' => $request->c_email_address,
                    'payment_method' => $request->payment_method,
                    'payment_status' => 'pending',
                    'shipping_method_id' => null,
                    'status' => 'pending',
                    'is_paid' => 0,
                    'notes' => $request->c_order_notes,
                ]);

                // Cập nhật mã đơn hàng sau khi có ID
                $order->update([
                    'order_code' => 'DH' . $order->id
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
            } else {
                // Nếu là thanh toán từ giỏ hàng
                $cart = \App\Models\Cart::where('user_id', Auth::id())->first();
                if (!$cart) {
                    throw new \Exception('Giỏ hàng của bạn đang trống!');
                }

                $cartItems = $cart->cartItems()->with(['product', 'variant'])->get();

                if ($cartItems->isEmpty()) {
                    throw new \Exception('Giỏ hàng của bạn đang trống!');
                }

                // Tính toán giá trị đơn hàng
                $subtotal = 0;
                foreach ($cartItems as $item) {
                    $price = $item->variant ? $item->variant->selling_price : $item->product->selling_price;
                    $subtotal += $price * $item->quantity;
                }
                $discount = 0; // Có thể tính giảm giá nếu có voucher
                $shipping_fee = 0; // Có thể lấy từ phương thức vận chuyển
                $total_price = $subtotal + $shipping_fee - $discount;

                // Tạo đơn hàng mới
                $order = Order::create([
                    'user_id' => Auth::id(),
                    'subtotal' => $subtotal,
                    'discount' => $discount,
                    'shipping_fee' => $shipping_fee,
                    'total_price' => $total_price,
                    'shipping_address' => $request->c_address,
                    'shipping_name' => $request->c_fname,
                    'shipping_phone' => $request->c_phone,
                    'shipping_email' => $request->c_email_address,
                    'payment_method' => $request->payment_method,
                    'payment_status' => 'pending',
                    'shipping_method_id' => null,
                    'status' => 'pending',
                    'is_paid' => 0,
                    'notes' => $request->c_order_notes,
                ]);

                // Cập nhật mã đơn hàng sau khi có ID
                $order->update([
                    'order_code' => 'DH' . $order->id
                ]);

                // Tạo chi tiết đơn hàng và cập nhật tồn kho
                foreach ($cartItems as $item) {
                    $price = $item->variant ? $item->variant->selling_price : $item->product->selling_price;
                    $total = $price * $item->quantity;

                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item->product_id,
                        'product_variant_id' => $item->variant_id,
                        'quantity' => $item->quantity,
                        'price' => $price,
                        'total' => $total,
                    ]);

                    // Cập nhật số lượng tồn kho
                    if ($item->variant) {
                        $item->variant->decrement('stock', $item->quantity);
                    }
                }

                // Xóa giỏ hàng sau khi đặt hàng thành công
                $cartItems->each->delete();
            }

            // Sau khi tạo order và commit transaction
            if ($order->shipping_email) {
                // Tạo hoặc lấy hóa đơn
                $invoice = \App\Models\Invoice::where('order_id', $order->id)->first();
                if (!$invoice) {
                    $invoiceCode = 'INV' . str_pad($order->id, 6, '0', STR_PAD_LEFT);
                    $invoice = \App\Models\Invoice::create([
                        'order_id' => $order->id,
                        'invoice_code' => $invoiceCode,
                        'total' => $order->total_price,
                        'issued_by' => null,
                        'issued_at' => now(),
                    ]);
                }
                $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('admin.invoices.pdf', ['invoice' => $invoice]);
                $pdfContent = $pdf->output();
                Mail::to($order->shipping_email)->send(new \App\Mail\InvoicePdfMail($invoice, $pdfContent));
            }

            // Commit transaction nếu mọi thứ OK
            DB::commit();

            // Gửi email hóa đơn
            try {
                $toAddresses = config('mail.to.addresses');
                Log::info('Danh sách email nhận:', ['emails' => $toAddresses]);

                foreach ($toAddresses as $email) {
                    try {
                        Mail::to($email)->send(new OrderInvoice($order));
                        Log::info('Gửi email thành công đến: ' . $email);
                    } catch (\Exception $e) {
                        Log::error('Lỗi gửi email đến ' . $email . ': ' . $e->getMessage());
                    }
                }
            } catch (\Exception $e) {
                // Log lỗi gửi email nhưng không ảnh hưởng đến flow chính
                Log::error('Lỗi gửi email hóa đơn: ' . $e->getMessage());
            }

            // Chuyển hướng sau khi đặt hàng thành công
            if (Auth::check()) {
                return redirect()->route('order.index')
                    ->with('success', 'Đặt hàng thành công!');
            } else {
                return redirect()->route('order.guest.tracking', [
                    'order_code' => $order->order_code,
                    'email' => $order->shipping_email
                ]);
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => $e->getMessage()]);
        }
    }

    public function tracking($orderId)
    {
        // Nếu là request tra cứu từ form
        if ($orderId === 'search') {
            $order_code = request('order_code');
            $order = Order::where('order_code', $order_code)->first();

            if (!$order) {
                return redirect()->route('order.guest.tracking')
                    ->with('error', 'Không tìm thấy đơn hàng. Vui lòng kiểm tra lại mã đơn hàng.');
            }

            return view('client.order.tracking', compact('order'));
        }

        // Nếu là request trực tiếp với ID đơn hàng
        $order = Order::with(['items.product', 'items.variant'])->findOrFail($orderId);
        return view('client.order.tracking', compact('order'));
    }

    /**
     * Hiển thị trang checkout cho giỏ hàng
     */
    public function cartCheckout(Request $request)
    {
        /** @var \App\Models\User|null $user */
        $user = Auth::user();

        // Kiểm tra nếu user là admin hoặc staff
        if (Auth::check() && ($user && ($user->hasRole('admin') || $user->hasRole('staff')))) {
            return redirect()->route('home')->with('error', 'Tài khoản admin và nhân viên không được phép mua hàng!');
        }

        // Lấy giỏ hàng của user
        $cart = \App\Models\Cart::where('user_id', Auth::id())->first();
        if (!$cart) {
            return redirect()->route('cart')->with('error', 'Giỏ hàng của bạn đang trống!');
        }

        // Lấy các sản phẩm được chọn từ request
        $selectedItems = $request->input('selected_items', []);
        if (empty($selectedItems)) {
            return redirect()->route('cart')->with('error', 'Vui lòng chọn ít nhất một sản phẩm để thanh toán!');
        }

        $cartItems = $cart->cartItems()
            ->whereIn('id', $selectedItems)
            ->with(['product', 'variant'])
            ->get();

        if ($cartItems->isEmpty()) {
            return redirect()->route('cart')->with('error', 'Giỏ hàng của bạn đang trống!');
        }

        // Tính toán tổng tiền
        $subtotal = 0;
        foreach ($cartItems as $item) {
            $price = $item->variant ? $item->variant->selling_price : $item->product->selling_price;
            $subtotal += $price * $item->quantity;
        }

        return view('client.checkout.index', compact('cartItems', 'subtotal'));
    }

    /**
     * Xử lý đặt hàng từ giỏ hàng
     */
    public function processCartCheckout(Request $request)
    {
        try {
            DB::beginTransaction();

            // Validate dữ liệu đầu vào
            $request->validate([
                'c_fname' => 'required|string|max:255',
                'c_email_address' => 'required|email|max:255',
                'c_phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:11',
                'c_address' => 'required|string|max:255',
                'payment_method' => 'required|in:cod,bank_transfer,credit_card,vnpay',
                'selected_items' => 'required|array',
            ]);

            // Lấy giỏ hàng của user
            $cart = \App\Models\Cart::where('user_id', Auth::id())->first();
            if (!$cart) {
                throw new \Exception('Giỏ hàng của bạn đang trống!');
            }

            // Lấy các sản phẩm được chọn
            $cartItems = $cart->cartItems()
                ->whereIn('id', $request->selected_items)
                ->with(['product', 'variant'])
                ->get();

            if ($cartItems->isEmpty()) {
                throw new \Exception('Giỏ hàng của bạn đang trống!');
            }

            // Tính toán giá trị đơn hàng
            $subtotal = 0;
            foreach ($cartItems as $item) {
                $price = $item->variant ? $item->variant->selling_price : $item->product->selling_price;
                $subtotal += $price * $item->quantity;
            }
            $discount = 0;
            $shipping_fee = 0;
            $total_price = $subtotal + $shipping_fee - $discount;

            // Tạo đơn hàng mới
            $order = Order::create([
                'user_id' => Auth::id(),
                'subtotal' => $subtotal,
                'discount' => $discount,
                'shipping_fee' => $shipping_fee,
                'total_price' => $total_price,
                'shipping_address' => $request->c_address,
                'shipping_name' => $request->c_fname,
                'shipping_phone' => $request->c_phone,
                'shipping_email' => $request->c_email_address,
                'payment_method' => $request->payment_method,
                'payment_status' => 'pending',
                'shipping_method_id' => null,
                'status' => 'pending',
                'is_paid' => 0,
                'notes' => $request->c_order_notes,
            ]);

            // Cập nhật mã đơn hàng sau khi có ID
            $order->update([
                'order_code' => 'DH' . $order->id
            ]);

            // Tạo chi tiết đơn hàng và cập nhật tồn kho
            foreach ($cartItems as $item) {
                $price = $item->variant ? $item->variant->selling_price : $item->product->selling_price;
                $total = $price * $item->quantity;

                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item->product_id,
                    'product_variant_id' => $item->variant_id,
                    'quantity' => $item->quantity,
                    'price' => $price,
                    'total' => $total,
                ]);

                // Cập nhật số lượng tồn kho
                if ($item->variant) {
                    $item->variant->decrement('stock', $item->quantity);
                }
            }

            // Xóa các sản phẩm đã thanh toán khỏi giỏ hàng
            $cartItems->each->delete();

            // Gửi email hóa đơn
            if ($order->shipping_email) {
                $invoice = \App\Models\Invoice::create([
                    'order_id' => $order->id,
                    'invoice_code' => 'INV' . str_pad($order->id, 6, '0', STR_PAD_LEFT),
                    'total' => $order->total_price,
                    'issued_by' => null,
                    'issued_at' => now(),
                ]);

                $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('admin.invoices.pdf', ['invoice' => $invoice]);
                $pdfContent = $pdf->output();
                Mail::to($order->shipping_email)->send(new \App\Mail\InvoicePdfMail($invoice, $pdfContent));
            }

            DB::commit();

            return redirect()->route('order.index')
                ->with('success', 'Đặt hàng thành công!');

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => $e->getMessage()]);
        }
    }
}
