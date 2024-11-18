<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('rol');
            $table->date('fecha_nacimiento');
            $table->string('direccion');
            $table->string('ciudad');
            $table->string('telefono_uno', 15);
            $table->string('telefono_dos', 15)->nullable();
            $table->string('numero_documento', 20);
            $table->unsignedBigInteger('tipo_documento_id');
            $table->string('estado', 2);
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('tipo_documento_id')->references('id')->on('tipo_documentos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
