<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Record_minuta;
use App\Models\Record_vehicle;
use App\Models\Record_person;
use App\Models\Person;
use App\Services\FileService;

class RecordsController extends Controller
{
    public function registerMinuta(Request $request) {
        $request->validate([
            'subject_id'   => ['required'],
            'ubicacion_id' => ['required'],
            'user_id'      => ['required'],
            'anotaciones'  => ['required'],
            'sede_id'      => ['required'],
        ]);

        $imagen = '';
        $audio = '';
        $video = '';
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/minutas/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/minutas/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/minutas/');

        Record_minuta::create([
            'anotaciones'   => $request->anotaciones,
            'foto'          => $imagen,
            'ubicacion_id'  => $request->ubicacion_id,
            'subject_id'    => $request->subject_id,
            'user_id'       => $request->user_id,
            'audio'         => $audio,
            'video'         => $video,
            'sede_id'       => $request->sede_id,
        ]);
        return response()->json(["msg" => "Registro exitoso"]); 
    }

    public function recordVehicle(Request $request) {
        $request->validate([
            'vehicle_id'        => ['required'],
            'user_id'           => ['required'],
            'origin_id'         => ['required'],
            'driver_id'         => ['required'],
            'volqueta_id'       => ['required'],
            'entrada_salida'    => ['required'],
            'sede_id'           => ['required'],
        ]);

        $imagen = '';
        $audio = '';
        $video = '';
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/vehiculos/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/vehiculos/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/vehiculos/');

        Record_vehicle::create([
            'observaciones'     => $request->observaciones ? $request->observaciones : '',
            'entrada_salida'    => $request->entrada_salida,
            'foto'              => $imagen,
            'vehicle_id'        => $request->vehicle_id,
            'driver_id'         => $request->driver_id,
            'origin_id'         => $request->origin_id,
            'volqueta_id'       => $request->volqueta_id,
            'user_id'           => $request->user_id,
            'audio'             => $audio,
            'video'             => $video,
            'sede_id'           => $request->sede_id,
        ]);
        return response()->json(["msg" => "Registro exitoso"]); 
    }

    public function recordVisitante(Request $request) {
        $request->validate([
            'numero_documento'  => ['required', 'numeric'],
            'tipo_documento_id' => ['required'],
            'tipo'              => ['required'],
            'nombres'           => ['required'],
            'apellidos'         => ['required'],
            'eps_id'            => ['required'],
            'arl_id'            => ['required'],
            'user_id'           => ['required'],
            'entrada_salida'    => ['required'],
        ]);

        $person = Person::where('numero_documento', $request->numero_documento)->first();
        if(!$person) {
            $newPerson = Person::create([
                'nombres'           => $request->nombres,
                'apellidos'         => $request->apellidos,
                'numero_documento'  => $request->numero_documento,
                'tipo'              => $request->tipo,
                'tipo_documento_id' => $request->tipo_documento_id,
                'eps_id'            => $request->eps_id,
                'arl_id'            => $request->arl_id,
            ]);
            $this->registrarVisitante($request, $newPerson->id);
        } else {
            $this->registrarVisitante($request, $person->id);
        }
    }

