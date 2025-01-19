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
        $query = Calendario::query();
        $user_id = $request->query('user_id');

        if ($user_id) {
            $query->where('user_id', $user_id);
        }
        return $query->orderBy('user_id')->select('id', 'user_id', 'hora_inicio', 'hora_fin', 'fecha_inicio', 'fecha_fin', 'estado', 'tipo')->get();
    }

    public function registerCalendario(Request $request)
    {

        $request->validate([
            'user_id' => ['required', 'integer', 'exists:users,id'],
            'hora_inicio' => ['required', 'date_format:H:i'],
            'hora_fin' => ['required', 'date_format:H:i', 'after:hora_inicio'],
            'fecha_inicio' => ['required', 'date'],
            'fecha_fin' => ['required', 'date', 'after_or_equal:fecha_inicio'],
            'estado' => ['required', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
            'tipo' => ['required', 'string', 'in:TURNO,PERMISO'],
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
    }

    public function updateCalendario(Request $request){
        $request->validate([
            'id' => ['required', 'integer' , 'exists:calendarios,id'],
            'hora_inicio' => ['required', 'date_format:H:i'],
            'hora_fin' => ['required', 'date_format:H:i', 'after:hora_inicio'],
            'fecha_inicio' => ['required', 'date'],
            'fecha_fin' => ['required', 'date', 'after_or_equal:fecha_inicio'],
            'estado' => ['required', 'string', 'in:APROBADO,PENDIENTE,RECHAZADO'],
            'tipo' => ['required', 'string', 'in:TURNO,PERMISO'],
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
