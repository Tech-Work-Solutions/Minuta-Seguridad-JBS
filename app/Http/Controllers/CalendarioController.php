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
            $request->validate([
                'user_id' => ['nullable', 'integer', 'exists:users,id'],
                'sede_id' => ['nullable', 'integer', 'exists:sedes,id'],
                'hora_inicio' => ['nullable', 'date_format:H:i'],
                'hora_fin' => ['nullable', 'date_format:H:i', 'after:hora_inicio'],
                'fecha_inicio' => ['nullable', 'date'],
                'fecha_fin' => ['nullable', 'date', 'after_or_equal:fecha_inicio'],
                'estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                'tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
            ]);
            $query = Calendario::query();

            $query->with(['user:id,name']);

            $user_id = $request->query('user_id');
            $sede_id = $request->query('sede_id');
            $tipo = $request->query('tipo');
            $estado = $request->query('estado');

            $fecha_inicio = $request->query('fecha_inicio');
            $fecha_fin = $request->query('fecha_fin');
            
            $fechaInicioWithTime = $fecha_inicio . " 00:00:00";
            $fechaFinWithTime = $fecha_fin . " 23:59:59";

            if ($fecha_inicio && $fecha_fin) {
                $query->where('fecha_inicio', '>=', date("Y-m-d H:i:s", strtotime($fechaInicioWithTime)))
                    ->where('fecha_fin', '<=', date("Y-m-d H:i:s", strtotime($fechaFinWithTime)));
            } else {
                if ($fecha_inicio) {
                    $query->where('fecha_inicio', '>=', date("Y-m-d H:i:s", strtotime($fechaInicioWithTime)));
                }
                if ($fecha_fin) {
                    $query->where('fecha_fin', '<=', date("Y-m-d H:i:s", strtotime($fechaFinWithTime)));
                }
            }

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
            // agregar el nombre de la sede. 
            $calendarios = $query->orderBy('user_id')
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
                'calendarios' => ['required', 'array', 'min:1'],
                'calendarios.*.user_id' => ['required', 'integer', 'exists:users,id'],
                'calendarios.*.sede_id' => ['required', 'integer', 'exists:sedes,id'],
                'calendarios.*.hora_inicio' => ['required', 'date_format:H:i'],
                'calendarios.*.hora_fin' => ['required', 'date_format:H:i', 'after:calendarios.*.hora_inicio'],
                'calendarios.*.fecha_inicio' => ['required', 'date'],
                'calendarios.*.fecha_fin' => ['required', 'date', 'after_or_equal:calendarios.*.fecha_inicio'],
                'calendarios.*.estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                'calendarios.*.tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
                'calendarios.*.color' => ['nullable', 'string'],
            ]);
    
            $calendariosData = [];
            foreach ($request->calendarios as $calendario) {
                $calendariosData[] = [
                    'user_id' => $calendario['user_id'],
                    'sede_id' => $calendario['sede_id'],
                    'hora_inicio' => $calendario['hora_inicio'],
                    'hora_fin' => $calendario['hora_fin'],
                    'fecha_inicio' => $calendario['fecha_inicio'],
                    'fecha_fin' => $calendario['fecha_fin'],
                    'estado' => $calendario['estado'] ?? 'PENDIENTE',
                    'tipo' => $calendario['tipo'] ?? 'PERMISO',
                    'color' => $calendario['color'],
                ];
            }

            $res = Calendario::insert($calendariosData);
            
            return response()->json(["msg" => "Registro exitoso", "res" => $res]);
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
