<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Arl;

class ArlController extends Controller
{
    public function registerArl(Request $request){
        $request->validate(['nombre' => ['required', 'unique:arls']]);
        $arl = Arl::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $arl]); 
    }

    public function getArls(Request $request){
        return Arl::orderBy('nombre')->get();
    }
}
