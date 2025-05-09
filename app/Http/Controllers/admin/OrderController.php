<?php

namespace App\Http\Controllers\admin;

use Illuminate\Routing\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

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
        $order = Order::withTrashed()->with(['user', 'items.product', 'items.productVariant'])->findOrFail($id);
        return view('admin.orders.show', compact('order'));
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
            ->with('success', 'Xóa đơn hàng thành công');
    }

    public function trash()
    {
        $orders = Order::onlyTrashed()->latest()->paginate(10);
        return view('admin.orders.trash', compact('orders'));
    }

    public function restore($id)
    {
        $order = Order::withTrashed()->findOrFail($id);
        $order->restore();
        return redirect()->route('admin.orders.trash')->with('success', 'Khôi phục đơn hàng thành công!');
    }

    public function forceDelete($id)
    {
        $order = Order::withTrashed()->findOrFail($id);
        $order->forceDelete();
        return redirect()->route('admin.orders.trash')->with('success', 'Đã xóa vĩnh viễn đơn hàng!');
    }
}

