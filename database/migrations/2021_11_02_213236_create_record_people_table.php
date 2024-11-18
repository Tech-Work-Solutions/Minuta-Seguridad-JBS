<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecordPeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('record_people', function (Blueprint $table) {
            $table->id();
            $table->string('destino');
            $table->string('entrada_salida');
            $table->text('observaciones');
            $table->string('foto')->nullable();
            $table->unsignedBigInteger('person_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('person_id')->references('id')->on('people');
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
        Schema::dropIfExists('record_people');
    }
}
