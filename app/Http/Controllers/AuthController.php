<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Users_sede;
use App\Http\Controllers\HojaVidaController;

class AuthController extends Controller
{
    //
    public function register(Request $request){
        $request->validate([
            'name'              => ['required'],
            'rol'               => ['required'],
            'tipo_documento_id' => ['required'],
            'numero_documento'  => ['required', 'numeric'],
            'direccion'         => ['required'],
            'ciudad'            => ['required'],
            'telefono_uno'      => ['required', 'numeric'],
            'fecha_nacimiento'  => ['required'],
            'email'             => ['required', 'email', 'unique:users'],
            'password'          => ['required', 'min:6'],
        ]);

        $user = User::create([
            'name'              => $request->name,
            'email'             => $request->email,
            'password'          => Hash::make($request->password),
            'rol'               => $request->rol,
            'tipo_documento_id' => $request->tipo_documento_id,
            'numero_documento'  => $request->numero_documento,
            'direccion'         => $request->direccion,
            'ciudad'            => $request->ciudad,
            'telefono_uno'      => $request->telefono_uno,
            'telefono_dos'      => $request->telefono_dos,
            'fecha_nacimiento'  => $request->fecha_nacimiento,
            'estado'            => '1',
        ]);
        return response()->json(['msg' => 'Registro exitoso', 'user_id' => $user->id]);
    }

    public function login(Request $request){
        $request->validate([
            'email'         => 'required|email',
            'password'      => 'required',
            'device_name'   => 'required',
        ]);
    
        $user = User::where('email', $request->email)->first();

        if ($user && $user->estado != '1') {
            return [ 
                'status' => 423,
                'msg' => 'El usuario no se encuentra activo. Consulte con el administrador'
            ];
        }
    
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }
        return [
                'status' => 200,
                'datosUser' => $user,
                'user' => $user->createToken($request->device_name)->plainTextToken            
                ];
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json(['msg' => "logout successfull..."]);
    }

    public function getUsers()
    {
        return User::where('estado', '1')
            ->whereDoesntHave('user_sedes', function ($query) {
                $query->whereHas('sede', function ($subQuery) {
                    $subQuery->where('estado', 'master');
                });
            })
            ->orderBy('name')
            ->get();
    }

    public function getUsersGuardas(Request $request){
        $sedeId = $request->input('sede_id');

        $query = User::query();

        $query->where('estado', '1')
            ->where('rol', 'GUARDA DE SEGURIDAD');

        if ($sedeId) {
            $query->whereHas('user_sedes', function ($subQuery) use ($sedeId) {
                $subQuery->where('sede_id', $sedeId);
            });
        }

        $query->orderBy('name');

        return $query->get();
    }

    public function getUser($id){
        return User::findOrFail($id);
    }

    public function deleteUser(Request $request, HojaVidaController $hojaVidaController){
        $user = User::findOrFail($request->id);
        $user->estado = '2';
        $hojaVidaController->deleteHv($request->id);
        $user->update();
        return response()->json(['msg' => "Registro eliminado correctamente"]);
    }

    public function editUser(Request $request){
        $request->validate([
            'name'              => ['required'],
            'rol'               => ['required'],
            'email'             => ['required', 'email', 'unique:users,email,'.$request->id],
            'password'          => ['min:6'],
            'tipo_documento_id' => ['required'],
            'numero_documento'  => ['required', 'numeric'],
            'direccion'         => ['required'],
            'ciudad'            => ['required'],
            'telefono_uno'      => ['required', 'numeric'],
            'fecha_nacimiento'  => ['required'],
        ]);
        $user = User::findOrFail($request->id);
        $user->name                 = $request->name;
        $user->rol                  = $request->rol;
        $user->email                = $request->email;
        $user->tipo_documento_id    = $request->tipo_documento_id;
        $user->numero_documento     = $request->numero_documento;
        $user->direccion            = $request->direccion;
        $user->ciudad               = $request->ciudad;
        $user->telefono_uno         = $request->telefono_uno;
        $user->telefono_dos         = $request->telefono_dos;
        $user->fecha_nacimiento     = $request->fecha_nacimiento;
        if($request->password){
            $user->password = Hash::make($request->password);
        }
        $user->update();
        return response()->json(['msg' => "Registro actualizado correctamente", 'user_id' => $user->id]);
    }

    public function sendEmailUsuario(Request $request){
        //return $request;
        $destino = 'andresbastidas82@gmail.com';
        $asunt = 'Contacto desde Página Web';
          //echo $nombre." ".$apellido." ".$correo." ".$telef." ".$menss;
	      
        $header = 'From: ' . $request->email . "\r\n";
        $header .= "X-Mailer: PHP/" . phpversion() . "\r\n";
        $header .= "Mime-Version: 1.0 \r\n";
        $header .= "Content-Type: text/plain";
        
        $mensaje = "Mensaje enviado por: " .strtoupper($request->name). "\r\n";
        $mensaje .= "Enviado el " . date('d/m/Y', time()) ."\r\n"; 
        $mensaje .= "Su correo eléctronico es: " . $request->email . "\r\n";
        $mensaje .= "Teléfono: " . $request->phone . "\r\n";
        $mensaje .= "Mensaje: " . $request->message . "\r\n";
        	          
    
        if(mail($destino, $asunt, utf8_decode($mensaje), $header)){
            return response()->json(['msg' => "Email enviado correctamente", 'status' => 200 ]);
        }else{
            return response()->json(['msg' => "Ocurrio un error", 'status' => 500]);
        }
        
    }
}
