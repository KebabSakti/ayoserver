<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentChannelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_channels', function (Blueprint $table) {
            $table->id();
            $table->string('business_id');
            $table->boolean('is_livemode')->default(false);
            $table->string('channel_code');
            $table->string('name');
            $table->string('currency');
            $table->string('channel_category');
            $table->boolean('is_enabled')->default(false);
            $table->decimal('fee_fix', 20, 2)->nullable();
            $table->decimal('fee_percentage', 3, 2)->nullable();
            $table->text('image')->nullable();
            $table->boolean('active')->default(true);
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
        Schema::dropIfExists('payment_channels');
    }
}
