<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;

class SubjectController extends Controller
{
    public function registerSubject(Request $request){
        $request->validate(['nombre' => ['required', 'unique:subjects']]);
        $asunto = Subject::create(['nombre' => $request->nombre]); 
        return response()->json(["msg" => "Registro exitoso", "res" => $asunto]); 
    }

    public function getSubjects(Request $request){
        return Subject::orderBy('nombre')->get();
    }
}
