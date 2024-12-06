<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Record_minuta;
use App\Models\Record_vehicle;
use App\Models\Record_person;
use App\Models\Person;

class RecordsController extends Controller
{
    public function registerMinuta(Request $request) {
        $request->validate([
            'subject_id'   => ['required'],
            'ubicacion_id' => ['required'],
            'user_id'      => ['required'],
            'anotaciones'  => ['required'],
        ]);

        $imagen = '';
        $audio = '';
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/minutas/', $f.$nombre); 
            $imagen = '/img/minutas/'.$f.$nombre;
        }
        if($request->file('audio')){
            $file = $request->file('audio');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            // Crear un nombre único para evitar conflictos
            $f = date("dmyHis");
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/audios/minutas/', $f.$nombre); 
            $audio = '/audios/minutas/'.$f.$nombre;
        }
        Record_minuta::create([
            'anotaciones'   => $request->anotaciones,
            'foto'          => $imagen,
            'ubicacion_id'  => $request->ubicacion_id,
            'subject_id'    => $request->subject_id,
            'user_id'       => $request->user_id,
            'audio'         => $audio,
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
        ]);

        $imagen = '';
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/vehiculos/', $f.$nombre); 
            $imagen = '/img/vehiculos/'.$f.$nombre;
        }
        Record_vehicle::create([
            'observaciones'     => $request->observaciones ? $request->observaciones : '',
            'entrada_salida'    => $request->entrada_salida,
            'foto'              => $imagen,
            'vehicle_id'        => $request->vehicle_id,
            'driver_id'         => $request->driver_id,
            'origin_id'         => $request->origin_id,
            'volqueta_id'       => $request->volqueta_id,
            'user_id'           => $request->user_id,
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
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/visitantes/', $f.$nombre); 
            $imagen = '/img/visitantes/'.$f.$nombre;
        }
        Record_person::create([
            'destino'           => $request->destino ? $request->destino : '', 
            'entrada_salida'    => $request->entrada_salida, 
            'observaciones'     => $request->observaciones ? $request->observaciones : '', 
            'foto'              => $imagen, 
            'person_id'         => $id_persona, 
            'user_id'           => $request->user_id, 
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
        $record = Record_minuta::findOrFail($request->id);  
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //Eliminar la imagen 
            if($request->imagen != "" || $request->imagen != null){
                $image_path = public_path().$request->imagen;
                unlink($image_path);
            }
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/minutas/', $f.$nombre); 
            $imagen = '/img/minutas/'.$f.$nombre;
        }
        $record->anotaciones   = $request->anotaciones;
        if ($imagen !== '') {
            $record->foto      = $imagen;
        }
        $record->subject_id    = $request->subject_id;
        $record->ubicacion_id  = $request->ubicacion_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function updateRecordVehicle(Request $request) {
        $imagen = '';
        $record = Record_vehicle::findOrFail($request->id);  
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //Eliminar la imagen 
            if($request->imagen != "" || $request->imagen != null){
                $image_path = public_path().$request->imagen;
                unlink($image_path);
            }
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/vehiculos/', $f.$nombre); 
            $imagen = '/img/vehiculos/'.$f.$nombre;
        }
        $record->observaciones  = $request->observaciones;
        $record->entrada_salida = $request->entrada_salida;
        if ($imagen !== '') {
            $record->foto       = $imagen;
        }
        $record->vehicle_id     = $request->vehicle_id;
        $record->driver_id      = $request->driver_id;
        $record->origin_id      = $request->origin_id;
        $record->volqueta_id    = $request->volqueta_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function updateRecordVisitante(Request $request) {
        $imagen = '';
        $record = Record_person::findOrFail($request->id);  
        if($request->file('file')){
            $file = $request->file('file');
            //obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            //Eliminar la imagen 
            if($request->imagen != "" || $request->imagen != null){
                $image_path = public_path().$request->imagen;
                unlink($image_path);
            }
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path().'/img/visitantes/', $f.$nombre); 
            $imagen = '/img/visitantes/'.$f.$nombre;
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
            $this->updateVisitante($request, $newPerson->id, $record, $imagen);
        } else {
            $this->updateVisitante($request, $person->id, $record, $imagen);
        }
        
    }

    public function updateVisitante($request, $person_id, $record, $imagen) {
        $record->destino        = $request->destino;
        $record->entrada_salida = $request->entrada_salida;
        $record->observaciones  = $request->observaciones ? $request->observaciones : '';
        if ($imagen !== '') {
            $record->foto       = $imagen;
        }
        $record->person_id      = $person_id;
        $record->update();
        return response()->json(["msg" => "Registro exitoso"]);
    }

    public function deleteRecordMinuta(Request $request) {
        $record = Record_minuta::findOrFail($request->id);
        if($record->foto != "" || $record->foto != null){
            $image_path = public_path().$record->foto;
            unlink($image_path);
        } 
        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

    public function deleteRecordVehicle(Request $request) {
        $record = Record_vehicle::findOrFail($request->id);
        if($record->foto != "" || $record->foto != null){
            $image_path = public_path().$record->foto;
            unlink($image_path);
        } 
        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

    public function deleteRecordVisitante(Request $request) {
        $record = Record_person::findOrFail($request->id);
        if($record->foto != "" || $record->foto != null){
            $image_path = public_path().$record->foto;
            unlink($image_path);
        } 
        $record->delete(); 
        return response()->json(['msg' => 'Registro eliminado']);
    }

}
