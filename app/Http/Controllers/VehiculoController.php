<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vehicle;

class VehiculoController extends Controller
{
    public function registerVehiculo(Request $request){
        $request->validate(['placa' => ['required', 'unique:vehicles']]);
        $vehiculo = Vehicle::create(['placa' => $request->placa]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $vehiculo]); 
    }

    public function getVehiculos(Request $request){
        return Vehicle::orderBy('placa')->get();
    }
}
