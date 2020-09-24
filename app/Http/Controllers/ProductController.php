<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Product;

class ProductController extends Controller
{
    public function fetchProductTerbaru(Request $request)
    {
        $kategoriId = $request->filter[0];
        $priceMin = $request->filter[1];
        $priceMax = $request->filter[2];
        $instant = $request->filter[3];
        $rating = $request->filter[4];
        $view = $request->filter[5];

        $query = Product::with(['discount', 'ratings', 'sub_category.main_category.delivery_type'])
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

        //deivery type (instant or schedule)
        if(!empty($instant)) {
            $query->whereHas('sub_category.main_category.delivery_type', function($q) use($instant) {
                $q->where('instant', $instant);
            });
        }

        //deivery type (instant or schedule)
        if(!empty($rating)) {
            $query->whereHas('ratings', function($q) use($rating) {
                $q->where('star', '>=', $rating);
            });
        }

        $data = $query->paginate(10);

        return response()->json($data->toArray(), 200);
    }
}
