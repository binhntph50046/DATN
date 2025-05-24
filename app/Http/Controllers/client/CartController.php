<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class CartController
{
    public function index()
    {
        return view('client.cart.index');
    }   
}
