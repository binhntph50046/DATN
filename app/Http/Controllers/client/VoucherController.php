<?php

namespace App\Http\Controllers\client;

use App\Models\Voucher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;

class VoucherController
{
    /**
     * Kiểm tra và áp dụng mã giảm giá
     */
    public function check(Request $request)
    {
        $request->validate([
            'voucher_code' => 'required|string',
            'subtotal' => 'required|numeric|min:0',
        ]);

        $voucher = Voucher::where('code', $request->voucher_code)
            ->where('is_active', 1)
            ->where('expires_at', '>', now())
            ->first();

        if (!$voucher) {
            return response()->json([
                'success' => false,
                'message' => 'Mã giảm giá không hợp lệ hoặc đã hết hạn!'
            ]);
        }

        if ($voucher->min_order_amount && $request->subtotal < $voucher->min_order_amount) {
            return response()->json([
                'success' => false,
                'message' => 'Đơn hàng phải có giá trị tối thiểu ' . number_format($voucher->min_order_amount) . ' VNĐ!'
            ]);
        }

        if ($voucher->usage_limit && $voucher->used_count >= $voucher->usage_limit) {
            return response()->json([
                'success' => false,
                'message' => 'Mã giảm giá đã hết lượt sử dụng!'
            ]);
        }

        // Kiểm tra giới hạn sử dụng cho từng user
        if ($voucher->per_user_limit) {
            $userUsedCount = 0;
            
            if (Auth::check()) {
                // Đếm số lần sử dụng cho user đã đăng nhập
                $userUsedCount = Order::where('user_id', Auth::id())
                    ->where('voucher_id', $voucher->id)
                    ->count();
            } else {
                // Đếm số lần sử dụng cho khách vãng lai dựa trên email
                $userUsedCount = Order::whereNull('user_id')
                    ->where('voucher_id', $voucher->id)
                    ->where('shipping_email', request('email'))
                    ->count();
            }

            if ($userUsedCount >= $voucher->per_user_limit) {
                return response()->json([
                    'success' => false,
                    'message' => 'Bạn đã sử dụng mã giảm giá này tối đa số lần cho phép!'
                ]);
            }
        }

        $discountAmount = 0;
        switch ($voucher->type) {
            case 'percentage':
                $discountAmount = ($request->subtotal * $voucher->value) / 100;
                break;
            case 'fixed':
                $discountAmount = $voucher->value;
                break;
            case 'free_shipping':
                $discountAmount = 0;
                break;
        }

        $discountAmount = min($discountAmount, $request->subtotal);
        $finalTotal = $request->subtotal - $discountAmount;

        return response()->json([
            'success' => true,
            'voucher' => [
                'id' => $voucher->id,
                'code' => $voucher->code,
                'discount_amount' => $discountAmount,
                'final_total' => $finalTotal
            ],
            'message' => 'Áp dụng mã giảm giá thành công!'
        ]);
    }
}
