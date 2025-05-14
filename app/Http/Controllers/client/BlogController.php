<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class BlogController
{
    public function index()
    {
        return view('client.blog.index');
    }
}
