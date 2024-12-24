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
            $nombre = $file->getClientOriginalName();
            $f = date("dmyHis");
            $fileName = $f.$nombre;
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