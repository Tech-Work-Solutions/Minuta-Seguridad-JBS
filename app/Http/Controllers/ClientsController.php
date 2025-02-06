<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;

class ClientsController extends Controller
{
    public function registerClients(Request $request){
        $request->validate([
            'nit'  => ['required', 'numeric', 'unique:clientes'],
            'nombre'            => ['required'],
            'estado' => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
            'img_header' => ['nullable', 'file', 'mimes:jpg,png'], 
            'img_footer' => ['nullable', 'file', 'mimes:jpg,png'],
        ]);
        $img_header = null;
        $img_footer = null;

        if ($request->file('img_header')) {
            $fileHeader = $request->file('img_header');
            $nombreHeader = $fileHeader->getClientOriginalName();
            $uniqueHeader = date("dmyHis") . '_header'; // Identificador único
            $fileHeader->move(public_path() . '/img/clientes/', $uniqueHeader . $nombreHeader);
            $img_header = '/img/clientes/' . $uniqueHeader . $nombreHeader;
        } 

        if ($request->file('img_footer')) {
            $fileFooter = $request->file('img_footer');
            $nombreFooter = $fileFooter->getClientOriginalName();
            $uniqueFooter = date("dmyHis") . '_footer'; // Identificador único
            $fileFooter->move(public_path() . '/img/clientes/', $uniqueFooter . $nombreFooter);
            $img_footer = '/img/clientes/' . $uniqueFooter . $nombreFooter;
        } 
        $client = Cliente::create([
            'nit'  => $request->nit,
            'nombre'    => $request->nombre,
            'email'    => $request->email,
            'permisos_menu'    => $request->permisos_menu,
            'permisos_formulario'    => $request->permisos_formulario,
            'img_header'    => $img_header,
            'img_footer'    => $img_footer,
            'estado'    => $request->estado
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $client]); 
    }

    public function getClients(Request $request)
    {
        $query = Cliente::orderBy('nombre');

        if ($request->has('id')) {
            $query->where('id', $request->id);
        }

        return $query->get();
    }
}
