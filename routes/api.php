<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\VehiculoController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\OriginController;
use App\Http\Controllers\VolquetaController;
use App\Http\Controllers\EpsController;
use App\Http\Controllers\ArlController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\TipoDocumentoController;
use App\Http\Controllers\RecordsController;
use App\Http\Controllers\ReportesController;
use App\Http\Controllers\UbicacionController;
use App\Http\Controllers\ClientsController;
use App\Http\Controllers\SedesController;
use App\Http\Controllers\OpcionesMenuController;
use App\Http\Controllers\OpcionesFormularioController;
use App\Http\Controllers\UsersSedeController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::get('getUsers', [AuthController::class, 'getUsers']);
Route::get('getUsersGuardas', [AuthController::class, 'getUsersGuardas']);
Route::get('getUser/{id}', [AuthController::class, 'getUser']);
Route::post('deleteUser', [AuthController::class, 'deleteUser']);
Route::post('editUser', [AuthController::class, 'editUser']);

Route::post('registerVehiculo', [VehiculoController::class, 'registerVehiculo']);
Route::get('getVehiculos', [VehiculoController::class, 'getVehiculos']);

Route::post('registerConductor', [DriverController::class, 'registerConductor']);
Route::get('getConductores', [DriverController::class, 'getConductores']);

Route::post('registerProcedencia', [OriginController::class, 'registerProcedencia']);
Route::get('getProcedencias', [OriginController::class, 'getProcedencias']);

Route::post('registerVolqueta', [VolquetaController::class, 'registerVolqueta']);
Route::get('getVolquetas', [VolquetaController::class, 'getVolquetas']);

Route::post('registerEps', [EpsController::class, 'registerEps']);
Route::get('getEps', [EpsController::class, 'getEps']);

Route::post('registerArl', [ArlController::class, 'registerArl']);
Route::get('getArls', [ArlController::class, 'getArls']);

Route::post('registerSubject', [SubjectController::class, 'registerSubject']);
Route::get('getSubjects', [SubjectController::class, 'getSubjects']);

Route::post('registerDocumento', [TipoDocumentoController::class, 'registerDocumento']);
Route::get('getDocumentos', [TipoDocumentoController::class, 'getDocumentos']);

Route::post('registerUbicacion', [UbicacionController::class, 'registerUbicacion']);
Route::get('getUbicaciones', [UbicacionController::class, 'getUbicaciones']);

Route::post('registerMinuta', [RecordsController::class, 'registerMinuta']);
Route::post('updateRecordMinuta', [RecordsController::class, 'updateRecordMinuta']);
Route::post('deleteRecordMinuta', [RecordsController::class, 'deleteRecordMinuta']);
Route::get('getRecordMinuta/{id}', [RecordsController::class, 'getRecordMinuta']);

Route::post('recordVehicle', [RecordsController::class, 'recordVehicle']);
Route::get('getRecordVehicle/{id}', [RecordsController::class, 'getRecordVehicle']);
Route::post('updateRecordVehicle', [RecordsController::class, 'updateRecordVehicle']);
Route::post('deleteRecordVehicle', [RecordsController::class, 'deleteRecordVehicle']);

Route::post('recordVisitante', [RecordsController::class, 'recordVisitante']);
Route::get('getRecordVisitante/{id}', [RecordsController::class, 'getRecordVisitante']);
Route::post('updateRecordVisitante', [RecordsController::class, 'updateRecordVisitante']);
Route::post('deleteRecordVisitante', [RecordsController::class, 'deleteRecordVisitante']);

Route::post('getPerson', [RecordsController::class, 'getPerson']);
Route::post('getRecordsMinutaByUser', [RecordsController::class, 'getRecordsMinutaByUser']);
Route::post('getRecordsVehiculosByUser', [RecordsController::class, 'getRecordsVehiculosByUser']);
Route::post('getRecordsVisitantesByUser', [RecordsController::class, 'getRecordsVisitantesByUser']);

Route::post('getReporteMinuta', [ReportesController::class, 'getReporteMinuta']);
Route::post('getReporteVehiculos', [ReportesController::class, 'getReporteVehiculos']);
Route::post('getReporteVisitantes', [ReportesController::class, 'getReporteVisitantes']);

Route::get('pdf_recordMinuta', [ReportesController::class, 'pdf_recordMinuta']);
Route::get('pdf_recordVehicle', [ReportesController::class, 'pdf_recordVehicle']);
Route::get('pdf_recordVisitante', [ReportesController::class, 'pdf_recordVisitante']);

Route::post('registerClients', [ClientsController::class, 'registerClients']);
Route::get('getClients', [ClientsController::class, 'getClients']);

Route::post('registerSede', [SedesController::class, 'registerSede']);
Route::get('getSedes', [SedesController::class, 'getSedes']);
Route::get('getSedesByClients', [SedesController::class, 'getSedesByClients']);

Route::post('registerOpcionMenu', [OpcionesMenuController::class, 'registerOpcionMenu']);
Route::get('getOpcionesMenu', [OpcionesMenuController::class, 'getOpcionesMenu']);


Route::post('registerOpcionesFormulario', [OpcionesFormularioController::class, 'registerOpcionesFormulario']);
Route::get('getOpcionesFormulario', [OpcionesFormularioController::class, 'getOpcionesFormulario']);

Route::get('getUrlLogo', function () {
    return asset('img/logo.png') ;
});

Route::get('getSedesAndClientesByUser', [UsersSedeController::class, 'getSedesAndClientesByUser']);
Route::post('registerUserSede', [UsersSedeController::class,'registerUserSede']);
Route::post('updateUserSedes', [UsersSedeController::class, 'updateUserSedes']);
Route::post('deleteAllUserSedes', [UsersSedeController::class, 'deleteAllUserSedes']);

/** Route::post('sendEmailUsuario', [AuthController::class, 'sendEmailUsuario']); */