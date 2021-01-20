<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Builder;
use App\CustomClass\IDGenerator;
use App\Product;
use App\Favourite;
use App\Viewer;

class ProductController extends Controller
{
    public function fetchProductTerbaru(Request $request)
    {
        $query = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ])->limit(1);

        $data = $query->get()->toArray();

        return response()->json($data, 200);
    }

    public function fetch(Request $request)
    {
        $query = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ]);

        //PRODUK TERAKHIR DILIHAT
        if(!empty($request->seen)){
            $query->whereHas('viewer', function($q) use($request) {
                $q->where('user_id', $request->header('User-Id'));
            });
        }

        //FAVOURITE PRODUK
        if(!empty($request->favourite)){
            $query->whereHas('favourite', function($q) use($request) {
                $q->where('user_id', $request->header('User-Id'));
            });
        }

        //PRODUK BERDASARKAN  MAIN KATEGORI 
        if(!empty($request->main_category_id)){
            $query->where('main_category_id', $request->main_category_id);
        }

        //PRODUK BERDASARKAN  SUB KATEGORI 
        if(!empty($request->sub_category_id)){
            $query->where('sub_category_id', $request->sub_category_id);
        }

        //FILTER BERDASARKAN KEYWORD
        if(!empty($request->keyword)){
            $query->where(function(Builder $query) use($request) {
                $query->where('name', 'like', '%'.$request->keyword.'%')
                      ->orWhere('tag', 'like', '%'.$request->keyword.'%');
            });
        }

        //TERLARIS FILTER
        if(!empty($request->terlaris)){
            $query->whereHas('product_sale_model');
        }       

        //DISKON FILTER
        if(!empty($request->diskon)){
            $query->where('discount', '>', 0);
        }

        //PALING DI CARI FILTER
        if(!empty($request->search)){
            $query->whereHas('product_search');
        }

        //VIEWER FILTER (POPULER)
        if(!empty($request->view)){
            $query->whereHas('viewer');
        }

        //RATING FILTER
        if(!empty($request->rating)){
            $query->whereHas('rating_weight_model', function($q) use($request) {
                $q->where('rating', '>=', $request->rating);
            });
        }

        //JENIS PENGIRIMAN FILTER
        if(!empty($request->pengiriman)){
            $val = $request->pengiriman == 'instant' ? 1:0;
            $query->whereHas('delivery_type_model', function($q) use($val) {
                $q->where('instant', $val);
            });
        }

        //FILTER HARGA
        if(!empty($request->harga_min) && !empty($request->harga_max)){
            $query->where('last_price', '>=', $request->harga_min)
                  ->where('last_price', '<=', $request->harga_max);
        }

        //SORTING
        if(!empty($request->sorting)){
            if($request->sorting == 'latest'){
                $sort = 'DESC';
            }elseif($request->sorting == 'oldest'){
                $sort = 'ASC';
            }elseif($request->sorting == 'expensive'){
                $sort = 'DESC';
            }elseif($request->sorting == 'cheapest'){
                $sort = 'ASC';
            }

            //SORTING BERDASARKAN TANGGAL UPLOAD DAN ID
            if($request->sorting == 'latest' || $request->sorting == 'oldest'){
                $query->orderBy('created_at', $sort)
                      ->orderBy('id', $sort);
            }

            //SORTING BERDASARKAN HARGA
            if($request->sorting == 'expensive' || $request->sorting == 'cheapest'){
                $query->orderBy('last_price', $sort);
            }
        }

        $data = $query->paginate(10);

        return response()->json($data->toArray(), 200);
    }

    public function toggleFavourite(Request $request)
    {
        $favourite = Favourite::where('product_id', $request->product_id)
                              ->where('user_id', $request->header('User-Id'))
                              ->first();

        if(empty($favourite)) {
            //add
            Favourite::create([
                'favourite_id' => IDGenerator::generate(),
                'product_id' => $request->product_id,
                'user_id' => $request->header('User-Id'),
            ]);
        }else{
            //clear
            $favourite->delete();
        }

        $query = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ])->where('product_id', $request->product_id);

        $data = $query->get();

        return response()->json($data->toArray(), 200);
    }

    public function isFavourite(Request $request)
    {
        $favourite = Favourite::where('product_id', $request->product_id)
                              ->where('user_id', $request->header('User-Id'))
                              ->first();

        return response()->json($favourite != null ? 1:0, 200);
    }

    public function addProductViewer($request) 
    {
        $data = Viewer::where('relation_id', $request->product_id)
                      ->where('user_id', $request->header('User-Id'))
                      ->first();

        if($data != null){
            $data->increment('view');
        }else{
            Viewer::create([
                'viewer_id' => IDGenerator::generate(),
                'relation_id' => $request->product_id,
                'user_id' => $request->header('User-Id'),
                'view' => 1,
            ]);
        }

        return response()->json(true, 200);
    }

    public function fetchProductDetail(Request $request)
    {
        //tambahkan viewer
        $this->addProductViewer($request);
        
        $query = Product::with([
            'rating_weight_model', 
            'delivery_type_model', 
            'unit_model',
            'product_sale_model',
            'view_model',
            'favourite_model' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
        ])->where('product_id', $request->product_id);

        $data = $query->get();

        return response()->json($data->toArray(), 200);
    }
}
