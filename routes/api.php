<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//AUTH
Route::group(['prefix' => 'auth'], function () {  
    //GUEST
    Route::group(['prefix' => 'customer'], function() {
        Route::get('guest_access', 'AuthCustomerController@guestAccess')->name('auth.guest.access');
    });
});

//GLOBAL
Route::group(['middleware' => ['auth:api']], function() {
    //INTRO SLIDER
    Route::post('intro_slider', 'IntroSliderController@fetch')->name('intro_slider.fetch');
    //BANNER SLIDER
    Route::get('banner_slide/target/{target}', 'BannerSlideController@fetch')->name('banner_slide.fetch');
    //MAIN CATEGORY
    Route::get('main_category', 'MainCategoryController@fetch')->name('main_category.fetch');
    //PRODUCT
    Route::post('product/terbaru', 'ProductController@fetchProductTerbaru')->name('product.terbaru.fetch');
});
