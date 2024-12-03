<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',
        'nit',
        'email',
        'permisos_menu',
        'permisos_formulario',
        'img_header',
        'img_footer',
        'estado'
    ];
}
