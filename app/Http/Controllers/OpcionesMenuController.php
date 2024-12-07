<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OpcionMenu;

class OpcionesMenuController extends Controller
{
    public function registerOpcionMenu(Request $request){
        $request->validate([
            'estado' => ['required', 'in:ACTIVO,ACTIVO,ELIMINADO'],
            'nombre'            => ['required']
        ]);
        $opcionMenu = OpcionMenu::create([
            'estado'  => $request->estado,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $opcionMenu]); 
    }

    public function getOpcionesMenu(Request $request){
        $opcionesMenu = OpcionMenu::orderBy('nombre')->get();
        return $opcionesMenu;
    }
}