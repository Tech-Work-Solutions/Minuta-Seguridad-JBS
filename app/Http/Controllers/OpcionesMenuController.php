<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OpcionMenu;

class ClientsController extends Controller
{
    public function registerOpcion(Request $request){
        $request->validate([
            'estado' => ['required', 'in:ACTIVO,ACTIVO,ELIMINADO'],
            'nombre'            => ['required']
        ]);
        $client = OpcionMenu::create([
            'nit'  => $request->nit,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $client]); 
    }

    public function getClients(Request $request){
        return OpcionMenu::orderBy('nombre')->get();
    }
}