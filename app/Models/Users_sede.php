<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Users_sede extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id',        
        'sede_id'
    ];

    public function usuario(){
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function sede(){
        return $this->belongsTo('App\Models\Sede', 'sede_id');
    }
}