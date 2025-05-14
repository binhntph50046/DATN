<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class CheckoutController
{
    public function index()
    {
        return view('client.checkout.index');
    }   
}
