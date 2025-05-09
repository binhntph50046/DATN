<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\OrderItem;

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
        'notes'
    ];

    protected $casts = [
        'is_paid' => 'boolean',
        'subtotal' => 'decimal:2',
        'discount' => 'decimal:2',
        'shipping_fee' => 'decimal:2',
        'total_price' => 'decimal:2'
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
}
