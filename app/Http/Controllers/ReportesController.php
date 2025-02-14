<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Http\Request;
use App\Models\Record_minuta;
use App\Models\Record_person;
use App\Models\Record_vehicle;
use App\Models\User;
use App\Services\FileService;
use App\Models\Hoja_de_vida;

class ReportesController extends Controller
{
    //
    public function getReporteMinuta(Request $request) {
        $fecha_inicial = $request->fecha_inicial." 00:00:00";
        $fecha_final = $request->fecha_final." 23:59:59";
        $sede_id = $request->sede_id;
        $records = [];
        
        $query = Record_minuta::query();

        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
            ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if ($request->user_id !== "TODOS") {
            $query->where('user_id', $request->user_id);
        }

        if ($sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();

        foreach ($records as $record) {
            $record->usuario->name;
            $record->asunto->nombre;
            $record->ubicacion;
        }
        return $records;
    }

    public function getReporteVehiculos(Request $request) {
        $fecha_inicial = $request->fecha_inicial.' 00:00:00';
        $fecha_final = $request->fecha_final.' 23:59:59';
        $sede_id = $request->sede_id;
        $records = [];

        $query = Record_vehicle::query();
        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
        ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if($request->tipo !== 'TODOS') {
            $column = '';
            if($request->tipo === 'VEHICULO') { $column = 'vehicle_id'; }
            else if($request->tipo === 'CONDUCTOR') { $column = 'driver_id'; }
            else if($request->tipo === 'PROCEDENCIA') { $column = 'origin_id'; }
            else if($request->tipo === 'USUARIO') { $column = 'user_id'; }
            else { $column = 'volqueta_id'; }
            $query->where($column, $request->value_id);
        }

        if ($sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();
        
        foreach($records  as $record){
            $record->driver->nombre;
            $record->vehicle->placa;
            $record->origin->nombre;
            $record->volqueta->nombre;
            $record->user->name;
        }
        return $records;
    }

    public function getReporteVisitantes(Request $request) {
        $fecha_inicial = $request->fecha_inicial.' 00:00:00';
        $fecha_final = $request->fecha_final.' 23:59:59';
        $sede_id = $request->sede_id;
        $records = [];

        $query = Record_person::query();

        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
        ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if ($request->user_id !== "TODOS") {
            $query->where('user_id', $request->user_id);
        }

        if ($sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();

        foreach($records as $record){
            $record->person;
            $record->user;
            $record->person->arl;
            $record->person->eps;
            $record->person->tipo_documento;
        }
        return $records;
    }

    public function pdf_recordMinuta(){
        $fecha_inicial = $_GET["fecha_inicial"]." 00:00:00";
        $fecha_final = $_GET["fecha_final"]." 23:59:59";
        $user_id = $_GET["user_id"];
        $nombre_sede = $_GET["nombre_sede"];
        $nombre_puesto = $_GET["nombre_puesto"];
        $sede_id = $_GET["sede_id"];
        $records = [];
        $imagenHeader = '';
        $imagenFooter = '';
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();

        $query = Record_minuta::query();

        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
            ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if ($user_id !== "TODOS") {
            $query->where('user_id', $user_id);
        }

        if ($nombre_sede !== "Sede master" && $sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();

        foreach($records as $record){
            $record->usuario->name;
            $record->asunto->nombre;
            $record->ubicacion;
        }
        
        $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);

        $dataReport = [
            'img_header'    => $imagenHeader,
            'img_footer'    => $imagenFooter,
            'records'       => $records,
            'nombre_sede'   => $nombre_sede,
            'nombre_puesto' => $nombre_puesto,
        ];

        $pdf = PDF::loadView('pdfs.minuta', $dataReport)->setPaper('a4', 'landscape');
        return $pdf->download('ReporteMinutas.pdf');
    }

    public function pdf_recordVehicle() {
        $fecha_inicial = $_GET["fecha_inicial"]." 00:00:00";
        $fecha_final = $_GET["fecha_final"]." 23:59:59";
        $tipo = $_GET["tipo"];
        $value_id = $_GET["value_id"];
        $nombre_sede = $_GET["nombre_sede"];
        $nombre_puesto = $_GET["nombre_puesto"];
        $sede_id = $_GET["sede_id"];
        $records = [];
        $imagenHeader = '';
        $imagenFooter = '';
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();

        $query = Record_vehicle::query();
        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
        ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if($tipo !== 'TODOS') {
            $column = '';
            if($tipo === 'VEHICULO') { $column = 'vehicle_id'; }
            else if($tipo === 'CONDUCTOR') { $column = 'driver_id'; }
            else if($tipo === 'PROCEDENCIA') { $column = 'origin_id'; }
            else if($tipo === 'USUARIO') { $column = 'user_id'; }
            else { $column = 'volqueta_id'; }
            $query->where($column, $value_id);
        }

        if ($nombre_sede !== "Sede master" && $sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();

        foreach($records  as $record){
            $record->driver->nombre;
            $record->vehicle->placa;
            $record->origin->nombre;
            $record->volqueta->nombre;
            $record->user->name;
        }

        $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);

        $dataReport = [
            'img_header'    => $imagenHeader,
            'img_footer'    => $imagenFooter,
            'records'       => $records,
            'nombre_sede'   => $nombre_sede,
            'nombre_puesto' => $nombre_puesto,
        ];

        $pdf = PDF::loadView('pdfs.vehiculos', $dataReport)->setPaper('a4', 'landscape');
        return $pdf->download('ReporteVehiculos.pdf');
    }

    public function pdf_recordVisitante() {
        $fecha_inicial = $_GET["fecha_inicial"]." 00:00:00";
        $fecha_final = $_GET["fecha_final"]." 23:59:59";
        $user_id = $_GET["user_id"];
        $nombre_sede = $_GET["nombre_sede"];
        $nombre_puesto = $_GET["nombre_puesto"];
        $sede_id = $_GET["sede_id"];
        $records = [];
        $imagenHeader = '';
        $imagenFooter = '';
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();

        $query = Record_person::query();

        $query->where('created_at', '>=', date("Y-m-d H:i:s", strtotime($fecha_inicial)))
        ->where('created_at', '<=', date("Y-m-d H:i:s", strtotime($fecha_final)));

        if ($user_id !== "TODOS") {
            $query->where('user_id', $user_id);
        }

        if ($nombre_sede !== "Sede master" && $sede_id) {
            $query->where('sede_id', $sede_id);
        }

        $query->orderBy('id', 'DESC');

        $records = $query->get();
        foreach($records as $record){
            $record->person;
            $record->user;
            $record->person->arl;
            $record->person->eps;
            $record->person->tipo_documento;
        }

        $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);

        $dataReport = [
            'img_header' => $imagenHeader,
            'img_footer' => $imagenFooter,
            'records' => $records,
            'nombre_sede'   => $nombre_sede,
            'nombre_puesto' => $nombre_puesto,
        ];

        $pdf = PDF::loadView('pdfs.visitantes', $dataReport)->setPaper('a4', 'landscape');
        return $pdf->download('ReporteVisitantes.pdf');
    }

    public function getImagenesReporte() {
        $imagenHeader = '';
        $imagenFooter = '';
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();
        $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);

        return response()->json(
            [
                "img_header" => $imagenHeader,
                "img_footer" => $imagenFooter
            ]
        );
    }
    
    public function updateImagenesReporte(Request $request) {
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();

        if ($request->file('img_header') ) {
            $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
            
            if ($imagenHeader) {
                $fileService->eliminarArchivo($imagenHeader);
            }
    
            $fileService->guardarArchivo($request->file('img_header'), "/img/", 'img_header');
        }

        if ($request->file('img_footer') ) {
            $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);
            
            if ($imagenFooter) {
                $fileService->eliminarArchivo($imagenFooter);
            }
            
            $fileService->guardarArchivo($request->file('img_footer'), '/img/', 'img_footer');
        }
        
        return response()->json(["msg" => "Imagenes actualizadas"]);
    }
    
