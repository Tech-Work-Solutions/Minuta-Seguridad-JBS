<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pdf</title>
  <style>
    body{
      font-family: Roboto;
    }
    table{
      caption-side:bottom;
      width: 100%;
      border: 1px solid #D2D2D2;
      border-radius: 10px;
      overflow: hidden;
    }
    table th {background-color: #025F9B; color: white; padding: 5px;}

    table tr:nth-child(odd) {background-color: white; font-size: 12px;}
    table tr:nth-child(even) {background-color: #E3E3E3;  font-size: 12px}
    h3{
      margin-top: -7px;
      color: #27196E;
    }
    .div-img {
      width: 100%;
      text-align: center;
    }
    .header {
      text-align: left;
      margin-bottom: 20px;
    }
    .header img {
      width: 100%;
      max-width: 220px;
      height: auto;
      max-height: 80px;
    }
    .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      text-align: center;
      margin-top: 20px;
    }
    .footer img {
      width: 100%;
      max-width: 200px;
      height: auto;
      max-height: 70px;
    }
    
  </style>
</head>
<body>
  <div class="main-content">
    <div class="content-header header">
      @if (!empty($img_header))
        <img src="{{ asset($img_header) }}" alt="JBS">
      @endif
      <?php
        $nombre_sede = ($nombre_sede != "" || $nombre_sede != null ) ? $nombre_sede : "" ;
        $nombre_puesto = ($nombre_puesto != "" || $nombre_puesto != null ) ? $nombre_puesto : "" ;
        $ubicacionReporte = ($nombre_sede && $nombre_puesto) ? "del puesto: " . $nombre_puesto . " - " . "sede: " . $nombre_sede : "";
      ?>
      <h3>Reporte de vehículos {{$ubicacionReporte}}</h3>
      <hr>
    </div>
    <div class="content-body">
      <table>
        <thead>
          <tr>
            <th>Fecha y hora</th>
            <th>Guarda</th>
            <th>Vehículo</th>
            <th>Conductor</th>
            <th>Procedencia</th>
            <th>Tipo vehículo</th>
            <th>Entrada o salida</th>
            <th>Observaciones</th>
            <th>Audio</th>
            <th>Video</th>
            <th>Foto</th>
          </tr>
        </thead>
        <tbody>
			    @foreach($records as $record)
          <?php 
            $foto = ($record->foto != "" || $record->foto != null ) ? $record->foto : "" ;
            $audio = ($record->audio != "" || $record->audio != null ) ? $record->audio : "" ;
            $video = ($record->video != "" || $record->video != null) ? $record->video : "";
          ?>
          <tr>
            <td>{{ $record->created_at }}</td>
            <td>{{ strtoupper($record->user->name) }}</td>
            <td>{{ strtoupper($record->vehicle->placa) }}</td>
            <td>{{ $record->driver->nombre }}</td>
            <td>{{ $record->origin->nombre }}</td>
            <td>{{ $record->volqueta->nombre }}</td>
            <td>{{ $record->entrada_salida == 'E' ? 'ENTRADA' : 'SALIDA' }}</td>
            <td>{{ $record->observaciones }}</td>
            <td>
              @if ($audio)
                <p><a href="{{ asset($audio) }}" target="_blank">Escuchar audio</a></p>
              @endif
            </td>
            <td>
              @if ($video)
                <p><a href="{{ asset($video) }}" target="_blank">Ver video</a></p>
              @endif
            </td>
            <td width="185px">
              @if ($record->foto != "" || $record->foto != null)
              <div class="div-img">
                <img src="{{ asset($foto) }}" alt="-" width="180px">
              </div>
              @endif
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  @if (!empty($img_footer))
    <div class="footer">
      <img src="{{ asset($img_footer) }}" alt="Footer Image">
    </div>
  @endif
  </div>
</body>
</html>