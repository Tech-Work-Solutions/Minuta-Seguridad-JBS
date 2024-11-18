<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ubicacion;

class UbicacionController extends Controller
{
    public function registerUbicacion(Request $request){
        $request->validate(['nombre' => ['required', 'unique:ubicacions']]);
        $ubicacion = Ubicacion::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $ubicacion]); 
    }

    public function getUbicaciones(Request $request){
        return Ubicacion::orderBy('nombre')->get();
    }
}
