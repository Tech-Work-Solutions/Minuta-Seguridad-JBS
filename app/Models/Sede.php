<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sede extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',
        'telefono',
        'cliente_id',
        'direccion',
        'estado',
    ];

    public function cliente(){
        return $this->belongsTo('App\Models\Cliente', 'cliente_id');
    }
}
