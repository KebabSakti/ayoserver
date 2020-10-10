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
    Route::post('banner_slide', 'BannerSlideController@fetch')->name('banner_slide.fetch');
    //MAIN CATEGORY
    Route::get('main_category', 'MainCategoryController@fetch')->name('main_category.fetch');
    //SUB CATEGORY
    Route::get('sub_category/id/{id}', 'SubCategoryController@fetch')->name('sub_category.fetch');
    //PRODUCT
    Route::post('product/terbaru', 'ProductController@fetchProductTerbaru')->name('product.terbaru.fetch');
    //MORE PRODUCT
    Route::post('product', 'ProductController@fetch')->name('product.fetch');
    //DETAIL PRODUCT
    Route::post('product/detail', 'ProductController@fetchProductDetail')->name('product.fetchProductDetail');
    //SHOPPING CART
    Route::get('cart', 'ShoppingCartController@fetch')->name('cart.fetch');
    Route::post('cart', 'ShoppingCartController@add')->name('cart.add');
    Route::post('cart/update', 'ShoppingCartController@update')->name('cart.update');
    Route::delete('cart/{id}/delete', 'ShoppingCartController@delete')->name('cart.delete');
    Route::post('cart/clear', 'ShoppingCartController@clear')->name('cart.clear');
});
