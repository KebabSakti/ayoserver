<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\CustomClass\IDGenerator;
use App\Customer;

class AuthCustomerController extends Controller
{
    public function guestAccess(Request $request)
    {
        $guest = Customer::create([
            'user_id' => IDGenerator::generate(),
            'password' => Hash::make('guest'),
        ]);
        
        //generate api token
        $token = $guest->createToken('Guest Access Token')->accessToken;
        
        $data = $guest;
        $data['token'] = $token;
        
        return response()->json($data->toArray());
    }
}
