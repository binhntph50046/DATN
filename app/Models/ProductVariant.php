<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductVariant extends Model
{
    use SoftDeletes;

    protected $table = 'product_variants';

    protected $fillable = [
        'product_id',
        'sku',
        'name',
        'slug',
        'stock',
        'purchase_price',
        'selling_price',
        'discount_price',
        'status',
        'is_default'
    ];

    protected $casts = [
        'purchase_price' => 'decimal:2',
        'selling_price' => 'decimal:2',
        'discount_price' => 'decimal:2',
        'is_default' => 'boolean'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function combinations()
    {
        return $this->hasMany(VariantCombination::class, 'variant_id');
    }

    public function attributeValues()
    {
        return $this->belongsToMany(VariantAttributeValue::class, 'variant_combinations', 'variant_id', 'attribute_value_id')
            ->withTimestamps();
    }
}
