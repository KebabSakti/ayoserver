<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\MainCategory;

class MainCategoryController extends Controller
{
    public function fetch(Request $request)
    {
        $data = MainCategory::where('active', 1)->get();

        return response()->json($data->toArray(), 200);
    }
}
