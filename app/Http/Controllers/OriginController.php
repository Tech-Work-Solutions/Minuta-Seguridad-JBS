<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Origin;

class OriginController extends Controller
{
    public function registerProcedencia(Request $request){
        $request->validate(['nombre' => ['required', 'unique:origins']]);
        $origin = Origin::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $origin]); 
    }

    public function getProcedencias(Request $request){
        return Origin::orderBy('nombre')->get();
    }
}
