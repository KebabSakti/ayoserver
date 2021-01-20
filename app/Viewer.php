<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Viewer extends Model
{
    protected $guarded = [];

    public function product_model()
    {
        return $this->hasOne('App\Product', 'product_id', 'relation_id');
    }
}
