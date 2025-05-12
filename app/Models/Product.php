<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    protected $table = 'products';

    protected $fillable = [
        'name',
        'slug',
        'description',
        'content',
        'discount_price',
        'stock',
        'category_id',
        'model',
        'series',
        'warranty_months',
        'is_featured',
        'status',
        'image',
        'has_variants',
        'purchase_price',
        'selling_price',
    ];

    protected $casts = [
        'is_featured' => 'boolean',
        'has_variants' => 'boolean',
        'discount_price' => 'decimal:2',
        'purchase_price' => 'decimal:2',
        'selling_price' => 'decimal:2',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function attributes()
    {
        return $this->hasMany(ProductAttribute::class);
    }

    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }
}
