<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Builder;

use App\Product;

class ProductController extends Controller
{
    public function fetchProductTerbaru(Request $request)
    {
        //filter
        $kategoriId = $request->kategori_id;
        $priceMin = $request->price_min;
        $priceMax = $request->price_max;
        $instant = $request->instant;
        $rating = $request->rating;

        //sorting
        $price = $request->price;
        $date = $request->date;

        //search keyword
        $keyword = $request->keyword;

        $query = Product::with(['discount', 'ratings', 'viewers', 'delivery_type'])
                        ->where('active', 1);
        
        //kategori
        if(!empty($kategoriId)){
            $query->where('sub_category_id', $kategoriId);
        }

        //price min - max
        if(!empty($priceMin) && !empty($priceMax)){
            $query->where('price', '>=', $priceMin)
                  ->where('price', '<=', $priceMax);
        }

        //delivery type (instant or schedule)
        if(!empty($instant)) {
            $query->whereHas('delivery_type', function($q) use($instant) {
                $q->where('instant', $instant);
            });
        }

        //ratings
        if(!empty($rating)) {
            $query->whereHas('ratings', function($q) use($rating) {
                $q->where('star', '>=', $rating);
            });
        }

        //keyword
        if(!empty($keyword)){
            $query->where(function($q) use($keyword) {
                $q->where('name', 'like', '%'.$keyword.'%')
                  ->orWhere('tag', 'like', '%'.$keyword.'%');
            });
        }

        //order by price
        if(!empty($price)){
            $sort = $price ? 'desc':'asc';
            $query->orderBy('price', $sort);
        }

        //order by date
        if(!empty($date)){
            $sort = $date ? 'desc':'asc';
            $query->orderBy('created_at', $sort);
        }

        $data = $query->paginate(10);

        return response()->json($data->toArray(), 200);
    }

    public function fetch(Request $request)
    {
        $query = Product::with([
            'discount', 
            'rating_weight', 
            'delivery_type', 
            'unit',
            'favourite' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
            'product_sale',
        ]);

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
            $query->whereHas('product_sale');
        }       

        //DISKON FILTER
        if(!empty($request->diskon)){
            $query->whereHas('discount');
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
            $query->whereHas('rating_weight', function($q) use($request) {
                $q->where('rating', '>=', $request->rating);
            });
        }

        //JENIS PENGIRIMAN FILTER
        if(!empty($request->pengiriman)){
            $val = $request->pengiriman == 'instant' ? 1:0;
            $query->whereHas('delivery_type', function($q) use($val) {
                $q->where('instant', $val);
            });
        }

        //FILTER HARGA
        if(!empty($request->harga_min) && !empty($request->harga_max)){
            $query->where('price', '>=', $request->harga_min)
                  ->where('price', '<=', $request->harga_max);
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
                $query->orderBy('price', $sort);
            }
        }

        $data = $query->paginate(10);

        return response()->json($data->toArray(), 200);
    }

    public function fetchProductDetail(Request $request)
    {
        $query = Product::with([
            'discount', 
            'rating_weight', 
            'delivery_type', 
            'unit',
            'favourite' => function($q) use($request){
                $q->where('user_id', $request->header('User-Id'));
            },
            'product_sale',
            'viewer',
        ])->where('product_id', $request->product_id);

        $data = $query->first();

        //tambahkan viewer
        $data->viewer()->increment('view');

        return response()->json($data, 200);
    }
}
