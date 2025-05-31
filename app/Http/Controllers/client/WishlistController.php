<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishlistController 
{
    public function index()
    {
        $wishlists = Auth::user()->wishlists()->with('product')->get();
        return view('client.wishlist.index', compact('wishlists'));
    }

    public function add(Product $product)
    {
        $user = Auth::user();
        if (!$user->wishlists()->where('product_id', $product->id)->exists()) {
            Wishlist::create([
                'user_id' => $user->id,
                'product_id' => $product->id,
            ]);
            return redirect()->back()->with('success', 'Đã thêm vào danh sách yêu thích!');
        }
        return redirect()->back()->with('info', 'Sản phẩm đã có trong danh sách yêu thích!');
    }

    public function remove(Product $product)
    {
        Auth::user()->wishlists()->where('product_id', $product->id)->delete();
        return redirect()->back()->with('success', 'Đã xóa sản phẩm khỏi danh sách yêu thích!');
    }
}