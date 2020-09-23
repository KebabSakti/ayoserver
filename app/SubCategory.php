<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    protected $guarded = [];

    public function main_category()
    {
        return $this->belongsTo('App\MainCategory', 'main_category_id', 'main_category_id');
    }

    public function products()
    {
        return $this->hasMany('App\Product');
    }
}
