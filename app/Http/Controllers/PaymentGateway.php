<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentGateway extends Controller
{
    public function payment(Request $request)
    {
        return response()->json($request->toArray());
    }
}
