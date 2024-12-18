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
        $query = Ubicacion::query();
        $sede_id = $request->query('sede_id');
        if ($sede_id) {
            $query->where('sede_id', $sede_id);
        }
        return $query->orderBy('nombre')->get();
    }
}
