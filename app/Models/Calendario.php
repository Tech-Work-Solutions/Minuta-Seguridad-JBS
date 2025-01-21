<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calendario extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',        
        'hora_inicio',
        'hora_fin',
        'fecha_inicio',
        'fecha_fin',
        'estado',
        'tipo'
    ];

    public function user(){
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function user_sedes()
    {
        return $this->hasMany('App\Models\Users_sede', 'user_id', 'user_id');
    }

}