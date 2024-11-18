<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Driver;

class DriverController extends Controller
{
    public function registerConductor(Request $request){
        $request->validate([
            'numero_documento'  => ['required', 'numeric', 'unique:drivers'],
            'nombre'            => ['required']
        ]);
        $driver = Driver::create([
            'numero_documento'  => $request->numero_documento,
            'nombre'            => $request->nombre
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $driver]); 
    }

    public function getConductores(Request $request){
        return Driver::orderBy('nombre')->get();
    }
}
