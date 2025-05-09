<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'attribute_name',
        'attribute_value',
    ];

    protected $casts = [
        'attribute_value' => 'string',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}