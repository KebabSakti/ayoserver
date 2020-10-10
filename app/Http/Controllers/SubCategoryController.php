<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SubCategory;

class SubCategoryController extends Controller
{
    public function fetch(Request $request, $id)
    {
        $data = SubCategory::where('main_category_id', $id)
                           ->where('active', 1)
                           ->get();

        return response()->json($data->toArray(), 200);
    }
}
