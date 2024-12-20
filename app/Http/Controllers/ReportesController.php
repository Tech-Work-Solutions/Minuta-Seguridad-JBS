<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Http\Request;
use App\Models\Record_minuta;
use App\Models\Record_person;
use App\Models\Record_vehicle;
use App\Models\User;
use App\Services\FileService;

class ReportesController extends Controller
{
    //
    public function getReporteMinuta(Request $request) {
        $fecha_inicial = $request->fecha_inicial." 00:00:00";
        $fecha_final = $request->fecha_final." 23:59:59";
        //return $fecha_inicial;
        $records = [];
        if ($request->user_id === "TODOS"){
            $records = Record_minuta::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
            
        } else {
            $records = Record_minuta::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                ->where('user_id', $request->user_id)
                                ->orderBy('id', 'DESC')
                                ->get();
        }
        foreach($records as $record){
            $record->usuario->name;
            $record->asunto->nombre;
            $record->ubicacion;
        }
        return $records;
    }

    public function getReporteVehiculos(Request $request) {
        $fecha_inicial = $request->fecha_inicial.' 00:00:00';
        $fecha_final = $request->fecha_final.' 23:59:59';
        $records = [];
        if($request->tipo === 'TODOS') {
            $records = Record_vehicle::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
        }else{
            $column = '';
            if($request->tipo === 'VEHICULO') { $column = 'vehicle_id'; }
            else if($request->tipo === 'CONDUCTOR') { $column = 'driver_id'; }
            else if($request->tipo === 'PROCEDENCIA') { $column = 'origin_id'; }
            else if($request->tipo === 'GUARDA') { $column = 'user_id'; }
            else { $column = 'volqueta_id'; }
            $records = Record_vehicle::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->where($column, $request->value_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();
        }
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
        $records = [];
        if ($request->user_id === "TODOS"){
            $records = Record_person::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
            
        }else {
            $records = Record_person::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->where('user_id', $request->user_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();            
        }
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

        $records = [];
        if ($user_id === "TODOS"){
            $records = Record_minuta::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
            
        } else {
            $records = Record_minuta::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                ->where('user_id', $user_id)
                                ->orderBy('id', 'DESC')
                                ->get();
        }
        foreach($records as $record){
            $record->usuario->name;
            $record->asunto->nombre;
            $record->ubicacion;
        }
        //var_dump($obj);

        $pdf = PDF::loadView('pdfs.minuta', compact('records'))->setPaper('a4', 'landscape');
        return $pdf->download('ReporteMinutas.pdf');
    }

    public function pdf_recordVehicle() {
        $fecha_inicial = $_GET["fecha_inicial"]." 00:00:00";
        $fecha_final = $_GET["fecha_final"]." 23:59:59";
        $tipo = $_GET["tipo"];
        $value_id = $_GET["value_id"];
        $records = [];
        if($tipo === 'TODOS') {
            $records = Record_vehicle::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
        }else{
            $column = '';
            if($tipo === 'VEHICULO') { $column = 'vehicle_id'; }
            else if($tipo === 'CONDUCTOR') { $column = 'driver_id'; }
            else if($tipo === 'PROCEDENCIA') { $column = 'origin_id'; }
            else if($tipo === 'GUARDA') { $column = 'user_id'; }
            else { $column = 'volqueta_id'; }
            $records = Record_vehicle::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->where($column, $value_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();
        }
        foreach($records  as $record){
            $record->driver->nombre;
            $record->vehicle->placa;
            $record->origin->nombre;
            $record->volqueta->nombre;
            $record->user->name;
        }
        $pdf = PDF::loadView('pdfs.vehiculos', compact('records'))->setPaper('a4', 'landscape');
        return $pdf->download('ReporteVehiculos.pdf');
    }

    public function pdf_recordVisitante() {
        $fecha_inicial = $_GET["fecha_inicial"]." 00:00:00";
        $fecha_final = $_GET["fecha_final"]." 23:59:59";
        $user_id = $_GET["user_id"];
        $records = [];
        if ($user_id === "TODOS"){
            $records = Record_person::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->orderBy('id', 'DESC')
                                    ->get();
            
        }else {
            $records = Record_person::where('created_at', '>=',  date("Y-m-d H:i:s",  strtotime($fecha_inicial)))
                                    ->where('created_at', '<=', date("Y-m-d H:i:s",  strtotime($fecha_final)))
                                    ->where('user_id', $user_id)
                                    ->orderBy('id', 'DESC')
                                    ->get();            
        }
        foreach($records as $record){
            $record->person;
            $record->user;
            $record->person->arl;
            $record->person->eps;
            $record->person->tipo_documento;
        }
        $pdf = PDF::loadView('pdfs.visitantes', compact('records'))->setPaper('a4', 'landscape');
        return $pdf->download('ReporteVisitantes.pdf');
    }

    public function getImagenesReporte() {
        $imagenHeader = '';
        $imagenFooter = '';
        
        $extensionesImagenes = [
            'bmp', 
            'gif', 
            'ico', 
            'jpeg',
            'jpg', 
            'png', 
            'svg', 
            'tiff',
            'webp'
        ];
        $fileService = new FileService();
        $imagenHeader = $fileService->getArchivo('img/logo2', $extensionesImagenes);
        $imagenFooter = $fileService->getArchivo('img/img_footer', $extensionesImagenes);

        return response()->json(
            [
                "img_header" => $imagenHeader,
                "img_footer" => $imagenFooter
            ]
        );
    }

}
