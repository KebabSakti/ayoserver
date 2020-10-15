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
}
