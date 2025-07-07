<?php
namespace App\Http\Controllers\Admin;

use Chatify\Http\Controllers\ChatifyMessengerController as BaseController;
use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use Config;

use App\Providers\RouteServiceProvider; // Adjust namespace if different

class MessengerController
{
    public function index(Request $request)
    {
        // Check if user is authenticated
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'Please log in first.');
        }

        $id = $request->input('id'); // Recipient ID from request
        if (!$id && Auth::check()) {
            $id = Auth::id(); // Default to current user ID
        }

        $messengerColor = Config::get('chatify.colors.primary', '#1890ff');
        $dark_mode = Auth::check() ? (Auth::user()->dark_mode ?? 'light') : 'light';

        // Check user role
        if (!Auth::user()->hasAnyRole(['admin', 'staff'])) {
            return redirect()->route('home') // Redirect to user dashboard or home
                ->with('error', 'You do not have permission to access the admin chat.');
        }

        return view('admin.livechat.index', compact('id', 'messengerColor', 'dark_mode'));
    }

    // Optional: Method for users to chat with admins
    public function userChat(Request $request)
    {
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'Please log in first.');
        }

        $id = Auth::id(); // Current user ID
        $admin = User::role('admin')->first(); // Get first admin
        if ($admin) {
            $messengerColor = Config::get('chatify.colors.primary', '#1890ff');
            $dark_mode = Auth::check() ? (Auth::user()->dark_mode ?? 'light') : 'light';
            return view('user.chat', compact('id', 'messengerColor', 'dark_mode', 'admin')); 
        }

        return redirect()->route('home')->with('error', 'No admin available to chat.');
    }
}