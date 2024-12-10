<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OpcionFormulario;

class OpcionesFormularioController extends Controller
{
    public function registerOpcionesFormulario(Request $request){
        $request->validate([
            'estado' => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
            'nombre'            => ['required']
        ]);
        $opcionFormulario = OpcionFormulario::create([
            'estado'  => $request->estado,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $opcionFormulario]); 
    }

    public function getOpcionesFormulario(Request $request){
        return OpcionFormulario::orderBy('nombre')->get();
    }
}