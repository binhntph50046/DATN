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
            'expires_at' => 'date',
            'usage_limit' => 'integer|min:0',
            'per_user_limit' => 'integer|min:0',
            'is_active' => 'boolean',
            'purpose' => 'required|in:product_discount,free_shipping',
            'description' => 'nullable|string|max:255',
        ]);
        Voucher::create($data);
        return redirect()->route('admin.vouchers.index')->with('success', 'Successfully created');
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
            'code' => 'required|string|unique:vouchers,code,' . $voucher->id,
            'type' => 'required|in:fixed,percentage',
            'value' => 'required|numeric|min:0',
            'min_order_amount' => 'nullable|numeric|min:0',
            'expires_at' => 'date',
            'usage_limit' => 'integer|min:0',
            'per_user_limit' => 'integer|min:0',
            'is_active' => 'boolean',
            'purpose' => 'required|in:product_discount,free_shipping',
            'description' => 'nullable|string|max:255',
        ]);
        $voucher->update($data);
        return redirect()->route('admin.vouchers.index')->with('success', 'Successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Voucher $voucher)
    {
        $voucher->delete();
        return redirect()->route('admin.vouchers.index')->with('success', 'Successfully deleted');
    }
}
