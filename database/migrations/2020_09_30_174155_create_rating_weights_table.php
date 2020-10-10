<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRatingWeightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rating_weights', function (Blueprint $table) {
            $table->id();
            $table->string('rating_weight_id');
            $table->string('relation_id');
            $table->bigInteger('one')->default(0);
            $table->bigInteger('two')->default(0);
            $table->bigInteger('three')->default(0);
            $table->bigInteger('four')->default(0);
            $table->bigInteger('five')->default(0);
            $table->bigInteger('total_vote')->default(0);
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
        Schema::dropIfExists('rating_weights');
    }
}
