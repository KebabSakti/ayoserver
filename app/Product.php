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

    public function viewer()
    {
        return $this->hasOne('App\Viewer', 'relation_id', 'product_id');
    }

    public function delivery_type()
    {
        return $this->hasOne('App\DeliveryType', 'delivery_type_id', 'delivery_type_id');
    }

    public function sale_details()
    {
        return $this->hasMany('App\SaleDetail', 'product_id', 'product_id');
    }

    public function rating_weight()
    {
        return $this->hasOne('App\RatingWeight', 'relation_id', 'product_id');
    }

    public function product_sale()
    {
        return $this->hasOne('App\ProductSale', 'product_id', 'product_id');
    }

    public function product_search()
    {
        return $this->hasOne('App\ProductSearch', 'product_id', 'product_id');
    }

    public function unit()
    {
        return $this->hasOne('App\Unit', 'unit_id', 'unit_id');
    }

    public function favourite()
    {
        return $this->hasOne('App\Favourite', 'product_id', 'product_id');
    }
}
