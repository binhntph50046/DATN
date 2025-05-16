<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class ShopController
{
    public function index()
    {
        return view('client.shop.index');
    }
}