    public function registrarVisitante($request, $id_persona) {
        $imagen = '';
        $audio = '';
        $video = '';
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/visitantes/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/visitantes/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/visitantes/');

        Record_person::create([
            'destino'           => $request->destino ? $request->destino : '', 
            'entrada_salida'    => $request->entrada_salida, 
            'observaciones'     => $request->observaciones ? $request->observaciones : '', 
            'foto'              => $imagen, 
            'person_id'         => $id_persona, 
            'user_id'           => $request->user_id,
            'audio'             => $audio,
            'video'             => $video,
        ]);
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function getPerson(Request $request) {
        return Person::where('numero_documento', $request->numero_documento)->first();
    }

    public function getRecordsMinutaByUser(Request $request) {
        $fechaActual = date('Y-m-d');
        $records = Record_minuta::where('created_at', '>=', $fechaActual.' 00:00:00')
                                ->where('created_at', '<=', $fechaActual.' 23:59:59')
                                ->where('user_id', $request->user_id)
                                ->orderBy('id', 'DESC')
                                ->get(); 
        foreach($records as $record){
            $record->usuario->name;
            $record->asunto->nombre;
            $record->ubicacion;
        }
        return $records;
    }

    public function getRecordsVehiculosByUser(Request $request) {
        $fechaActual = date('Y-m-d');
        $records = Record_vehicle::where('created_at', '>=', $fechaActual.' 00:00:00')
                                    ->where('created_at', '<=', $fechaActual.' 23:59:59')
                                    ->where('user_id', $request->user_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();
        foreach($records  as $record){
            $record->driver->nombre;
            $record->vehicle->placa;
            $record->origin->nombre;
            $record->volqueta->nombre;
            $record->user->name;
        }
        return $records;
    }

    public function getRecordsVisitantesByUser(Request $request) {
        $fechaActual = date('Y-m-d');
        $records = Record_person::where('created_at', '>=', $fechaActual.' 00:00:00')
                                    ->where('created_at', '<=', $fechaActual.' 23:59:59')
                                    ->where('user_id', $request->user_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();  
        foreach($records as $record){
            $record->person;
            $record->user;
            $record->person->arl;
            $record->person->eps;
            $record->person->tipo_documento;
        }
        return $records;
    }


    public function getRecordMinuta($id){
        return Record_minuta::findOrFail($id);
    }

    public function getRecordVehicle($id){
        $record = Record_vehicle::findOrFail($id);
        $record->driver;
        return $record;
    }

    public function getRecordVisitante($id){
        $record = Record_person::findOrFail($id);
        $record->person;
        $record->user;
        return $record;
    }

    public function updateRecordMinuta(Request $request) {
        $imagen = '';
        $audio = '';
        $video = '';
        $record = Record_minuta::findOrFail($request->id);
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/minutas/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/minutas/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/minutas/');

        if ($request->file('file')) {
            $fileService->eliminarArchivo($request->imagen);
        }
    
        if ($request->file('audio')) {
            $fileService->eliminarArchivo($request->audioOrigin);
        }
        
        if ($request->file('video')) {
            $fileService->eliminarArchivo($request->videoOrigin);
        }

        $record->anotaciones   = $request->anotaciones;
        if ($imagen !== '') {
            $record->foto      = $imagen;
        }
        
        if ($audio !== '') {
            $record->audio      = $audio;
        }
        
        if ($video !== '') {
            $record->video      = $video;
        }
        $record->subject_id    = $request->subject_id;
        $record->ubicacion_id  = $request->ubicacion_id;
        $record->sede_id       = $request->sede_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function updateRecordVehicle(Request $request) {
        $imagen = '';
        $audio = '';
        $video = '';
        $record = Record_vehicle::findOrFail($request->id);  
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/vehiculos/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/vehiculos/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/vehiculos/');

        if ($request->file('file')) {
            $fileService->eliminarArchivo($request->imagen);
        }
    
        if ($request->file('audio')) {
            $fileService->eliminarArchivo($request->audioOrigin);
        }

        if ($request->file('video')) {
            $fileService->eliminarArchivo($request->videoOrigin);
        }

        $record->observaciones  = $request->observaciones;
        $record->entrada_salida = $request->entrada_salida;
        if ($imagen !== '') {
            $record->foto       = $imagen;
        }

        if ($audio !== '') {
            $record->audio      = $audio;
        }

        if ($video !== '') {
            $record->video      = $video;
        }
        $record->vehicle_id     = $request->vehicle_id;
        $record->driver_id      = $request->driver_id;
        $record->origin_id      = $request->origin_id;
        $record->volqueta_id    = $request->volqueta_id;
        $record->sede_id        = $request->sede_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function updateRecordVisitante(Request $request) {
        $imagen = '';
        $audio = '';
        $video = '';
        $record = Record_person::findOrFail($request->id);  
        $fileService = new FileService();
        $imagen = $fileService->guardarArchivo($request->file('file'), '/img/visitantes/');
        $audio = $fileService->guardarArchivo($request->file('audio'), '/audios/visitantes/');
        $video = $fileService->guardarArchivo($request->file('video'), '/videos/visitantes/');

        if ($request->file('file')) {
            $fileService->eliminarArchivo($request->imagen);
        }
    
        if ($request->file('audio')) {
            $fileService->eliminarArchivo($request->audioOrigin);
        }

        if ($request->file('video')) {
            $fileService->eliminarArchivo($request->videoOrigin);
        }

        $person = Person::where('numero_documento', $request->numero_documento)->first();
        if(!$person) {
            $newPerson = Person::create([
                'nombres'           => $request->nombres,
                'apellidos'         => $request->apellidos,
                'numero_documento'  => $request->numero_documento,
                'tipo'              => $request->tipo,
                'tipo_documento_id' => $request->tipo_documento_id,
                'eps_id'            => $request->eps_id,
                'arl_id'            => $request->arl_id,
            ]);
            $this->updateVisitante($request, $newPerson->id, $record, $imagen, $audio, $video);
        } else {
            $this->updateVisitante($request, $person->id, $record, $imagen, $audio, $video);
        }
        
    }

    public function updateVisitante($request, $person_id, $record, $imagen, $audio, $video) {
        $record->destino        = $request->destino;
        $record->entrada_salida = $request->entrada_salida;
        $record->observaciones  = $request->observaciones ? $request->observaciones : '';

        if ($imagen !== '') {
            $record->foto       = $imagen;
        }

        if ($audio !== '') {
            $record->audio      = $audio;
        }

        if ($video !== '') {
            $record->video      = $video;
        }

        $record->person_id      = $person_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function deleteRecordMinuta(Request $request) {
        $record = Record_minuta::findOrFail($request->id);
        $fileService = new FileService();

        if ($record->foto) {
            $fileService->eliminarArchivo($record->foto);
        }
    
        if ($record->audio) {
            $fileService->eliminarArchivo($record->audio);
        }
        
        if ($record->video) {
            $fileService->eliminarArchivo($record->video);
        }

        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

    public function deleteRecordVehicle(Request $request) {
        $record = Record_vehicle::findOrFail($request->id);
        $fileService = new FileService();

        if ($record->foto) {
            $fileService->eliminarArchivo($record->foto);
        }
    
        if ($record->audio) {
            $fileService->eliminarArchivo($record->audio);
        }

        if ($record->video) {
            $fileService->eliminarArchivo($record->video);
        }

        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

    public function deleteRecordVisitante(Request $request) {
        $record = Record_person::findOrFail($request->id);
        $fileService = new FileService();

        if ($record->foto) {
            $fileService->eliminarArchivo($record->foto);
        }
    
        if ($record->audio) {
            $fileService->eliminarArchivo($record->audio);
        }

        if ($record->video) {
            $fileService->eliminarArchivo($record->video);
        }

        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

}
