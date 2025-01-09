<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hoja_de_vida;
use App\Services\FileService;

class HojaVidaController extends Controller
{
    public function registerHv(Request $request){
        $request->validate([
            'user_id' => ['required', 'unique:hojas_de_vida'],
            'informacion_general' => ['nullable'],
            'informacion_personal' => ['nullable'],
            'informacion_familiar' => ['nullable'],
            'educacion_aptitudes' => ['nullable'],
            'trayectoria_empresas' => ['nullable'],
            'experiencia_laboral' => ['nullable'],
            'referencias_personales' => ['nullable'],
            'administracion_proceso_seleccion' => ['nullable'],
            'soportes' => ['nullable'],
            'foto' => ['nullable'],
            'firma' => ['nullable'],
        ]);

        $soportes = '';
        $foto = '';
        $firma = '';
        $user_id = $request->user_id;
        $fileService = new FileService();
        $soportes = $fileService->guardarArchivo($request->file('soportes'), '/hvs/soportes/', $user_id);
        $foto = $fileService->guardarArchivo($request->file('foto'), '/hvs/fotos/', $user_id);
        $firma = $fileService->guardarArchivo($request->file('firma'), '/hvs/firmas/', $user_id);

        $hojaDeVida = Hoja_de_vida::create([
            'user_id' => $request->user_id,
            'informacion_general' => $request->informacion_general,
            'informacion_personal' => $request->informacion_personal,
            'informacion_familiar' => $request->informacion_familiar,
            'educacion_aptitudes' => $request->educacion_aptitudes,
            'trayectoria_empresas' => $request->trayectoria_empresas,
            'experiencia_laboral' => $request->experiencia_laboral,
            'referencias_personales' => $request->referencias_personales,
            'administracion_proceso_seleccion' => $request->administracion_proceso_seleccion,
            'foto' => $foto,
            'firma' => $firma,
            'soportes' => $soportes,
        
        ]);
        return response()->json(["msg" => "Registro exitoso", "res" => $hojaDeVida]); 
    }

    public function getHv(Request $request) {
        $query = Hoja_de_vida::query();
        $user_id = $request->query('user_id');

        if ($user_id) {
            $query->where('user_id', $user_id);
        }
        return $query->orderBy('user_id')->get();
    }

    public function deleteHv($user_id){

        $record = Hoja_de_vida::where('user_id', $user_id)->first();
        if (!$record) {
            return response()->json(['message' => 'Hoja de vida no encontrada', 'user_id' => $user_id], 404);
        }
        $fileService = new FileService();
        if ($record->foto) {
            $fileService->eliminarArchivo($record->foto);
        }
    
        if ($record->soportes) {
            $fileService->eliminarArchivo($record->soportes);
        }

        if ($record->firma) {
            $fileService->eliminarArchivo($record->firma);
        }
        $record->delete();
        return response()->json(['msg' => 'Registro eliminado']);
    }

    public function updateHv(Request $request){
        $request->validate([
            'user_id' => ['required', 'unique:hojas_de_vida'],
            'informacion_general' => ['nullable'],
            'informacion_personal' => ['nullable'],
            'informacion_familiar' => ['nullable'],
            'educacion_aptitudes' => ['nullable'],
            'trayectoria_empresas' => ['nullable'],
            'experiencia_laboral' => ['nullable'],
            'referencias_personales' => ['nullable'],
            'administracion_proceso_seleccion' => ['nullable'],
            'soportes' => ['nullable'],
        ]
    );
        $user = User::where('user_id', $request->user_id);
        $user->update();
        return response()->json(['msg' => "Registro actualizado correctamente", 'user_id' => $user->id]);
    }
}
