<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\HasSlug;

class Product extends Model
{
    use SoftDeletes, HasSlug;

    protected $table = 'products';

    protected $fillable = [
        'name',
        'slug',
        'description',
        'content',
        'category_id',
        'warranty_months',
        'is_featured',
        'status'
    ];

    protected $casts = [
        'is_featured' => 'boolean',
        'warranty_months' => 'integer'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }

    public function specifications()
    {
        return $this->hasMany(ProductSpecification::class);
    }

    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }

    public function scopeFeatured($query)
    {
        return $query->where('is_featured', true);
    }
}
