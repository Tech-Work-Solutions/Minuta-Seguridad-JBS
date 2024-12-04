<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;

class ClientsController extends Controller
{
    public function registerClients(Request $request){
        $request->validate([
            'nit'  => ['required', 'numeric', 'unique:clientes'],
            'nombre'            => ['required']
        ]);
        $client = Cliente::create([
            'nit'  => $request->nit,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $client]); 
    }

    public function getClients(Request $request){
        return Cliente::orderBy('nombre')->get();
    }
}
