<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mitra extends Model
{
    protected $guarded = [];

    public function couriers()
    {
        return $this->hasMany('App\Courier', 'mitra_id', 'mitra_id');
    }

    public function delivery_type()
    {
        return $this->hasOne('App\DeliveryType', 'delivery_type_id', 'delivery_type_id');
    }
}
