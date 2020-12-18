<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomClass\IDGenerator;
use Illuminate\Support\Facades\DB;
use App\Mitra;
use App\DeliveryType;

class MitraController extends Controller
{
    public function nearest(Request $request)
    {
        $data = DB::table('mitras')
                  ->selectRaw('*, (
                            3959 * acos (
                            cos ( radians(?) )
                            * cos( radians( lat ) )
                            * cos( radians( lng ) - radians(?) )
                            + sin ( radians(?) )
                            * sin( radians( lat ) )
                        )
                    ) AS distance', [$request->lat, $request->lng, $request->lat])
                  ->whereIn('delivery_type_id', $request->delivery_type_id)
                  ->where('status', 'Open')
                  ->where('active', 1)
                  ->orderBy('distance', 'asc')
                  ->limit(10)
                  ->get();

        $mitras = [];

        foreach($data as $item){
            $delivery = DeliveryType::where('delivery_type_id', $item->delivery_type_id)->first();
            $item->delivery_type = $delivery;
            $item->ongkir = strval(($delivery->instant) ? ($item->distance <= 0) ? 5000 : $item->distance * 5000 : 10000);
            array_push($mitras, $item);
        }
        

        return response()->json($mitras, 200);
    }
}
