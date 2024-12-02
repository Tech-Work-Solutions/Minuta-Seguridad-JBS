<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;

class ClientsController extends Controller
{
    public function registerClients(Request $request){
        $request->validate([
            'nit'  => ['required', 'numeric', 'unique:clients'],
            'nombre'            => ['required']
        ]);
        $client = Client::create([
            'nit'  => $request->nit,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $client]); 
    }

    public function getClients(Request $request){
        return Client::orderBy('nombre')->get();
    }
}
