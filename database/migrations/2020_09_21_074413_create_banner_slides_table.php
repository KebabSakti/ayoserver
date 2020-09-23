<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBannerSlidesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banner_slides', function (Blueprint $table) {
            $table->id();
            $table->string('promo_id');
            $table->string('main_category_id')->nullable();
            $table->text('url');
            $table->boolean('home')->default(1);
            $table->boolean('active')->default(1);
            $table->text('link')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('banner_slides');
    }
}
