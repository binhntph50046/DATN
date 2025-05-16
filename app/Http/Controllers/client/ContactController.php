<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;

class ContactController
{
    public function index()
    {
        return view('client.contact.index');
    }
}
