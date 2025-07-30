<?php

namespace App\Http\Controllers\admin;

use App\Models\Voucher;
use Illuminate\Http\Request;

class VoucherController
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Voucher::query();

        // Purpose
        if ($request->filled('purpose')) {
            $query->where('purpose', $request->purpose);
        }

        // Type
        if ($request->filled('type')) {
            $query->where('type', $request->type);
        }

        // Status
        if ($request->filled('status')) {
            $query->where('is_active', $request->status === 'active' ? 1 : 0);
        }

        // Expires before
        if ($request->filled('expires_before')) {
            $query->whereDate('expires_at', '<=', $request->expires_before);
        }

        // Expires after
        if ($request->filled('expires_after')) {
            $query->whereDate('expires_at', '>=', $request->expires_after);
        }

        // Search
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('code', 'like', '%' . $request->search . '%')
                    ->orWhere('description', 'like', '%' . $request->search . '%');
            });
        }

        $vouchers = $query->latest()->paginate(10)->withQueryString();

        return view('admin.vouchers.index', compact('vouchers'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.vouchers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'code' => 'required|string|unique:vouchers,code',
            'type' => 'required|in:fixed,percentage',
            'value' => 'required|numeric|min:0',
            'min_order_amount' => 'nullable|numeric|min:0',
            'expires_at' => 'required|date|after_or_equal:today',
            'usage_limit' => 'integer|min:0',
            'per_user_limit' => 'integer|min:0',
            'is_active' => 'boolean',
            'purpose' => 'required|in:product_discount,free_shipping',
            'description' => 'nullable|string|max:255',
        ], [
            'code.required' => 'Mã voucher là bắt buộc.',
            'code.string' => 'Mã voucher phải là chuỗi ký tự.',
            'code.unique' => 'Mã voucher đã tồn tại.',

            'type.required' => 'Vui lòng chọn loại giảm giá.',
            'type.in' => 'Loại giảm giá không hợp lệ.',

            'value.required' => 'Giá trị giảm là bắt buộc.',
            'value.numeric' => 'Giá trị giảm phải là số.',
            'value.min' => 'Giá trị giảm không được nhỏ hơn 0.',

            'min_order_amount.numeric' => 'Giá trị đơn hàng tối thiểu phải là số.',
            'min_order_amount.min' => 'Giá trị đơn hàng tối thiểu không được nhỏ hơn 0.',

            'expires_at.required' => 'Vui lòng nhập ngày hết hạn.',
            'expires_at.date' => 'Ngày hết hạn không hợp lệ.',
            'expires_at.after_or_equal' => 'Ngày hết hạn phải từ hôm nay trở đi.',

            'usage_limit.integer' => 'Giới hạn sử dụng phải là số nguyên.',
            'usage_limit.min' => 'Giới hạn sử dụng không được nhỏ hơn 0.',

            'per_user_limit.integer' => 'Giới hạn mỗi người dùng phải là số nguyên.',
            'per_user_limit.min' => 'Giới hạn mỗi người dùng không được nhỏ hơn 0.',

            'is_active.boolean' => 'Trạng thái hoạt động không hợp lệ.',

            'purpose.required' => 'Vui lòng chọn mục đích sử dụng voucher.',
            'purpose.in' => 'Mục đích sử dụng không hợp lệ.',

            'description.max' => 'Mô tả không được vượt quá 255 ký tự.',
        ]);

        Voucher::create($data);
        return redirect()->route('admin.vouchers.index')->with('success', 'Voucher đã được tạo thành công.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Voucher $voucher)
    {
        return view('admin.vouchers.show', compact('voucher'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Voucher $voucher)
    {
        return view('admin.vouchers.edit', compact('voucher'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Voucher $voucher)
    {
        $data = $request->validate([
            'min_order_amount' => 'nullable|numeric|min:0',
            'expires_at' => 'required|date|after_or_equal:today',
            'usage_limit' => 'integer|min:0',
            'per_user_limit' => 'integer|min:0',
            'is_active' => 'boolean',
            'description' => 'nullable|string|max:255',
        ], [
            'min_order_amount.numeric' => 'Giá trị đơn hàng tối thiểu phải là số.',
            'min_order_amount.min' => 'Giá trị đơn hàng tối thiểu không được nhỏ hơn 0.',

            'expires_at.required' => 'Vui lòng nhập ngày hết hạn.',
            'expires_at.date' => 'Ngày hết hạn không hợp lệ.',
            'expires_at.after_or_equal' => 'Ngày hết hạn phải từ hôm nay trở đi.',

            'usage_limit.integer' => 'Giới hạn sử dụng phải là số nguyên.',
            'usage_limit.min' => 'Giới hạn sử dụng không được nhỏ hơn 0.',

            'per_user_limit.integer' => 'Giới hạn mỗi người dùng phải là số nguyên.',
            'per_user_limit.min' => 'Giới hạn mỗi người dùng không được nhỏ hơn 0.',

            'is_active.boolean' => 'Trạng thái hoạt động không hợp lệ.',

            'description.max' => 'Mô tả không được vượt quá 255 ký tự.',
        ]);
        $voucher->update($data);
        return redirect()->route('admin.vouchers.index')->with('success', 'Voucher đã được cập nhật thành công.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Voucher $voucher)
    {
        $voucher->delete();
        return redirect()->route('admin.vouchers.index')->with('success', 'Voucher đã được xóa thành công.');
    }
}
