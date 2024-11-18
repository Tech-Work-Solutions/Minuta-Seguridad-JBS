<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tipo_documento;

class TipoDocumentoController extends Controller
{
    public function registerDocumento(Request $request){
        $request->validate(['documento' => ['required', 'unique:tipo_documentos']]);
        $doc = Tipo_documento::create(['documento' => $request->documento]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $doc]); 
    }

    public function getDocumentos(Request $request){
        return Tipo_documento::orderBy('documento')->get();
    }
}
