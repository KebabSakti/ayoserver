<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomClass\IDGenerator;
use Illuminate\Support\Facades\DB;
use App\PaymentChannel;

class PaymentChannelController extends Controller
{
    public function fetch(Request $request)
    {
        $data = PaymentChannel::where('active', 1)->orderBy('id', 'desc')->get();
        
        return response()->json($data->toArray(), 200);
    }
}
