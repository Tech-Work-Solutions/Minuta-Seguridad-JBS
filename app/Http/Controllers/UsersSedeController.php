<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users_sede;

class UsersSedeController extends Controller
{
    /**
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getSedesAndClientesByUser(Request $request)
    {
        $request->validate([
            'user_id' => ['required', 'integer', 'exists:users,id'],
        ]);

        $users_sedes = Users_sede::with(['sede.cliente'])
            ->where('user_id', $request->user_id)
            ->get();

        $sedes = $users_sedes->map(function ($user_sede) {
            return [
                'sede_id' => $user_sede->sede->id,
                'sede_nombre' => $user_sede->sede->nombre,
                'cliente' => $user_sede->sede->cliente,
            ];
        });

        return response()->json([
            'msg' => 'Sedes y clientes obtenidos exitosamente',
            'sedes' => $sedes,
        ]);
    }

    public function registerUserSede(Request $request)
    {
        $request->validate([
            'user_id' => ['required', 'integer', 'exists:users,id'],
            'sedes'   => ['required', 'array'],
            'sedes.*' => ['integer', 'exists:sedes,id'],
        ]);
    
        // Recorrer el array de sedes y registrar cada relación
        foreach ($request->sedes as $sede_id) {
            Users_sede::create([
                'user_id' => $request->user_id,
                'sede_id' => $sede_id,
            ]);
        }
    
        return response()->json(['msg' => 'Relaciones usuario-sedes registradas con éxito']);
    }

    public function updateUserSedes(Request $request)
    {
        $request->validate([
            'user_id' => ['required', 'integer', 'exists:users,id'],
            'sedes'   => ['required', 'array'],
            'sedes.*' => ['integer', 'exists:sedes,id'],
        ]);

        $userId = $request->user_id;
        $newSedes = $request->sedes;

        // Obtener las sedes actuales
        $currentSedes = Users_sede::where('user_id', $userId)
            ->pluck('sede_id')
            ->toArray();

        // identificar las sedes que se deben agregar
        $sedesToAdd = array_diff($newSedes, $currentSedes);

        // identificar las sedes que se deben eliminar
        $sedesToRemove = array_diff($currentSedes, $newSedes);

        foreach ($sedesToAdd as $sedeId) {
            Users_sede::create([
                'user_id' => $userId,
                'sede_id' => $sedeId,
            ]);
        }

        // Eliminar las sedes que ya no están asociadas
        if (!empty($sedesToRemove)) {
            Users_sede::where('user_id', $userId)
                ->whereIn('sede_id', $sedesToRemove)
                ->delete();
        }

        return response()->json([
            'msg' => 'Usuario-sedes actualizadas con éxito']);
    }

    public function deleteAllUserSedes(Request $request)
    {
        $request->validate([
            'id' => ['required', 'integer', 'exists:users,id'],
        ]);

        Users_sede::where('user_id', $request->id)->delete();
        return response()->json([
            'msg' => 'Registros eliminadas con éxito'
        ]);
    }
}
