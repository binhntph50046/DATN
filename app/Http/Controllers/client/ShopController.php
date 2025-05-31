<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\Category;

class ShopController
{
    public function index()
    {
        $categories = Category::with(['products' => function($query) {
            $query->with('reviews')
                  ->where('status', 1)
                  ->orderBy('created_at', 'desc');
        }])->where('status', 1)->get();

        return view('client.shop.index', compact('categories'));
    }
}
