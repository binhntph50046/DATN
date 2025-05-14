<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class HomeController
{
    public function index()
    {
        return view('client.index');
    }
}
