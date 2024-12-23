<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Record_minuta extends Model
{
    use HasFactory;

    protected $fillable = [
        'anotaciones',
        'foto',
        'subject_id',
        'ubicacion_id',
        'user_id',
        'audio',
        'video',
        'sede_id',
        'latitud',
        'longitud',
    ];

    public function usuario(){
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function asunto(){
        return $this->belongsTo('App\Models\Subject', 'subject_id');
    }

    public function ubicacion(){
        return $this->belongsTo('App\Models\Ubicacion', 'ubicacion_id');
    }

    public function sede(){
        return $this->belongsTo('App\Models\Sede', 'sede_id');
    }

}
