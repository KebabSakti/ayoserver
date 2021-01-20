<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $guarded = [];

    protected $with = ['customer_model'];

    public function customer_model()
    {
        return $this->hasOne('App\Customer', 'user_id', 'user_id');
    }
}
