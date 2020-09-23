<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Product;

class ProductController extends Controller
{
    public function fetchProductTerbaru(Request $request)
    {

        $data = Product::with(['discount', 'ratings', 'sub_category.main_category.delivery_type'])
                       ->where('active', 1)
                       ->orderBy('created_at', 'desc')
                       ->take(10)
                       ->get();

        return response()->json($data->toArray(), 200);
    }
}
