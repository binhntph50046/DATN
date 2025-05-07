<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;

class DashboardController
{
    public function index()
    {
        return view('admin.dashboard');
    }
}
