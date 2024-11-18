<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecordMinutasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('record_minutas', function (Blueprint $table) {
            $table->id();
            $table->text('anotaciones');
            $table->string('foto')->nullable();
            $table->unsignedBigInteger('subject_id');
            $table->unsignedBigInteger('ubicacion_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('ubicacion_id')->references('id')->on('ubicacions');
            $table->foreign('subject_id')->references('id')->on('subjects');
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
        Schema::dropIfExists('record_minutas');
    }
}
