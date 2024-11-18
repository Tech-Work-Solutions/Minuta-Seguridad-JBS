<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Volqueta;

class VolquetaController extends Controller
{
    public function registerVolqueta(Request $request){
        $request->validate(['nombre' => ['required', 'unique:volquetas']]);
        $volqueta = Volqueta::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $volqueta]); 
    }

    public function getVolquetas(Request $request){
        return Volqueta::orderBy('nombre')->get();
    }
}
