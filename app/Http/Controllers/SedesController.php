<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sede;

class SedesController extends Controller
{
    public function registerSede(Request $request){
        $request->validate([
            'nombre'            => ['required'],
            'cliente_id'            => ['required'],
            'estado' => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
        ]);

        
        $sede = Sede::create([
            'nombre'  => $request->nombre,
            'direccion'            => $request->direccion,
            'cliente_id'  => $request->cliente_id,
            'telefono'  => $request->telefono,
            'estado'  => $request->estado,
            
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $sede]); 
    }

    public function getSedes(Request $request){
        return Sede::orderBy('nombre')->get();
    }
}