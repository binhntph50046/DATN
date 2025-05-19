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


    public function update(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        
        // danh sách các trạng thái có thể thay đổi từ trạng thái hiện tại
        $status = [
            "pending" => ["confirmed", "cancelled"],
            "confirmed" => ["preparing", "cancelled"],
            "preparing" => ["shipping"],
            "shipping" => ["completed"],
            "completed" => [],
            "cancelled" => []
        ];
        
        $new_status = $request->status;
        if(isset($status[$order->status]) && in_array($new_status, $status[$order->status])) {
            $order->update(['status' => $new_status]);
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['success' => true, 'status' => $order->status]);
            }   
            return redirect()->route('admin.orders.show', $order->id)
                ->with('success', 'Cập nhật trạng thái thành công');
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['success' => false]);
        }
        return redirect()->route('admin.orders.show', $order->id)
            ->with('error', 'Không thể cập nhật trạng thái đơn hàng');
    }
}


//     public function destroy(Order $order)
//     {
//         $order->delete();
//         return redirect()->route('admin.orders.index')
//             ->with('success', 'Successfully deleted order');
//     }

//     public function trash()
//     {
//         $orders = Order::onlyTrashed()->latest()->paginate(10);
//         return view('admin.orders.trash', compact('orders'));
//     }

//     public function bulkRestore(Request $request)
//     {
//         $ids = $request->input('ids', []);
//         if (!empty($ids)) {
//             Order::withTrashed()->whereIn('id', $ids)->restore();
//             return redirect()->route('admin.orders.trash')->with('success', 'Successfully restored selected orders!');
//         }
//         return redirect()->route('admin.orders.trash')->with('error', 'Please select at least one order!');
//     }

//     public function bulkForceDelete(Request $request)
//     {
//         $ids = $request->input('ids', []);
//         if (!empty($ids)) {
//             Order::withTrashed()->whereIn('id', $ids)->forceDelete();
//             return redirect()->route('admin.orders.trash')->with('success', 'Successfully deleted selected orders!');
//         }
//         return redirect()->route('admin.orders.trash')->with('error', 'Please select at least one order!');
//     }
// }

