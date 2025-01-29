<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pdf</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 90%;
            max-width: 900px;
            background: white;
            padding: 5px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: auto;
        }

        h3 {
            text-align: center;
            background: #007bff;
            color: white;
            padding: 3px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 5px;
        }

        th,
        td {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 3px;
            font-size: 10px;
        }

        th {
            background: #007bff;
            color: white;
            text-align: left;
        }

        input,
        select {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .photo-upload {
            text-align: center;
            border: 2px dashed #007bff;
            padding: 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            color: #007bff;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h3>HOJA DE VIDA - SOLICITUD DE EMPLEO</h3>
        <table>
            <thead>
                <tr>
                    <th colspan="6">Fecha</th>
                    <th colspan="10">Empleo o cargo en el que está interesado</th>
                    <th colspan="6">Código cargo</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2">D: </td>
                    <td colspan="2">M: </td>
                    <td colspan="2">A: </td>
                    <td colspan="10"></td>
                    <td colspan="6"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h3>I. INFORMACION GENERAL <span style="font-size: 15px; text-align: center; padding-left: 20px">(**) Respuesta
                opcional</span> </h3>
        <table>
            <tbody>
                <tr>
                    <td colspan="8">Apellido(s) del aspirante</td>
                    <td colspan="8">Nombre(s) del aspirante</td>
                    <td rowspan="8"></td>
                    <td colspan="5" rowspan="8"></td>
                </tr>
                <tr>
                    <td colspan="8"></td>
                    <td colspan="8"></td>
                </tr>
                <tr>
                    <td colspan="10">Dirección domicilio / Barrio</td>
                    <td colspan="6">Ciudad</td>
                </tr>
                <tr>
                    <td colspan="10"></td>
                    <td colspan="6"></td>
                </tr>
                <tr>
                    <td colspan="8">Teléfono</td>
                    <td colspan="8">No. Celular</td>
                </tr>
                <tr>
                    <td colspan="8"></td>
                    <td colspan="8"></td>
                </tr>
                <tr>
                    <td colspan="8">Correo electrónico</td>
                    <td colspan="8">Nacionalidad</td>
                </tr>
                <tr>
                    <td colspan="8"></td>
                    <td colspan="8"></td>
                </tr>
                <tr>
                    <td colspan="10">Profesión, ocupación u oficio</td>
                    <td colspan="6">(*) Estado civil</td>
                    <td colspan="6">Años de experiencia laboral</td>
                </tr>
                <tr>
                    <td colspan="10"></td>
                    <td colspan="6"></td>
                    <td colspan="6"></td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <div class="container">
        <table>
        <thead>
                <tr>
                    <th colspan="20">Documentacion</th>
                </tr>
            </thead>
	<tbody>
		<tr>
			<td colspan="4">Cedula de ciudadania</td>
			<td></td>
			<td colspan="5">N°</td>
			<td colspan="5">(**) Libreta militar Nº</td>
			<td colspan="4">Primera clase</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4">Extranjería</td>
			<td></td>
			<td colspan="5">Expedida en:</td>
			<td colspan="5">Distrito Nº</td>
			<td colspan="4">Segunda clase</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="7">Tarjeta profesional Nº</td>
			<td colspan="4">¿Tiene vehículo?</td>
			<td colspan="5">Licencia de conducción Nº</td>
			<td colspan="4">Categoría</td>
		</tr>
		<tr>
			<td colspan="7"></td>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="5"></td>
			<td colspan="4"></td>
		</tr>
	</tbody>
</table>
    </div>

    <div class="container">
        <h3>II. INFORMACION PERSONAL</h3>
        <table>
	<tbody>
		<tr>
			<td colspan="4">¿Está trabajando actualmente?</td>
			<td colspan="7">¿En qué empresa?</td>
			<td colspan="4">Empleado</td>
			<td colspan="7">Tipo de Contrato</td>
		</tr>
		<tr>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="7"></td>
			<td colspan="4">Independiente</td>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="4">¿Trabajó antes en
esta empresa?</td>
			<td colspan="4">¿Solicitó empleo antes en
esta empresa?</td>
			<td colspan="5">Fecha</td>
			<td colspan="4">¿Lo recomienda alguien
de esta empresa?</td>
			<td colspan="5">Nombre</td>
		</tr>
		<tr>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td>D</td>
			<td>M</td>
			<td colspan="3">A</td>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="5">Dependencia</td>
		</tr>
		<tr>
			<td colspan="4" rowspan="2">¿Tiene parientes
que trabajan en
esta empresa?</td>
			<td>Si</td>
			<td colspan="9">Nombre</td>
			<td colspan="8">¿Cómo tuvo conocimiento de la existencia de la vacante?</td>
		</tr>
		<tr>
			<td>No</td>
			<td colspan="9">Dependencia</td>
			<td colspan="4">motivo: </td>
			<td colspan="4">¿Cuál?</td>
		</tr>
		<tr>
			<td colspan="6">¿En qué ciudad o población ha vivido la mayor parte de su vida?</td>
			<td colspan="8">¿En qué ciudades o regiones del país ha trabajado?</td>
			<td colspan="5" rowspan="2">¿Aceptaría trabajar en una ciudad o
sitio distinto al inicialmente contratado?</td>
			<td colspan="2">Si</td>
		</tr>
		<tr>
			<td colspan="6"></td>
			<td colspan="8"></td>
			<td colspan="2">No</td>
		</tr>
		<tr>
			<td colspan="2">Vive en casa:</td>
			<td colspan="2">¿Familiar?</td>
			<td colspan="9">Nombre del arrendador</td>
			<td colspan="4">Teléfono</td>
			<td colspan="5">¿Hace cuánto tiempo reside en este lugar?</td>
		</tr>
		<tr>
			<td colspan="2">¿Propia?</td>
			<td colspan="2">¿Alquilada?</td>
			<td colspan="9"></td>
			<td colspan="4"></td>
			<td colspan="5"></td>
		</tr>
		<tr>
			<td colspan="3" rowspan="2">¿Actualmente tiene algún
ingreso adicional?</td>
			<td>Si</td>
			<td colspan="11">Descríbalo e indique su valor mensual</td>
			<td colspan="7">¿Cuánto suman sus obligaciones económicas mensuales?</td>
		</tr>
		<tr>
			<td>No</td>
			<td colspan="11"></td>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="15">¿Por qué conceptos?</td>
			<td colspan="7">¿Cuánto es su aspiración salarial?</td>
		</tr>
		<tr>
			<td colspan="15"></td>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="9">¿Cuál(es) es(son) su(s) principal(es) afición(es)?</td>
			<td colspan="4">¿Practica algún deporte?</td>
			<td colspan="9">¿Cuál(es)?</td>
		</tr>
		<tr>
			<td colspan="9"></td>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="9"></td>
		</tr>
		<tr>
			<td colspan="22">¿Alguna vez ha obtenido distinciones o reconocimientos por su desempeño en actividades deportivas, culturales, sociales, etc.?</td>
		</tr>
		<tr>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="2">¿Cuál(es)?</td>
			<td colspan="16"></td>
		</tr>
		<tr>
			<td colspan="22">¿Pertenece a algún tipo de asociación comunitaria, deportiva, cultural, etc.?</td>
		</tr>
		<tr>
			<td colspan="2">Si</td>
			<td colspan="2">No</td>
			<td colspan="2">¿Cuál(es)?</td>
			<td colspan="16"></td>
		</tr>
	</tbody>
</table>
    </div>

    <div class="container">
    <table>
        <thead>
            <tr>
                <th colspan="20">OBJETIVO Mencione brevemente que expectativas tiene a nivel laboral, educativo y personal e indique como planea hacerlas realidad.</th>
            </tr>

        </thead>
	<tbody>
		<tr>
			<td colspan="20"></td>
		</tr>
		<tr>
			<td colspan="20"></td>
		</tr>
		<tr>
			<td colspan="20"></td>
		</tr>
		
	</tbody>
</table>

    </div>


</body>

</html>