<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hoja_de_vida extends Model
{
    use HasFactory;
    protected $table = 'hojas_de_vida';

    protected $fillable = [
        'user_id',
        'informacion_general',
        'informacion_personal',
        'informacion_familiar',
        'educacion_aptitudes',
        'trayectoria_empresas',
        'experiencia_laboral',
        'referencias_personales',
        'administracion_proceso_seleccion',
        'foto',
        'firma',
        'soportes',
    ];

    public function usuario() {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
