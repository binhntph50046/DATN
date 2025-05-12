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
        'status',
    ];

    public function attributeType()
    {
        return $this->belongsTo(VariantAttributeType::class, 'attribute_type_id');
    }

    public function combinations()
    {
        return $this->hasMany(VariantCombination::class, 'attribute_value_id');
    }
}
