<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sede;

class SedesController extends Controller
{
    public function registerSede(Request $request){
        $request->validate([
            'nombre'            => ['required'],
            'ubicacion'            => ['required']
        ]);
        $sede = Sede::create([
            'nombre'  => $request->nombre,
            'ubicacion'            => $request->ubicacion,
            'client_id'  => $request->client_id,
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $sede]); 
    }

    public function getSedes(Request $request){
        return Sede::orderBy('nombre')->get();
    }
}
