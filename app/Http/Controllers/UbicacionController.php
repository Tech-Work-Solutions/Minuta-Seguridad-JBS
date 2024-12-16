<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ubicacion;

class UbicacionController extends Controller
{
    public function registerUbicacion(Request $request){
        $request->validate([
            'nombre'    => ['required', 'unique:ubicacions'],
            'sede_id'   => ['required', 'numeric'],
        ]);
        $ubicacion = Ubicacion::create([
            'nombre'    => $request->nombre,
            'sede_id'   => $request->sede_id
        ]);
        return response()->json(["msg" => "Registro exitoso", "res" => $ubicacion]); 
    }

    public function getUbicaciones(Request $request) {
        if ($request->sede_id) {
            return Ubicacion::where('sede_id', $request->sede_id)->orderBy('nombre')->get();
        }
        return Ubicacion::orderBy('nombre')->get();
    }
}
