<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Courier extends Model
{
    protected $guarded = [];

    public function mitra()
    {
        return $this->belongsTo('App\Mitra', 'mitra_id', 'mitra_id');
    }
}
