<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];

    public function sub_category()
    {
        return $this->belongsTo('App\SubCategory', 'sub_category_id', 'sub_category_id');
    }

    public function discount()
    {
        return $this->hasOne('App\Discount', 'product_id', 'product_id');
    }

    public function ratings()
    {
        return $this->hasMany('App\Rating', 'relation_id', 'product_id');
    }

    public function viewers()
    {
        return $this->hasMany('App\Viewer', 'relation_id', 'product_id');
    }
}
