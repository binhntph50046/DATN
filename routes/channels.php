<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('orderStatus.{id}', function ($user, $id) {
    return true; // Allow public access to order status updates
});
Broadcast::channel('chat.{userId}', function ($user, $userId) {
    // Chỉ cho phép user có id trùng userId mới được lắng nghe channel này
    return (int) $user->id === (int) $userId;
});
