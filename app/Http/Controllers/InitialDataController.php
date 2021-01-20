<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\IntroSlider;
use App\Cart;
use App\Sales;
use App\BannerSlide;
use App\MainCategory;
use App\Product;
use App\Search;

class InitialDataController extends Controller
{
    public function fetchInitialPage(Request $request)
    {
        $intro = IntroSlider::where('active', 1)->get();
        $cart = Cart::with(['product' => function($q) use($request) {
                        $q->with([
                            'rating_weight_model', 
                            'delivery_type_model', 
                            'unit_model',
                            'product_sale_model',
                            'view_model',
                            'favourite_model' => function($q) use($request){
                                $q->where('user_id', $request->header('User-Id'));
                            },
                        ])->where('active', 1);
                    }])
                    ->where('user_id', $request->header('User-Id'))
                    ->orderBy('id', 'asc')
                    ->get();

        return response()->json([
            'intro_image_model' => $intro->toArray(),
            'shopping_cart_model' => $cart->toArray(),
        ], 200);
    }

    public function fetchInitialHome(Request $request)
    {
        $carousel = BannerSlide::where('home', 1)
                               ->where('active', 1)
                               ->get();

        $category = MainCategory::with(['sub_category_model' => function($q) {
            $q->where('active', 1);
        }])->where('active', 1)->get();

        $popular = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ])->whereHas('product_sale_model')->paginate(10);

        $product = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ])->paginate(10);

        $data = DB::table('searches')
                  ->select('keyword', DB::raw('count(keyword) as hits'))
                  ->groupBy('keyword')
                  ->orderBy(DB::raw('count(keyword)'), 'desc')
                  ->limit(10)
                  ->get();

        $search = [];

        foreach($data as $item) {
            $p = Product::where('name', 'like', '%'.$item->keyword.'%')->first();
            array_push($search, [
                'keyword' => ucwords($item->keyword),
                'hits' => $item->hits,
                'image' => $p['cover'] ?? 'https://res.cloudinary.com/vjtechsolution/image/upload/v1609328068/mock/placeholder.jpg.png',
            ]);
        }

        return response()->json([
            'carousel_banner_model' => $carousel->toArray(),
            'main_category_model' => $category->toArray(),
            'product_popular' => $popular->toArray(),
            'product_paginate_model' => $product->toArray(),
            'most_search_model' => $search,
        ], 200);
    }
}
