<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Record_person extends Model
{
    use HasFactory;

    protected $fillable = [
        'observaciones',
        'destino',
        'entrada_salida',
        'foto',
        'person_id',
        'user_id',
        'audio',
        'video',
        'sede_id',
    ];

    public function person(){
        return $this->belongsTo('App\Models\Person');
    }

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function sede(){
        return $this->belongsTo('App\Models\Sede', 'sede_id');
    }
    
}
