<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;

class ClientsController extends Controller
{
    public function registerClients(Request $request) {
        try {
            $request->validate([
                'nit'               => ['required', 'numeric', 'unique:clientes'],
                'nombre'            => ['required', 'string'],
                'estado'            => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
                'permisos_formulario' => ['required', 'array'],
                'permisos_menu'     => ['required', 'array'],
                'email'             => ['nullable', 'email'],
            ]);
            $client = Cliente::create([
                'nit'       => $request->nit,
                'nombre'    => $request->nombre,
                'email'     => $request->email,
                'permisos_menu'    => $request->permisos_menu,
                'permisos_formulario'    => $request->permisos_formulario,
                'estado'    => $request->estado
            ]); 
            return response()->json(["msg" => "Registro exitoso", "res" => $client]); 
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Error de validación',
                'messages' => $e->errors(),
            ], 422);

        } catch (\Exception $e) {
            return response()->json(["msg" => "Error en el registro", "error" => $e->getMessage()], 500);
        }
    }

    public function getClients(Request $request)
    {
        $query = Cliente::orderBy('nombre');

        if ($request->has('id')) {
            $query->where('id', $request->id);
        }

        return $query->get();
    }

    public function updateClient(Request $request, $id) {
        try {
            $request->validate([
                'nit'               => ['required', 'numeric', 'unique:clientes,nit,' . $id],
                'nombre'            => ['required', 'string'],
                'estado'            => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
                'permisos_formulario' => ['required', 'array'],
                'permisos_menu'     => ['required', 'array'],
                'email'             => ['nullable', 'email'],
            ]);

            $client = Cliente::findOrFail($id);

            $client->update([
                'nit'       => $request->nit,
                'nombre'    => $request->nombre,
                'email'     => $request->email,
                'permisos_menu'    => $request->permisos_menu,
                'permisos_formulario'    => $request->permisos_formulario,
                'estado'    => $request->estado
            ]);

            return response()->json(["msg" => "Cliente actualizado con éxito", "res" => $client]);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Error de validación',
                'messages' => $e->errors(),
            ], 422);

        } catch (\Exception $e) {
            return response()->json(["msg" => "Error al actualizar", "error" => $e->getMessage()], 500);
        }
    }
}
