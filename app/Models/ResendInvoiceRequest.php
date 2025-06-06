<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ResendInvoiceRequest extends Model
{
    protected $fillable = [
        'order_id', 'user_id', 'status', 'admin_id', 'approved_at'
    ];

    protected $casts = [
        'approved_at' => 'datetime',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function admin()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }
} 