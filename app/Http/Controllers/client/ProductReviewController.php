<?php

namespace App\Http\Controllers;

use App\Models\ProductReview;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class ProductReviewController
{
    public function store(Request $request, Product $product, ProductVariant $variant)
    {
        // Kiểm tra đăng nhập
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'Vui lòng đăng nhập để đánh giá sản phẩm.');
        }

        // Kiểm tra biến thể có thuộc sản phẩm không
        if ($variant->product_id !== $product->id) {
            return back()->with('error', 'Biến thể không hợp lệ.');
        }

        // Kiểm tra đơn hàng hoàn thành
        $hasPurchased = Order::where('user_id', Auth::id())
            ->where('status', 'completed')
            ->whereHas('items', function ($query) use ($variant) {
                $query->where('variant_id', $variant->id);
            })
            ->exists();

        if (!$hasPurchased) {
            return back()->with('error', 'Bạn cần mua và nhận sản phẩm này để đánh giá.');
        }

        // Validate dữ liệu
        $request->validate([
            'rating' => 'required|integer|between:1,5',
            'review' => 'nullable|string|max:1000',
            'images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Tối đa 2MB mỗi ảnh
        ]);

        // Kiểm tra đã đánh giá biến thể này chưa
        $existingReview = ProductReview::where('user_id', Auth::id())
                                      ->where('variant_id', $variant->id)
                                      ->first();

        if ($existingReview) {
            return back()->with('error', 'Bạn đã đánh giá biến thể này rồi.');
        }

        // Xử lý upload ảnh
        $imagePaths = [];
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('reviews', 'public');
                $imagePaths[] = $path;
            }
        }

        // Tạo đánh giá
        ProductReview::create([
            'user_id' => Auth::id(),
            'product_id' => $product->id,
            'variant_id' => $variant->id,
            'rating' => $request->rating,
            'review' => $request->review,
            'images' => $imagePaths,
            'status' => 'active', // Hoặc 'inactive' nếu cần kiểm duyệt
        ]);

        return back()->with('success', 'Đánh giá của bạn đã được gửi thành công.');
    }

    public function index()
    {
        $reviews = ProductReview::with(['user', 'product', 'variant'])->latest()->paginate(10);
        return view('admin.reviews.index', compact('reviews'));
    }

    public function updateStatus(Request $request, ProductReview $review)
    {
        $request->validate([
            'status' => 'required|in:active,inactive',
        ]);

        $review->update(['status' => $request->status]);

        return back()->with('success', 'Cập nhật trạng thái đánh giá thành công.');
    }
}