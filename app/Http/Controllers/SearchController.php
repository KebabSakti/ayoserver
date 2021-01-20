<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomClass\IDGenerator;
use Illuminate\Support\Facades\DB;
use App\Search;
use App\Product;
use App\Viewer;

class SearchController extends Controller
{
    public function search(Request $request) {
        $query = DB::table('searches')
                   ->select('keyword', DB::raw('count(keyword) as hits'));

        //SEARCH BY KEYWORD
        if(!empty($request->keyword)){
            $query->where('keyword', 'like', '%'.$request->keyword.'%');
        }

        //SEARCH HISTORY
        if(!empty($request->history)){
            $query->where('user_id', $request->header('User-Id'));
        }
        
        $data = $query->groupBy('keyword')
                      ->orderBy(DB::raw('count(keyword)'), 'desc')
                      ->limit(10)
                      ->get();

        $parsed = [];

        foreach($data as $item) {
            $product = Product::where('name', 'like', '%'.$item->keyword.'%')->first();
            array_push($parsed, [
                'keyword' => ucwords($item->keyword),
                'hits' => $item->hits,
                'image' => $product['cover'] ?? 'https://res.cloudinary.com/vjtechsolution/image/upload/v1609328068/mock/placeholder.jpg.png',
            ]);
        }

        return response()->json($parsed, 200);
    }

    public function mostSearch(Request $request)
    {
        $data = DB::table('searches')
                  ->select('keyword', DB::raw('count(keyword) as hits'))
                  ->groupBy('keyword')
                  ->orderBy(DB::raw('count(keyword)'), 'desc')
                  ->limit(10)
                  ->get();

        $parsed = [];

        foreach($data as $item) {
            $product = Product::where('name', 'like', '%'.$item->keyword.'%')->first();
            array_push($parsed, [
                'keyword' => ucwords($item->keyword),
                'hits' => $item->hits,
                'image' => $product['cover'] ?? '',
            ]);
        }

        return response()->json($parsed, 200);
    }

    public function searchByKeyword(Request $request)
    {
        $data = DB::table('searches')
                  ->select('keyword', DB::raw('count(keyword) as hits'))
                  ->where('keyword', 'like', '%'.$request->keyword.'%')
                  ->groupBy('keyword')
                  ->orderBy(DB::raw('count(keyword)'), 'desc')
                  ->limit(10)
                  ->get();

        $parsed = [];

        foreach($data as $item) {
            $product = Product::where('name', 'like', '%'.$item->keyword.'%')->first();
            array_push($parsed, [
                'keyword' => ucwords($item->keyword),
                'hits' => $item->hits,
                'image' => $product['cover'] ?? '',
            ]);
        }

        return response()->json($parsed, 200);
    }

    public function searchHistory(Request $request)
    {
        $data = DB::table('searches')
                    ->select('keyword', DB::raw('count(keyword) as hits'))
                    ->where('user_id', $request->header('User-Id'))
                    ->groupBy('keyword')
                    ->orderBy(DB::raw('count(keyword)'), 'desc')
                    ->limit(10)
                    ->get();

        $parsed = [];

        foreach($data as $item) {
            $product = Product::where('name', 'like', '%'.$item->keyword.'%')->first();
            array_push($parsed, [
                'keyword' => ucwords($item->keyword),
                'hits' => $item->hits,
                'image' => $product['cover'] ?? '',
            ]);
        }

        return response()->json($parsed, 200);
    }

    public function saveSearchKeyword(Request $request)
    {
        $search = new Search;
        $search->search_id = IDGenerator::generate();
        $search->user_id = $request->header('User-Id');
        $search->keyword = $request->keyword;
        $search->save();

        return response()->json(null, 200);
    }

    public function clearSearchKeyword(Request $request)
    {
        $search = Search::where('user_id', $request->header('User-Id'));
        $search->delete();

        return response()->json(null, 200);
    }

    public function searchByRandom(Request $request)
    {
        $data = DB::table('searches')
                  ->select('keyword', DB::raw('count(keyword) as hits'))
                  ->groupBy('keyword')
                  ->orderBy(DB::raw('count(keyword)'), 'desc')
                  ->limit(10)
                  ->get();

        return response()->json($data->toArray(), 200);
    }

    public function lastSeenProducts(Request $request) 
    {
        $data = Viewer::with(['product_model'])
                      ->orderBy('updated_at', 'desc')
                      ->limit(10)
                      ->get();

        return response()->json($data->toArray(), 200);
    }
}
