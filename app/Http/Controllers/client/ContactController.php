<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\Contact;
use App\Models\Subscriber;
use App\Mail\ThankYouMail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ContactController 
{
    public function index()
    {
        return view('client.contact.index');
    }

    public function store(Request $request)
    {$validated = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name'  => 'required|string|max:255',
            'email'      => 'required|email',
            'phone'      => 'nullable|string',
            'message'    => 'required|string',
        ]);

        // Lưu dữ liệu vào database
        $contact = Contact::create($validated);

        // Gửi email cảm ơn
        Mail::to($contact->email)->send(new ThankYouMail($contact));

        // Nếu khách đồng ý nhận email
        if ($request->has('subscribe') && $request->boolean('subscribe')) {
            // Nếu chưa có email này trong subscribers thì lưu
            Subscriber::firstOrCreate(['email' => $validated['email']]);
        }

        // Trả về redirect nếu là form submit thông thường
        return redirect()->back()->with('success', 'Your message has been sent!');
    }
}
