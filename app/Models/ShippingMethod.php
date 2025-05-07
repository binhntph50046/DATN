<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ShippingMethod extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'code',
        'description',
        'base_price',
        'price_per_kg',
        'min_order_amount',
        'max_order_amount',
        'estimated_days',
        'is_active',
    ];

    protected $casts = [
        'base_price' => 'decimal:2',
        'price_per_kg' => 'decimal:2',
        'min_order_amount' => 'decimal:2',
        'max_order_amount' => 'decimal:2',
        'estimated_days' => 'integer',
        'is_active' => 'boolean',
    ];

    public function orders()
    {
        return $this->hasMany(Order::class);
    }
} 