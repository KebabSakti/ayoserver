<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeliveryType extends Model
{
    protected $guarded = [];

    public function main_categories()
    {
        return $this->hasMany('App\MainCategory');
    }
}
