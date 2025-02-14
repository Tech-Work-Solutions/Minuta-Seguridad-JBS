<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sede;

class SedesController extends Controller
{
    public function registerSede(Request $request){
        $request->validate([
            'nombre'            => ['required'],
            'cliente_id'            => ['required'],
            'estado' => ['required', 'in:ACTIVO,INACTIVO,ELIMINADO'],
        ]);

        
        $sede = Sede::create([
            'nombre'  => $request->nombre,
            'direccion'            => $request->direccion,
            'cliente_id'  => $request->cliente_id,
            'telefono'  => $request->telefono,
            'estado'  => $request->estado,
            
        ]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $sede]); 
    }

    public function getSedes(Request $request)
    {
        $query = Sede::orderBy('nombre');

        if ($request->has('id')) {
            $query->where('id', $request->id);
        }

        $sedes = $query->get();

        return response()->json(['sedes' => $sedes]);
    }

    public function getSedesByClient(Request $request){
        $request->validate([
            'client_id' => 'required|integer|exists:clientes,id',
        ]);
    
        $sedes = Sede::where('cliente_id', $request->client_id)
                    ->orderBy('nombre')
                    ->get();
    
        return response()->json(['sedes' => $sedes]);
    }

    public function deleteSede(Request $request)
    {
        $request->validate([
            'id' => 'required|integer|exists:sedes,id',
        ]);
        $sede = Sede::findOrFail($request->id);

        if (!$sede) {
            return response()->json(['error' => 'Sede no encontrada'], 404);
        }

        $sede->delete();
        return response()->json(['msg' => 'Sede eliminada correctamente']);
    }

    public function updateSede(Request $request, $id)
    {
        $request->validate([
            'nombre'     => ['required'],            
            'cliente_id' => ['required'],
            'estado'     => ['required','in:ACTIVO,INACTIVO,ELIMINADO'],
        ]);
        $sede = Sede::find($id);
        if (!$sede) {
            return response()->json(['error' => 'Sede no encontrada'], 404);
        }
        $sede->update([            
            'nombre'    => $request->nombre,
            'direccion'     => $request->direccion,
            'telefono'    => $request->telefono,
            'cliente_id'    => $request->cliente_id,
            'estado'    => $request->estado
        ]);

        return response()->json(['msg' => 'Sede actualizada correctamente', 'sede' => $sede]);
    }
}
