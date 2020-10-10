<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BannerSlide;

class BannerSlideController extends Controller
{
    public function fetch(Request $request)
    {

        if($request->target == 'home'){
            $data = BannerSlide::where('home', 1)
                               ->where('active', 1)
                               ->get();
        }else if($request->target == 'kategori'){
            $data = BannerSlide::where('main_category_id', $request->id)
                               ->where('active', 1)        
                               ->get();
        }

        return response()->json($data->toArray(), 200);
    }
}
