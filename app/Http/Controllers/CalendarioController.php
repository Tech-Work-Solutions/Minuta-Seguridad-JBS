<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Calendario;

class CalendarioController extends Controller
{
    /**
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCalendarios(Request $request)
    {
        try {
            $query = Calendario::query();

            $query->with(['user:id,name']);

            $user_id = $request->query('user_id');
            $sede_id = $request->query('sede_id');
            $tipo = $request->query('tipo');
            $estado = $request->query('estado');

            if ($user_id) {
                $query->where('user_id', $user_id);
            }
            
            if ($tipo) {
                $query->where('tipo', $tipo);
            }
            
            if ($estado) {
                $query->where('estado', $estado);
            }

            if ($sede_id) {
                $query->whereHas('user_sedes', function ($subQuery) use ($sede_id) {
                    $subQuery->where('sede_id', $sede_id);
                });
            }

            $calendarios = $query->orderBy('user_id')
            ->select('id', 'user_id', 'hora_inicio', 'hora_fin', 'fecha_inicio', 'fecha_fin', 'estado', 'tipo')
            ->get()
            ->map(function ($item) {
                $item->name = $item->user ? $item->user->name : null;
                unset($item->user);
                return $item;
            });

            return $calendarios;
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Error de validación',
                'messages' => $e->errors(),
            ], 422);
    
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Ocurrió un error inesperado',
                'details' => $e->getMessage(),
            ], 500);
        }
    }

    public function registerCalendario(Request $request)
    {
        try {
            $request->validate([
                'user_id' => ['required', 'integer', 'exists:users,id'],
                'hora_inicio' => ['required', 'date_format:H:i'],
                'hora_fin' => ['required', 'date_format:H:i', 'after:hora_inicio'],
                'fecha_inicio' => ['required', 'date'],
                'fecha_fin' => ['required', 'date', 'after_or_equal:fecha_inicio'],
                'estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                'tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
            ]);
    
            $calendario = Calendario::create([
                'user_id' => $request->user_id,
                'hora_inicio' => $request->hora_inicio,
                'hora_fin' => $request->hora_fin,
                'fecha_inicio' => $request->fecha_inicio,
                'fecha_fin' => $request->fecha_fin,
                'estado' => $request->estado,
                'tipo' => $request->tipo,
            ]);
            
            return response()->json(["msg" => "Registro exitoso", "res" => $calendario]);
        }  catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Error de validación',
                'messages' => $e->errors(),
            ], 422);
    
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Ocurrió un error inesperado',
                'details' => $e->getMessage(),
            ], 500);
        }
    }

    public function updateCalendario(Request $request){
        try {
            $request->validate([
                'id' => ['required', 'integer' , 'exists:calendarios,id'],
                'hora_inicio' => ['nullable', 'date_format:H:i'],
                'hora_fin' => ['nullable', 'date_format:H:i', 'after:hora_inicio'],
                'fecha_inicio' => ['nullable', 'date'],
                'fecha_fin' => ['nullable', 'date', 'after_or_equal:fecha_inicio'],
                'estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                'tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
            ]);
    
            $calendario = Calendario::findOrFail($request->id);
            $calendario->hora_inicio  = $request->hora_inicio;
            $calendario->hora_fin     = $request->hora_fin;
            $calendario->fecha_inicio = $request->fecha_inicio;
            $calendario->fecha_fin    = $request->fecha_fin;
            $calendario->estado       = $request->estado;
            $calendario->tipo         = $request->tipo;
    
            $calendario->update();
            return response()->json(['msg' => "Registro actualizado correctamente", 'calendario_id' => $calendario->id]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Error de validación',
                'messages' => $e->errors(),
            ], 422);
    
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Ocurrió un error inesperado',
                'details' => $e->getMessage(),
            ], 500);
        }
        
    }

    public function deleteCalendario($calendario_id) {

        $record = Calendario::find($calendario_id);
        if (!$record) {
            return response()->json(['message' => 'Calendario no encontrado', 'calendario_id' => $calendario_id], 404);
        }
        $record->delete();
        return response()->json(['msg' => 'Registro eliminado']);
    }
}
