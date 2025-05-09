<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductVariant extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'product_id',
        'sku',
        'name',
        'discount_price', // Giữ lại để áp dụng giá khuyến mãi cho biến thể
        'stock',
        'status',
        'image',
        'purchase_price',
        'selling_price',
        'is_default', // Thêm trường đánh dấu biến thể mặc định
    ];

    protected $casts = [
        'discount_price' => 'decimal:2',
        'stock' => 'integer',
        'status' => 'string',
        'purchase_price' => 'decimal:2',
        'selling_price' => 'decimal:2',
        'is_default' => 'boolean',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function attributes()
    {
        return $this->hasMany(VariantAttribute::class, 'variant_id');
    }

    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }
}
