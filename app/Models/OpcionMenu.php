<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OpcionMenu extends Model
{
    use HasFactory;

    protected $table = 'opciones_menu';

    protected $fillable = [
        'nombre',        
        'estado'
    ];
}
