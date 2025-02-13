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
            $query->with(['sedes:id,nombre']);

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
                $query->whereHas('sedes', function ($subQuery) use ($sede_id) {
                    $subQuery->where('sede_id', $sede_id);
                });
            }
            $calendarios = $query->orderBy('user_id')
            ->get()
            ->map(function ($item) {
                $item->name = $item->user ? $item->user->name : null;
                $item->nombreSede = $item->sedes ? $item->sedes->nombre : null;
                unset($item->user);
                unset($item->sedes);
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
        $calendarios = $request->calendarios;
        $insertados = [];
        $errores = [];

        foreach ($calendarios as $index => $calendarioData) {
            try {
                $validatedData = \Validator::make($calendarioData, [
                    'user_id' => ['required', 'integer', 'exists:users,id'],
                    'sede_id' => ['required', 'integer', 'exists:sedes,id'],
                    'hora_inicio' => ['required', 'date_format:H:i'],
                    'hora_fin' => ['required', 'date_format:H:i', 'after:hora_inicio'],
                    'fecha_inicio' => ['required', 'date'],
                    'fecha_fin' => ['required', 'date', 'after_or_equal:fecha_inicio'],
                    'estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                    'tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
                    'color' => ['required', 'string'],
                    'titulo' => ['required', 'string'],
                    'descripcion' => ['nullable', 'string'],
                ])->validate();

                $insertados[] = Calendario::create($validatedData);
            } catch (\Illuminate\Validation\ValidationException $e) {
                $errores[] = [
                    'index' => $index,
                    'error' => $e->errors()
                ];
            } catch (\Exception $e) {
                return response()->json([
                    'error' => 'Ocurrió un error inesperado',
                    'details' => $e->getMessage(),
                ], 500);
            }
        }

        return response()->json([
            'msg' => 'Proceso finalizado',
            'insertados' => $insertados,
            'errores' => $errores
        ]);
    }

    public function updateCalendario(Request $request)
    {
        try {
            $calendarios = $request->calendarios;
            $actualizados = [];
            $errores = [];

            foreach ($calendarios as $index => $data) {
                try {

                    $validatedData = \Validator::make($data, [
                        'id' => ['required', 'integer', 'exists:calendarios,id'],
                        'user_id' => ['required', 'integer', 'exists:users,id'],
                        'sede_id' => ['required', 'integer', 'exists:sedes,id'],
                        'hora_inicio' => ['nullable', 'date_format:H:i'],
                        'hora_fin' => ['nullable', 'date_format:H:i', 'after:hora_inicio'],
                        'fecha_inicio' => ['nullable', 'date'],
                        'fecha_fin' => ['nullable', 'date', 'after_or_equal:fecha_inicio'],
                        'estado' => ['nullable', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
                        'tipo' => ['nullable', 'string', 'in:TURNO,PERMISO'],
                        'color' => ['nullable', 'string'],
                        'titulo' => ['required', 'string'],
                        'descripcion' => ['nullable', 'string'],
                    ])->validate();

                    $calendario = Calendario::findOrFail($validatedData['id']);
                    $calendario->fill($validatedData);
                    $calendario->save();

                    $actualizados[] = $calendario;
                } catch (\Illuminate\Validation\ValidationException $e) {

                    $errores[] = [
                        'index' => $index,
                        'error' => $e->errors()
                    ];
                } catch (\Exception $e) {
                    $errores[] = [
                        'index' => $index,
                        'error' => $e->getMessage()
                    ];
                }
            }

            return response()->json([
                'msg' => 'Proceso completado',
                'actualizados' => $actualizados,
                'errores' => $errores
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Ocurrió un error inesperado',
                'details' => $e->getMessage(),
            ], 500);
        }
    }

    public function deleteCalendario(Request $request) {
        $request->validate([
            'calendarioIds' => ['required', 'array'],
            'calendarioIds.*' => ['integer', 'exists:calendarios,id']
        ]);

        $ids = $request->calendarioIds;
        $eliminados = [];
        $noEncontrados = [];

        foreach ($ids as $id) {
            $record = Calendario::find($id);
            if ($record) {
                $record->delete();
                $eliminados[] = $id;
            } else {
                $noEncontrados[] = $id;
            }
        }

        return response()->json([
            'msg' => 'Proceso finalizado',
            'eliminados' => $eliminados,
            'no_encontrados' => $noEncontrados
        ]);
    }

}