<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];

    protected $with = ['product_info_model', 'rating_model'];

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

    public function delivery_type_model()
    {
        return $this->hasOne('App\DeliveryType', 'delivery_type_id', 'delivery_type_id');
    }

    public function sale_details()
    {
        return $this->hasMany('App\SaleDetail', 'product_id', 'product_id');
    }

    public function rating_weight_model()
    {
        return $this->hasOne('App\RatingWeight', 'relation_id', 'product_id');
    }

    public function product_sale_model()
    {
        return $this->hasOne('App\ProductSale', 'product_id', 'product_id');
    }

    public function product_search()
    {
        return $this->hasOne('App\ProductSearch', 'product_id', 'product_id');
    }

    public function unit_model()
    {
        return $this->hasOne('App\Unit', 'unit_id', 'unit_id');
    }

    public function favourite_model()
    {
        return $this->hasMany('App\Favourite', 'product_id', 'product_id');
    }

    public function product_info_model()
    {
        return $this->hasMany('App\ProductInfo', 'product_id', 'product_id');
    }

    public function rating_model()
    {
        return $this->hasMany('App\Rating', 'relation_id', 'product_id');
    }

    public function view_model()
    {
        return $this->hasOne('App\Viewer', 'relation_id', 'product_id')->selectRaw('sum(view) as total_view, relation_id')->groupBy('relation_id');
    }
}
