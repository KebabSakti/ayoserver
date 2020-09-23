<?php
namespace App\CustomClass;

use Illuminate\Support\Str;
use Carbon\Carbon;

class IDGenerator
{
    public static function generate()
    {
        $dateNow = Carbon::now()->format('dmYHis');
        $randomNumber = mt_rand(100000000, 999999999);
        $value = md5($dateNow + $randomNumber);

        return $value;
    }
}

?>