<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderReturn extends Model
{
    // Các trường có thể gán giá trị hàng loạt
    protected $fillable = [
        'order_id', 'user_id', 'status', 'reason', 'image', 'admin_id', 'processed_at'
    ];

    // Kiểu dữ liệu cho các trường
    protected $casts = [
        'processed_at' => 'datetime',
    ];

    /**
     * Đơn hàng liên quan đến yêu cầu hoàn hàng
     */
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    /**
     * Người gửi yêu cầu hoàn hàng (khách hàng)
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Admin xử lý yêu cầu hoàn hàng
     */
    public function admin()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }

    public function items()
    {
        return $this->hasMany(OrderReturnItem::class);
    }
} 