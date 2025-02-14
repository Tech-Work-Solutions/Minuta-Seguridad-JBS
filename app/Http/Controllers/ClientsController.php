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
                'permisos_menu'    => json_encode($request->permisos_menu),
                'permisos_formulario'    => json_encode($request->permisos_formulario),
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

    public function deleteClient(Request $request) {
        try {
            $request->validate([
                'id' => ['required', 'exists:clientes,id'],
            ]);
    
            $client = Cliente::findOrFail($request->id);
            $client->delete();
    
            return response()->json(["msg" => "Puesto eliminado con éxito"]);
        } catch (\Illuminate\Database\QueryException $e) {
            if ($e->errorInfo[1] == 1451) {
                return response()->json([
                    "msg" => "No se puede eliminar ya que tiene algunas dependencias."
                ], 409);
            }
    
            return response()->json(["msg" => "Error al eliminar el puesto", "error" => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(["msg" => "Error inesperado", "error" => $e->getMessage()], 500);
        }
    }    
    
}
