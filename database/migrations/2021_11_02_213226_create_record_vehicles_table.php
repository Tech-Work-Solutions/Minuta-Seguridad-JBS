<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecordVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('record_vehicles', function (Blueprint $table) {
            $table->id();
            $table->text('observaciones');
            $table->string('entrada_salida');
            $table->string('foto')->nullable();
            $table->unsignedBigInteger('vehicle_id');
            $table->unsignedBigInteger('driver_id');
            $table->unsignedBigInteger('origin_id');
            $table->unsignedBigInteger('volqueta_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('vehicle_id')->references('id')->on('vehicles');
            $table->foreign('driver_id')->references('id')->on('drivers');
            $table->foreign('origin_id')->references('id')->on('origins');
            $table->foreign('volqueta_id')->references('id')->on('volquetas');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('record_vehicles');
    }
}
