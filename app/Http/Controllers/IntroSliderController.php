<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\IntroSlider;

class IntroSliderController extends Controller
{
    public function fetch(Request $request)
    {
        $query = DB::table('intro_sliders')->where('active', 1);            

        if(!empty($request->items)){
            $query->whereNotIn('intro_id', $request->items);
        }

        $data = $query->get();

        return response()->json($data->toArray(), 200);
    }
}
