<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryCouriersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_couriers', function (Blueprint $table) {
            $table->id();
            $table->string('delivery_courier_id');
            $table->string('courier_id');
            $table->string('sale_id');
            $table->decimal('distance', 20, 2);
            $table->integer('eta');
            $table->decimal('fee', 20, 2);
            $table->text('delivery_note')->nullable();
            $table->enum('status', ['Terima','Tolak','Time Out','Antaran','Selesai','Batal Customer','Batal Kurir']);
            $table->text('status_note')->nullable();
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
        Schema::dropIfExists('delivery_couriers');
    }
}
