<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MainCategory extends Model
{
    protected $guarded = [];

    public function sub_categories()
    {
        return $this->hasMany('App\SubCategory');
    }
}
