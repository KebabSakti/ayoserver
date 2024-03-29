<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomClass\IDGenerator;
use Illuminate\Support\Facades\DB;
use App\Cart;

class ShoppingCartController extends Controller
{
   public function fetch(Request $request)
   {
        $data = Cart::with(['product' => function($q) {
            $q->with('delivery_type', 'unit')->where('active', 1);
        }])
        ->where('user_id', $request->header('User-Id'))
        ->orderBy('id', 'desc')
        ->get();

        return response()->json($data->toArray(), 200);
   }

   public function add(Request $request)
   {
        $data = Cart::where('product_id', $request->product_id)
                    ->where('user_id', $request->header('User-Id'))
                    ->first();

        if(empty($data)){
            $data = Cart::create([
                'cart_id' => IDGenerator::generate(),
                'user_id' => $request->header('User-Id'),
                'product_id' => $request->product_id,
                'price' => $request->price,
                'qty' => 1,
                'total' => $request->price,
            ]);
        }else{
            // $data = Cart::where('product_id', $request->product_id)
            //             ->where('user_id', $request->header('User-Id'))
            //             ->update([
            //                 'qty' => $request->qty,
            //                 'total' => $request->total,
            //             ]);

            $data->increment('qty');
            $data->increment('total', $request->price);
        }

        $datas = Cart::with(['product' => function($q) {
            $q->with('delivery_type', 'unit')->where('active', 1);
        }])
        ->where('user_id', $request->header('User-Id'))
        ->orderBy('id', 'desc')
        ->get();

        return response()->json($datas->toArray(), 200);
   }

   public function update(Request $request)
   {
        DB::transaction(function () use($request) { 
            Cart::where('user_id', $request->header('User-Id'))->delete();           
            if(!empty($request->item)){
                foreach($request->item as $item){
                    $data = Cart::where('product_id', $item['product_id'])->first();
                    $cartId = ($data != null) ? $data->cart_id : IDGenerator::generate();
                    $cart = [
                        'cart_id' => $cartId,
                        'user_id' => $request->header('User-Id'),
                        'checked' => true,
                        'product_id' => $item['product_id'],
                        'price' => $item['price'],
                        'qty' => $item['qty'],
                        'total' => $item['total'],
                        'note' => $item['note'] ?? null,
                    ];

                    Cart::create($cart);
                }
            }
        });

        return response()->json(true, 200);
   }

   public function delete(Request $request, $id)
   {
        $data = Cart::where('product_id', $id)
                    ->where('user_id', $request->header('User-Id'))
                    ->first();

        if($data != null){
            $data->delete();
        }

        $datas = Cart::with(['product' => function($q) {
            $q->with('delivery_type', 'unit')->where('active', 1);
        }])
        ->where('user_id', $request->header('User-Id'))
        ->orderBy('id', 'desc')
        ->get();

        return response()->json($datas->toArray(), 200);
   }

   public function clear(Request $request)
   {

   }
}
