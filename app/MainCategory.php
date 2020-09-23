<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MainCategory extends Model
{
    protected $guarded = [];

    public function delivery_type()
    {
        return $this->belongsTo('App\DeliveryType', 'delivery_type_id', 'delivery_type_id');
    }

    public function sub_categories()
    {
        return $this->hasMany('App\SubCategory');
    }
}
