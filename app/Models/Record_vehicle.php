<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Record_vehicle extends Model
{
    use HasFactory;

    protected $fillable = [
        'observaciones',
        'entrada_salida',
        'foto',
        'vehicle_id',
        'driver_id',
        'volqueta_id',
        'origin_id',
        'user_id',
        'audio',
    ];

    public function driver(){
        return $this->belongsTo('App\Models\Driver');
    }

    public function vehicle(){
        return $this->belongsTo('App\Models\Vehicle');
    }

    public function origin(){
        return $this->belongsTo('App\Models\Origin');
    }

    public function volqueta(){
        return $this->belongsTo('App\Models\Volqueta');
    }

    public function user(){
        return $this->belongsTo('App\Models\User');
    }
}
