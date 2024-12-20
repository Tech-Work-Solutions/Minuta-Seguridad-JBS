<?php

namespace App\Services;

class FileService
{
    public function guardarArchivo($file, $carpeta, $nombre = null)
    {
        if (!$file) {
            return '';
        }

        if (!$nombre) {
            // obtenemos el nombre del archivo
            $nombre = $file->getClientOriginalName();
            // Crear un nombre único para evitar conflictos
            $f = date("dmyHis");
    
            $fileName = $f.$nombre;
            //indicamos que queremos guardar un nuevo archivo en el disco local
            $file->move(public_path($carpeta), $fileName);
            return $carpeta.$f.$nombre;
        }
        $extension = $file->getClientOriginalExtension();
        $file->move(public_path($carpeta), $nombre.".".$extension);
        return $carpeta.$nombre.$extension;
    }

    public function eliminarArchivo($ruta)
    {
        if ($ruta && file_exists(public_path($ruta))) {
            unlink(public_path($ruta));
            return true;
        }
        return false;
    }
    
    public function getArchivo($ruta, $extensiones) {
 
        foreach ($extensiones as $extension) {
            $rutaCompleta = public_path($ruta . '.' . $extension);

            if (file_exists($rutaCompleta)) {
                return $ruta . '.' . $extension;
            }
        }

        return null;
    }

}