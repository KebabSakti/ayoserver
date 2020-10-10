<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSaleStatusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sale_statuses', function (Blueprint $table) {
            $table->id();
            $table->string('sale_status_id');
            $table->string('sale_id');
            $table->enum('status', ['Pending', 'Ongoing', 'Complete', 'Cancel']);
            $table->text('note')->nullable();
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
        Schema::dropIfExists('sale_statuses');
    }
}
