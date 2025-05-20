<?php

namespace App\Http\Controllers\client;

use App\Models\Banner;
use Illuminate\Http\Request;

class HomeController
{
    public function index()
    {
        // banners
        $banners = Banner::where('status', 'active')
            ->orderBy('order')
            ->get();
        return view('client.index',['banners' => $banners]);
    }
}
