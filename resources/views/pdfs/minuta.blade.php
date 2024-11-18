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
    .div-img{
      width: 100%;
      text-align: center;
    }
    
  </style>
</head>
<body>
  <div class="main-content">
    <div class="content-header">
      <img src="{{ asset('/img/logo2.png') }}" alt="JBS" width="220px">
      <h3>Reporte de minuta</h3>
      <hr>
    </div> 
    <div class="content-body">
      <table>
        <thead>
          <tr>
            <th>Fecha y hora</th>
            <th>Guarda</th>
            <th>Asunto</th>
            <th>Puesto</th>
            <th>Anotaciones</th>
            <th>Foto</th>
          </tr>
        </thead>
        <tbody>
			    @foreach($records as $record)
          <?php $foto = ($record->foto != "" || $record->foto != null ) ? $record->foto : "" ;  ?>
          <tr>
            <td>{{ $record->created_at }}</td>
            <td>{{ strtoupper($record->usuario->name) }}</td>
            <td>{{ strtoupper($record->asunto->nombre) }}</td>
            <td>{{ $record->ubicacion->nombre }}</td>
            <td>{{ $record->anotaciones }}</td>
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
  </div>
</body>
</html>