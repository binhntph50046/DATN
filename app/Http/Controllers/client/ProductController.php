<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class ProductController
{
    public function productDetail()
    {
        return view('client.product.product-detail');
    }
}
