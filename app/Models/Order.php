<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\OrderItem;
use App\Models\OrderReturn;

class Order extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'subtotal',
        'discount',
        'shipping_fee',
        'total_price',
        'shipping_address',
        'shipping_name',
        'shipping_phone',
        'shipping_email',
        'payment_method',
        'payment_status',
        'shipping_method_id',
        'status',
        'is_paid',
        'notes',
        'cancel_reason',
    ];

    protected $casts = [
        'is_paid' => 'boolean',
        'subtotal' => 'decimal:2',
        'discount' => 'decimal:2',
        'shipping_fee' => 'decimal:2',
        'total_price' => 'decimal:2',
    ];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // public function shippingMethod()
    // {
    //     return $this->belongsTo(ShippingMethod::class);
    // }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function returns()
    {
        return $this->hasMany(OrderReturn::class);
    }

    // Scopes
    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }

    public function scopeCancelled($query)
    {
        return $query->where('status', 'cancelled');
    }

    /**
     * Lấy chi tiết đơn hàng
     */
    public function details()
    {
        return $this->hasMany(OrderItem::class);
    }

    /**
     * Lấy trạng thái đơn hàng dạng text
     */
    public function getStatusTextAttribute()
    {
        $statuses = [
            'pending' => 'Chờ xử lý',
            'confirmed' => 'Đã xác nhận',
            'preparing' => 'Đang chuẩn bị',
            'shipping' => 'Đang giao hàng',
            'completed' => 'Đã hoàn thành',
            'cancelled' => 'Đã hủy',
            'returned' => 'Đã hoàn đơn',
            'partially_returned' => 'Hoàn một phần',
        ];
        return $statuses[$this->status] ?? $this->status;
    }

    /**
     * Lấy trạng thái thanh toán dạng text
     */
    public function getPaymentStatusTextAttribute()
    {
        $statuses = [
            'pending' => 'Chờ thanh toán',
            'paid' => 'Đã thanh toán',
            'failed' => 'Thanh toán thất bại',
            'refunded' => 'Đã hoàn tiền',
        ];
        return $statuses[$this->payment_status] ?? $this->payment_status;
    }

    /**
     * Lấy phương thức thanh toán dạng text
     */
    public function getPaymentMethodTextAttribute()
    {
        $methods = [
            'cod' => 'Thanh toán khi nhận hàng',
            'bank_transfer' => 'Chuyển khoản/QR/VNPay',
            'credit_card' => 'Thẻ tín dụng',
        ];
        return $methods[$this->payment_method] ?? $this->payment_method;
    }
}
