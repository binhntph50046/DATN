<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VariantCombination extends Model
{
    protected $table = 'variant_combinations';

    protected $fillable = [
        'variant_id',
        'attribute_value_id'
    ];

    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'variant_id');
    }

    public function attributeValue()
    {
        return $this->belongsTo(VariantAttributeValue::class, 'attribute_value_id');
    }
}
