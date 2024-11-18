<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Eps;

class EpsController extends Controller
{
    public function registerEps(Request $request){
        $request->validate(['nombre' => ['required', 'unique:eps']]);
        $eps = Eps::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $eps]); 
    }

    public function getEps(Request $request){
        return Eps::orderBy('nombre')->get();
    }
}