    public function deleteImagenesReporte() {
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $fileService = new FileService();
        
        $imagenHeader = $fileService->getArchivo('img/img_header', $extensionesImagenes);
            
        if ($imagenHeader) {
            $fileService->eliminarArchivo($imagenHeader);
        }
    
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);
        
        if ($imagenFooter) {
            $fileService->eliminarArchivo($imagenFooter);
        }
        
        return response()->json(["msg" => "Imagenes actualizadas"]);
    }

    public function pdf_hojaDeVida(Request $request) {
        $user_id = $request->query('user_id');
        $record = Hoja_de_vida::where('user_id', $user_id)->get();

        if ($record->isEmpty()) {
            return response()->json(['error' => 'Hoja de vida vacia'], 404);
        }

        $foto = '';
        $firma = '';
        $firmaAutorizador = '';
        foreach ($record as $rec) {
            $rec->informacion_general = json_decode($rec->informacion_general, true) ?? [];
            $rec->informacion_personal = json_decode($rec->informacion_personal, true) ?? [];
            $rec->informacion_familiar = json_decode($rec->informacion_familiar, true) ?? [];
            $rec->educacion_aptitudes = json_decode($rec->educacion_aptitudes, true) ?? [];
            $rec->trayectoria_empresas = json_decode($rec->trayectoria_empresas, true) ?? [];
            $rec->experiencia_laboral = json_decode($rec->experiencia_laboral, true) ?? [];
            $rec->referencias_personales = json_decode($rec->referencias_personales, true) ?? [];
            $rec->administracion_proceso_seleccion = json_decode($rec->administracion_proceso_seleccion, true) ?? [];
        }
        $fileService = new FileService();
        $extensionesImagenes = config('constantes.extensiones_imagenes');
        $foto = $fileService->getArchivo('/hvs/fotos/'.$user_id, $extensionesImagenes);
        $firma = $fileService->getArchivo('/hvs/firmas/'.$user_id, $extensionesImagenes);
        $firmaAutorizador = $fileService->getArchivo('/hvs/firmasAutorizacion/'.$user_id, $extensionesImagenes);

        $dataReport = [
            'foto' => $foto,
            'firma' => $firma,
            'firmaAutorizador' => $firmaAutorizador,
            'userId' => $user_id,
            'record' => $record
        ];

        $pdf = PDF::loadView('pdfs.hojadevida', $dataReport)->setPaper('letter', 'portrait');
        return $pdf->download('HojaDeVida.pdf');
    }


}
