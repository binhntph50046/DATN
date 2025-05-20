<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VariantAttributeValue extends Model
{
    use SoftDeletes;

    protected $table = 'variant_attribute_values';

    protected $fillable = [
        'attribute_type_id',
        'value',
        'hex',
        'status',
        'sort_order'
    ];

    public function attributeType()
    {
        return $this->belongsTo(VariantAttributeType::class, 'attribute_type_id');
    }

    public function variants()
    {
        return $this->belongsToMany(ProductVariant::class, 'variant_combinations', 'attribute_value_id', 'variant_id')
            ->withTimestamps();
    }
}
