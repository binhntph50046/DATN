<?php
    
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotificationController
{
    public function index()
    {
        $notifications = auth()->user()->notifications()->latest()->take(10)->get();
        return response()->json($notifications);
    }

    public function markAsRead(Request $request)
    {
        auth()->user()->unreadNotifications->markAsRead();
        return response()->json(['status' => 'done']);
    }
}

?>