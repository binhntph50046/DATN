<?php

namespace App\Http\Controllers\client;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderReturn;
use Illuminate\Support\Facades\Auth;

class OrderReturnController
{
    /**
     * Hiển thị form tạo yêu cầu hoàn hàng
     */
    public function create(Order $order)
    {
        if (!$order) {
            return redirect()->route('order.index')->with('error', 'Không tìm thấy đơn hàng!');
        }
        // Kiểm tra xem đơn hàng có thuộc về user hiện tại không
        if ($order->user_id !== Auth::id()) {
            abort(403);
        }

        // Kiểm tra xem đơn hàng đã hoàn thành chưa
        if ($order->status !== 'completed') {
            return redirect()->route('order.index')->with('error', 'Chỉ có thể yêu cầu hoàn hàng cho đơn hàng đã hoàn thành.');
        }

        // Kiểm tra xem đã có yêu cầu hoàn hàng nào chưa
        if ($order->returns()->exists()) {
            return redirect()->route('order.index')->with('error', 'Đơn hàng này đã có yêu cầu hoàn hàng.');
        }

        return view('client.order_return.create', compact('order'));
    }

    /**
     * Lưu yêu cầu hoàn hàng mới
     */
    public function store(Request $request, Order $order)
    {
        // Kiểm tra xem đơn hàng có thuộc về user hiện tại không
        if ($order->user_id !== Auth::id()) {
            abort(403);
        }

        // Validate dữ liệu
        $request->validate([
            'reason' => 'required|string|min:10',
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'proof_video' => 'nullable|mimes:mp4,mov,avi|max:20480', // Max 20MB cho video
            'bank_info' => 'required|string|min:10'
        ]);

        $selectedItems = $request->input('items', []);
        $hasSelected = false;
        foreach ($selectedItems as $itemId => $itemData) {
            if (isset($itemData['selected'])) {
                $hasSelected = true;
                break;
            }
        }
        if (!$hasSelected) {
            return back()->with('error', 'Bạn phải chọn ít nhất 1 sản phẩm để hoàn hàng.');
        }

        // Xử lý upload ảnh nếu có
        $imagePath = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '_' . $image->getClientOriginalName();
            $uploadPath = public_path('uploads/returns');
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0755, true);
            }
            $image->move($uploadPath, $imageName);
            $imagePath = 'uploads/returns/' . $imageName;
        }

        // Xử lý upload video nếu có
        $videoPath = null;
        if ($request->hasFile('proof_video')) {
            $video = $request->file('proof_video');
            $videoName = time() . '_' . $video->getClientOriginalName();
            $uploadPath = public_path('uploads/returns/videos');
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0755, true);
            }
            $video->move($uploadPath, $videoName);
            $videoPath = 'uploads/returns/videos/' . $videoName;
        }

        // Tạo yêu cầu hoàn hàng mới
        $orderReturn = OrderReturn::create([
            'order_id' => $order->id,
            'user_id' => Auth::id(),
            'reason' => $request->reason,
            'image' => $imagePath,
            'proof_video' => $videoPath,
            'bank_info' => $request->bank_info,
            'status' => 'pending'
        ]);

        // Lưu chi tiết sản phẩm hoàn
        foreach ($selectedItems as $itemId => $itemData) {
            if (isset($itemData['selected'])) {
                $quantity = max(1, min($itemData['quantity'], $order->items->find($itemId)->quantity));
                $orderReturn->items()->create([
                    'order_item_id' => $itemId,
                    'quantity' => $quantity
                ]);
            }
        }

        return redirect()->route('order.index')->with('success', 'Yêu cầu hoàn hàng đã được gửi thành công.');
    }

    /**
     * Hiển thị chi tiết yêu cầu hoàn hàng
     */
    public function show(Order $order, OrderReturn $return)
    {
        // Kiểm tra xem đơn hàng có thuộc về user hiện tại không
        if ($order->user_id !== Auth::id()) {
            abort(403);
        }

        // Kiểm tra xem yêu cầu hoàn hàng có thuộc về đơn hàng này không
        if ($return->order_id !== $order->id) {
            abort(404);
        }

        return view('client.order_return.show', compact('order', 'return'));
    }
} 