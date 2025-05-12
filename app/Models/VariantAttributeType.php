<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VariantAttributeType extends Model
{
    use SoftDeletes;

    protected $table = 'variant_attribute_types';

    protected $fillable = [
        'name',
        'status',
    ];

    public function values()
    {
        return $this->hasMany(VariantAttributeValue::class, 'attribute_type_id');
    }
}
