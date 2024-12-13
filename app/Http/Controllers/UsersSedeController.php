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
}
