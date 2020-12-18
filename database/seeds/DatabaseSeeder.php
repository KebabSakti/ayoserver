<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Arr;

use Carbon\Carbon;
use App\CustomClass\IDGenerator;
use App\IntroSlider;
use App\BannerSlide;
use App\MainCategory;
use App\DeliveryType;
use App\SubCategory;
use App\Product;
use App\Discount;
use App\Rating;
use App\Customer;
use App\SaleDetail;
use App\Sale;
use App\RatingWeight;
use App\Viewer;
use App\ProductSale;
use App\Search;
use App\ProductSearch;
use App\Unit;
use App\Cart;
use App\Favourite;
use App\Mitra;
use App\Courier;
use App\PaymentChannel;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        PaymentChannel::create([
            "business_id" => "5e035db9246aad2a269f2bc3",
            "is_livemode" => false,
            "channel_code" => "COD",
            "name" => "COD Bayar di Tujuan",
            "currency" => "IDR",
            "channel_category" => "COD",
            "is_enabled" => true,
            "fee_fix" => null,
            "fee_percentage" => null,
            "image" => 'https://res.cloudinary.com/vjtechsolution/image/upload/v1607616027/mock/cod.png',
        ]);

        // $search = Search::all();

        // foreach($search as $item) {
        //     $userId = Customer::inRandomOrder()->first();
        //     Search::where('id', $item->id)->update(['user_id' => $userId->user_id]);
        // }

        // for($i=0; $i<5; $i++){
        //     $mitra = Mitra::create([
        //         'mitra_id' => IDGenerator::generate(),
        //         'name' => 'Mitra '.$i,
        //         'address' => 'Alamat Mitra '.$i,
        //         'owner' => 'Owner '.$i,
        //         'phone' => '08125498266'.$i,
        //         'lat' => '-0.481518',
        //         'lng' => '117.132648',
        //     ]);

        //     for($x=0; $x<2; $x++){
        //         Courier::create([
        //             'courier_id' => IDGenerator::generate(),
        //             'mitra_id' => $mitra->mitra_id,
        //             'name' => 'Corier '.$x,
        //             'phone' => '08521234560'.$x,
        //             'password' => bcrypt('buyung'),
        //         ]);
        //     }
        // }

        // for($i=1; $i<=10; $i++){
        //     $p = Product::inRandomOrder()->first();
        //     $q = mt_rand(1, 20);
        //     $r = mt_rand(1000, 300000);
        //     $t = $r * $q;
        //     Cart::create([
        //         'cart_id' => IDGenerator::generate(),
        //         'user_id' => '5874fd60379fbb7de09507e6d1a2cd1c',
        //         'product_id' => $p->product_id,
        //         'price' => $r,
        //         'qty' => $q,
        //         'total' => $t,
        //     ]);
        // }

        // $names = [
        //     "Orange - Canned, Mandarin",
        //     "Vaccum Bag 10x13",
        //     "Cheese - St. Paulin",
        //     "Tia Maria",
        //     "Cheese - Mozzarella, Shredded",
        //     "Sambuca - Ramazzotti",
        //     "Lettuce Romaine Chopped",
        //     "Table Cloth - 53x69 Colour",
        //     "Apple - Delicious, Red",
        //     "Quail - Whole, Boneless",
        //     "Mix - Cocktail Strawberry Daiquiri",
        //     "Pasta - Penne, Rigate, Dry",
        //     "Wine - Puligny Montrachet A.",
        //     "Lamb - Shanks",
        //     "Yeast Dry - Fleischman",
        //     "Oil - Olive",
        //     "Extract - Almond",
        //     "Juice Peach Nectar",
        //     "Temperature Recording Station",
        //     "Beer - Labatt Blue"
        // ];



        // Product::update([
        //     'caption' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a metus quis ante suscipit tristique eu vitae neque. Nullam consectetur ultrices erat, vel cursus quam finibus quis. Nulla sed orci tristique, pellentesque nulla vitae, feugiat enim. Maecenas ac urna tempus, pulvinar metus at, varius dolor. Curabitur sapien quam, maximus sed orci vitae, condimentum fermentum quam. Nullam fermentum, diam in sagittis iaculis, ex erat vehicula lectus, a venenatis ligula odio sed justo. Sed vestibulum sagittis interdum. Nulla magna nulla, iaculis id egestas nec, cursus a augue. Duis a auctor nisl. Curabitur tincidunt velit convallis mauris vestibulum commodo.

        //     Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tortor risus, blandit id tincidunt sit amet, lobortis nec neque. Ut non neque felis. Nulla non urna est. Cras luctus risus velit, non faucibus dolor suscipit non. Aenean euismod enim ultrices leo efficitur, a finibus velit ullamcorper. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus tincidunt purus vel placerat facilisis. Nunc quis vulputate urna, quis accumsan lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt nisi et eros vehicula gravida. Vestibulum massa magna, efficitur eget turpis eget, gravida volutpat justo. Pellentesque molestie rutrum blandit. Vivamus molestie, elit vel lobortis iaculis, augue augue elementum tellus, vestibulum dignissim turpis nunc quis lacus.'
        // ]);


            // for($i=0; $i<=500; $i++){
            //     $customer = Customer::inRandomOrder()->first();
            //     $data = Product::inRandomOrder()->first();

            //     Favourite::create([
            //         'favourite_id' => IDGenerator::generate(),
            //         'user_id' => $customer->user_id,
            //         'product_id' => $data->product_id,
            //     ]);
            // }

        // $n = ['Gr', 'Kg', 'Pcs'];

        // foreach($n as $n){
        //     Unit::create([
        //         'unit_id' => IDGenerator::generate(),
        //         'amount' => 1,
        //         'unit' => $n,
        //     ]);
        // }

        // $sub = SubCategory::all();

        // foreach($sub as $item){
        //     $data = MainCategory::inRandomOrder()->first();
        //     SubCategory::where('sub_category_id', $item->sub_category_id)
        //            ->update([
        //                 'main_category_id' => $data->main_category_id,
        //         ]);
        // }

        // $product = Product::all();

        // foreach($product as $p){

        //     $data = Unit::inRandomOrder()->first();
            
        //     Product::where('product_id', $p->product_id)
        //            ->update([
        //                 'unit_id' => $data->unit_id,
        //         ]);

        //         // $data = SubCategory::inRandomOrder()->first();
            
        //         // Product::where('product_id', $p->product_id)
        //         //        ->update([
        //         //             'main_category_id' => $data->main_category_id,
        //         //             'sub_category_id' => $data->sub_category_id,
        //         //     ]);
        // }

        // for($i=0; $i<=100; $i++){
        //     $product = Product::inRandomOrder()->first();
        //     $data = ProductSearch::where('product_id', $product->product_id)->first();
            
        //     if($data == null){
        //         ProductSearch::create([
        //             'product_search_id' => IDGenerator::generate(),
        //             'product_id' => $product->product_id,
        //             'hits' => 1,
        //         ]);
        //     }else{
        //         $data->increment('hits');
        //     }

        //     // $randomName = Arr::random($names);
        //     // $data = Search::where('keyword', 'like', '%'.$randomName.'%')->first();
            
        //     // if($data == null){
        //     //     Search::create([
        //     //         'search_id' => IDGenerator::generate(),
        //     //         'keyword' => $randomName,
        //     //         'hits' => 1,
        //     //     ]);
        //     // }else{
        //     //     $data->increment('hits');
        //     // }
        // }

        // $data = SaleDetail::all();

        // foreach($data as $item){
        //     $prod = ProductSale::where('product_id', $item->product_id)->first();
        //     if($prod == null){
        //         ProductSale::create([
        //             'product_sale_id' => IDGenerator::generate(),
        //             'product_id' => $item->product_id,
        //             'qty_total' => $item->qty,
        //             'amount_total' => $item->total,
        //         ]);
        //     }else{
        //         $prod->increment('qty_total', $item->qty);
        //         $prod->increment('amount_total', $item->total);
        //     }
        // }

        // for($i=0; $i<=500; $i++){
        //     $customer = Customer::inRandomOrder()->first();
        //     $produk = Product::inRandomOrder()->first();
        //     $sale = Sale::inRandomOrder()->first();
        //     $delivery = DeliveryType::inRandomOrder()->first();
        //     $qty = mt_rand(1, 100);        
        //     $total = $qty * $produk->price;
        //     $star = mt_rand(1, 5);

        //     // SaleDetail::create([
        //     //     'sale_detail_id' => IDGenerator::generate(),
        //     //     'sale_id' => $sale->sale_id,
        //     //     'delivery_type_id' => $delivery->delivery_type_id,
        //     //     'product_id' => $produk->product_id,
        //     //     'qty' => $qty,
        //     //     'total' => $total,
        //     // ]);

            

        //     $rw = Viewer::where('relation_id', $produk->product_id)->first();
        //     $one = $star == 1 ? $star:0;
        //     $two = $star == 2 ? $star:0;
        //     $three = $star == 3 ? $star:0;
        //     $four = $star == 4 ? $star:0;
        //     $five = $star == 5 ? $star:0;

        //     if($rw == null){
        //         Viewer::create([
        //             'viewer_id' => IDGenerator::generate(),
        //             'relation_id' => $produk->product_id,
        //             'user_id' => $customer->user_id,
        //             'view' => 1,
        //         ]);
        //     }else{
        //         $rw->increment('view');
        //     }

        //     $rw = RatingWeight::where('relation_id', $produk->product_id)->first();
        //     $one = $star == 1 ? $star:0;
        //     $two = $star == 2 ? $star:0;
        //     $three = $star == 3 ? $star:0;
        //     $four = $star == 4 ? $star:0;
        //     $five = $star == 5 ? $star:0;

        //     if($rw == null){
        //         RatingWeight::create([
        //             'rating_weight_id' => IDGenerator::generate(),
        //             'relation_id' => $produk->product_id,
        //             'one' => $one,
        //             'two' => $two,
        //             'three' => $three,
        //             'four' => $four,
        //             'five' => $five,
        //             'total_vote' => 1,
        //             'rating' => ($one + $two + $three + $four + $five ) / 1,
        //         ]);
        //     }else{
        //         $rw->increment('one', $one);
        //         $rw->increment('two', $two);
        //         $rw->increment('three', $three);
        //         $rw->increment('four', $four);
        //         $rw->increment('five', $five);
        //         $rw->increment('total_vote');
                
        //         $rating = ($rw->one + $rw->two + $rw->three + $rw->four + $rw->five ) / $rw->total_vote;
                
        //         $rw->rating = round($rating, 2);
        //         $rw->save();
        //     }
        // }   
        
        // Discount::create([
        //     'discount_id' => IDGenerator::generate(),
        //     'product_id' => 'c9678807c10aa42bfc01bd368155d3fa',
        //     'amount' => mt_rand(0, 50),
        //     'expired_at' => Carbon::now()->addDays(30)->utc(),
        // ]);

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
