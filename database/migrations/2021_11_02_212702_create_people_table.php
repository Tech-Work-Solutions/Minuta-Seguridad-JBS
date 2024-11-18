<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people', function (Blueprint $table) {
            $table->id();
            $table->string('nombres', 100);
            $table->string('apellidos', 100);
            $table->string('numero_documento', 15);
            $table->string('tipo', 15);
            $table->unsignedBigInteger('tipo_documento_id');
            $table->unsignedBigInteger('eps_id');
            $table->unsignedBigInteger('arl_id');
            $table->timestamps();

            $table->foreign('tipo_documento_id')->references('id')->on('tipo_documentos');
            $table->foreign('eps_id')->references('id')->on('eps');
            $table->foreign('arl_id')->references('id')->on('arls');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('people');
    }
}
