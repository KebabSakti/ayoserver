<?php

namespace App\Http\Middleware;

use Closure;
use App\Customer;

class CustomerMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!empty($request)){
            $userId = $request->header('User-Id');
            $customer = Customer::where('user_id', $userId)
                                ->where('type', 'customer')
                                ->first();

            if(empty($customer)){
                return response()->json('Unauthorized', 401);
            }
        }else{
            return response()->json('Unauthorized', 401);
        }

        return $next($request);
    }
}
