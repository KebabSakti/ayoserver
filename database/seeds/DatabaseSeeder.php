<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;
use App\CustomClass\IDGenerator;
use App\IntroSlider;
use App\BannerSlide;
use App\MainCategory;
use App\DeliveryType;
use App\SubCategory;
use App\Product;
use App\Discount;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        
        Discount::create([
            'discount_id' => IDGenerator::generate(),
            'product_id' => 'c9678807c10aa42bfc01bd368155d3fa',
            'amount' => mt_rand(0, 50),
            'expired_at' => Carbon::now()->addDays(30)->utc(),
        ]);

    //    for($i=0; $i<=50; $i++){
    //     $price = mt_rand(10000, 999999);
    //     $discount = mt_rand(0, 100);
    //     $discount_price = ((100 - $discount) * $price) / 100; 
    //     Product::create([
    //         'product_id' => IDGenerator::generate(),
    //         'sub_category_id' => '62bd033591f2bd23e362d35279d33a08',
    //         'cover' => 'https://source.unsplash.com/random/500x500',
    //         'name' => 'Produk Murah Bagus '.$i,
    //         'price' => $price,
    //         'discount' => $discount,
    //         'discount_price' => $discount_price,
    //     ]);
    //    }
    }
}
