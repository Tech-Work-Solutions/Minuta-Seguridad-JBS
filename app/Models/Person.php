<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    use HasFactory;

    
    protected $fillable = [
        'nombres',
        'apellidos',
        'numero_documento',
        'tipo',
        'tipo_documento_id',
        'eps_id',
        'arl_id',
    ];

    public function arl(){
        return $this->belongsTo('App\Models\Arl');
    }

    public function eps(){
        return $this->belongsTo('App\Models\Eps');
    }

    public function tipo_documento(){
        return $this->belongsTo('App\Models\Tipo_documento');
    }
}
