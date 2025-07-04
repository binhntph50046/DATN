<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductView extends Model
{
    //
    public $timestamps = false;

    protected $fillable = ['user_id', 'product_id', 'viewed_at'];
}
