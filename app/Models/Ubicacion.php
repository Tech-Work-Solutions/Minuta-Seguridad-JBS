<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ubicacion extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',        
        'sede_id'
    ];

    public function sede(){
        return $this->belongsTo('App\Models\Sede', 'sede_id');
    }
}
