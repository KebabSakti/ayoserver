<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MainCategory extends Model
{
    protected $guarded = [];

    public function sub_category_model()
    {
        return $this->hasMany('App\SubCategory', 'main_category_id', 'main_category_id');
    }
}
