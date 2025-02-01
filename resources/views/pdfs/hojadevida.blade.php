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
			padding: 1px;
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
			padding: 1px;
			border-radius: 5px;
			margin-top: 0.2em;
			margin-bottom: 0.2em;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 0.5em;
		}

		th,
		td {
			border: 1px solid #ddd;
			border-radius: 5px;
			padding: 2px;
			font-size: 10px;
		}

		th {
			background: #007bff;
			color: white;
			text-align: left;
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
	</style>
</head>

<body>
	@php
		$informacion_general = $record[0]->informacion_general ?? [];
		$informacion_personal = $record[0]->informacion_personal ?? [];
		$informacion_familiar = $record[0]->informacion_familiar ?? [];
		$educacion_aptitudes = $record[0]->educacion_aptitudes ?? [];
		$trayectoria_empresas = $record[0]->trayectoria_empresas ?? [];
	@endphp

	<div class="container">
		<h3>HOJA DE VIDA - SOLICITUD DE EMPLEO {{$record[0]->user_id}}</h3>
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
					<td colspan="2">D: {{$informacion_general['dia'] ?? ''}}  </td>
					<td colspan="2">M: {{$informacion_general['mes'] ?? ''}} </td>
					<td colspan="2">A: {{$informacion_general['anio'] ?? ''}} </td>
					<td colspan="10">{{$informacion_general['empleo'] ?? ''}}</td>
					<td colspan="6">{{$informacion_general['codigoCargo'] ?? ''}}</td>
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
					<td colspan="8">{{$informacion_general['nombre'] ?? ''}}</td>
					<td colspan="8">{{$informacion_general['apellido'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="10">Dirección domicilio / Barrio</td>
					<td colspan="6">Ciudad</td>
				</tr>
				<tr>
					<td colspan="10">{{$informacion_general['direccion'] ?? ''}}</td>
					<td colspan="6">{{$informacion_general['ciudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="8">Teléfono</td>
					<td colspan="8">No. Celular</td>
				</tr>
				<tr>
					<td colspan="8">{{$informacion_general['telefono'] ?? ''}}</td>
					<td colspan="8">{{$informacion_general['celular'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="8">Correo electrónico</td>
					<td colspan="8">Nacionalidad</td>
				</tr>
				<tr>
					<td colspan="8">{{$informacion_general['correo'] ?? ''}}</td>
					<td colspan="8">{{$informacion_general['nacionalidad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="10">Profesión, ocupación u oficio</td>
					<td colspan="6">(*) Estado civil</td>
					<td colspan="6">Años de experiencia laboral</td>
				</tr>
				<tr>
					<td colspan="10">{{$informacion_general['profesion'] ?? ''}}</td>
					<td colspan="6">{{$informacion_general['estadoCivil'] ?? ''}}</td>
					<td colspan="6">{{$informacion_general['experiencia'] ?? ''}}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container">
		<table>
			<thead>
				<tr>
					<th colspan="20">Documentación</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">Cedula de ciudadanía</td>
					<td>{{$informacion_general['tipoCedula'] && $informacion_general['tipoCedula'] == 'Ciudadanía' ? 'X': ''}}</td>
					<td colspan="5">N° {{$informacion_general['cedula'] ?? ''}}</td>
					<td colspan="5">(**) Libreta militar Nº {{$informacion_general['libreta'] ?? ''}}</td>
					<td colspan="4">Primera clase</td>
					<td>{{($informacion_general['claseLibreta'] ?? '') == 'Primera' ? 'X' : ''}}</td>
				</tr>
				<tr>
					<td colspan="4">Extranjería</td>
					<td>{{$informacion_general['tipoCedula'] && $informacion_general['tipoCedula'] == 'Extranjería' ? 'X': ''}}</td>
					<td colspan="5">Expedida en: {{$informacion_general['expedidaEn'] ?? ''}}</td>
					<td colspan="5">Distrito Nº {{$informacion_general['distrito'] ?? ''}}</td>
					<td colspan="4">Segunda clase</td>
					<td>{{($informacion_general['claseLibreta'] ?? '') == 'Segunda' ? 'X' : ''}}</td>
				</tr>
				<tr>
					<td colspan="7">Tarjeta profesional Nº</td>
					<td colspan="4">¿Tiene vehículo?</td>
					<td colspan="5">Licencia de conducción Nº</td>
					<td colspan="4">Categoría</td>
				</tr>
				<tr>
					<td colspan="7"> {{$informacion_general['tarjetaProfesional'] ?? ''}}</td>
					<td colspan="2">Si {{($informacion_general['vehiculo'] ?? '') == 'Si' ? 'X': ''}} </td>
					<td colspan="2">No {{($informacion_general['vehiculo'] ?? '') == 'No' ? 'X': ''}}</td>
					<td colspan="5">{{$informacion_general['licencia'] ?? ''}}</td>
					@php
						$selectedCategorias = $informacion_general['selectedCategorias'] ?? [];
						$categoriaNombres = implode(', ', array_map(function($categoria) {
								return $categoria['nombre'];
						}, $selectedCategorias));
					@endphp
					<td colspan="4">{{ $categoriaNombres }}</td>
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
					<td colspan="4">Empleado {{($informacion_personal['estadoLaboral'] ?? '') == 'empleado' ? 'X' : ''}}</td>
					<td colspan="7">Tipo de Contrato</td>
				</tr>
				<tr>
					<td colspan="2">Si {{($informacion_personal['trabajandoActualmente'] ?? '')  == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['trabajandoActualmente'] ?? '')  == 'no' ? 'X' : ''}}</td>
					<td colspan="7">{{$informacion_personal['empresa'] ?? ''}}</td>
					<td colspan="4">Independiente {{($informacion_personal['estadoLaboral'] ?? '') == 'independiente' ? 'X' : ''}}</td>
					<td colspan="7">{{$informacion_personal['tipoContrato'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4">¿Trabajó antes en
						esta empresa?</td>
					<td colspan="4">¿Solicitó empleo antes en
						esta empresa?</td>
					<td colspan="5">Fecha</td>
					<td colspan="4">¿Lo recomienda alguien
						de esta empresa?</td>
					<td colspan="5">Nombre {{$informacion_personal['nombreRecomienda'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="2">Si {{($informacion_personal['trabajoEnLaEmpresa'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['trabajoEnLaEmpresa'] ?? '') == 'no' ? 'X' : ''}}</td>
					<td colspan="2">Si {{($informacion_personal['solicitoEnLaEmpresa'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['solicitoEnLaEmpresa'] ?? '') == 'no' ? 'X' : ''}}</td>
					<td>D {{$informacion_personal['dia'] ?? ''}}</td>
					<td>M {{$informacion_personal['mes'] ?? ''}}</td>
					<td colspan="3">A {{$informacion_personal['anio'] ?? ''}}</td>
					<td colspan="2">Si {{($informacion_personal['recomendado'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['recomendado'] ?? '') == 'no' ? 'X' : ''}}</td>
					<td colspan="5">Dependencia {{$informacion_personal['dependenciaRecomienda'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4" rowspan="2">¿Tiene parientes
						que trabajan en
						esta empresa?</td>
					<td>Si {{($informacion_personal['tieneParientes'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="9">Nombre {{$informacion_personal['nombrePariente'] ?? ''}}</td>
					<td colspan="8">¿Cómo tuvo conocimiento de la existencia de la vacante?</td>
				</tr>
				<tr>
					<td>No {{($informacion_personal['tieneParientes'] ?? '') == 'no' ? 'X' : ''}}</td>
					<td colspan="9">Dependencia {{$informacion_personal['dependenciaPariente'] ?? ''}}</td>
					<td colspan="3">motivo: {{$informacion_personal['fuenteVacante'] ?? ''}} </td>
					<td colspan="5">¿Cuál? {{$informacion_personal['otroMedio'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="6">¿En qué ciudad o población ha vivido la mayor parte de su vida?</td>
					<td colspan="8">¿En qué ciudades o regiones del país ha trabajado?</td>
					<td colspan="6" rowspan="2">¿Aceptaría trabajar en una ciudad o
						sitio distinto al inicialmente contratado?</td>
					<td colspan="2">Si {{($informacion_personal['disponibleParaReubicacion'] ?? '') == "Si" ? 'X' : ''}}</td>
				</tr>
				<tr>
					<td colspan="6">{{$informacion_personal['residenciaPrincipal'] ?? ''}}</td>
					<td colspan="8">{{$informacion_personal['zonasDeTrabajo'] ?? ''}}</td>
					<td colspan="2">No {{($informacion_personal['disponibleParaReubicacion'] ?? '') == "no" ? 'X' : ''}}</td>
				</tr>
				<tr>
					<td colspan="2">Vive en casa:</td>
					<td colspan="2">¿Familiar? {{($informacion_personal['casaPropia'] ?? '') == 'Familiar' ? 'X' : ''}}</td>
					<td colspan="9">Nombre del arrendador</td>
					<td colspan="4">Teléfono</td>
					<td colspan="5">¿Hace cuánto tiempo reside en este lugar?</td>
				</tr>
				<tr>
					<td colspan="2">¿Propia? {{($informacion_personal['casaPropia'] ?? '') == 'Propia' ? 'X' : ''}}</td>
					<td colspan="2">¿Alquilada? {{($informacion_personal['casaPropia'] ?? '') == 'Alquilada' ? 'X' : ''}}</td>
					<td colspan="9">{{$informacion_personal['arrendador'] ?? ''}}</td>
					<td colspan="4">{{$informacion_personal['telefonoArrendador'] ?? ''}}</td>
					<td colspan="5">{{$informacion_personal['tiempoEnVivienda'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="3" rowspan="2">¿Actualmente tiene algún
						ingreso adicional?</td>
					<td>Si {{($informacion_personal['ingresoAdicional'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="11">Descríbalo e indique su valor mensual</td>
					<td colspan="7">¿Cuánto suman sus obligaciones económicas mensuales?</td>
				</tr>
				<tr>
					<td>No {{($informacion_personal['ingresoAdicional'] ?? '') == 'No' ? 'X' : ''}}</td>
					<td colspan="11">{{$informacion_personal['detalleIngresos'] ?? ''}}</td>
					<td colspan="7">{{$informacion_personal['totalObligaciones'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="15">¿Por qué conceptos?</td>
					<td colspan="7">¿Cuánto es su aspiración salarial?</td>
				</tr>
				<tr>
					<td colspan="15">{{$informacion_personal['conceptoObligaciones'] ?? ''}}</td>
					<td colspan="7">{{$informacion_personal['aspiracionSalarial'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="9">¿Cuál(es) es(son) su(s) principal(es) afición(es)?</td>
					<td colspan="4">¿Practica algún deporte?</td>
					<td colspan="9">¿Cuál(es)?</td>
				</tr>
				<tr>
					<td colspan="9">{{$informacion_personal['aficiones'] ?? ''}}</td>
					<td colspan="2">Si {{($informacion_personal['practicaDeporte'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['practicaDeporte'] ?? '') == 'No' ? 'X' : ''}}</td>
					<td colspan="9">{{$informacion_personal['deportes'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="22">¿Alguna vez ha obtenido distinciones o reconocimientos por su desempeño en
						actividades deportivas, culturales, sociales, etc.?</td>
				</tr>
				<tr>
					<td colspan="2">Si {{($informacion_personal['tuvoReconocimientos'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['tuvoReconocimientos'] ?? '') == 'No' ? 'X' : ''}}</td>
					<td colspan="2">¿Cuál(es)?</td>
					<td colspan="16">{{$informacion_personal['reconocimientos'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="22">¿Pertenece a algún tipo de asociación comunitaria, deportiva, cultural, etc.?</td>
				</tr>
				<tr>
					<td colspan="2">Si {{($informacion_personal['perteneceAsociaciones'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($informacion_personal['perteneceAsociaciones'] ?? '') == 'No' ? 'X' : ''}}</td>
					<td colspan="2">¿Cuál(es)?</td>
					<td colspan="16">{{$informacion_personal['asociaciones'] ?? ''}}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container">
		<table>
			<thead>
				<tr>
					<th colspan="20">OBJETIVO Mencione brevemente que expectativas tiene a nivel laboral, educativo y
						personal e indique como planea hacerlas realidad.</th>
				</tr>

			</thead>
			<tbody>
				@foreach($informacion_personal['objetivos'] ?? [] as $objetivo)
				<tr>
					<td colspan="20">{{ $objetivo }}</td>
				</tr>
				@endforeach

			</tbody>
		</table>
	</div>

	<hr>

	<div class="container">
		<h3>III. INFORMACION FAMILIAR</h3>
		<table>
			<tbody>
				<tr>
					<td colspan="7">Nombre esposa(o) o compañera(o)</td>
					<td colspan="7">Profesión, ocupación u oficio</td>
					<td colspan="6">Empresa donde trabaja</td>
				</tr>
				<tr>
					<td colspan="7">{{$informacion_familiar['nombre'] ?? ''}}</td>
					<td colspan="7">{{$informacion_familiar['profesion'] ?? ''}}</td>
					<td colspan="6">{{$informacion_familiar['empresa'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="6">Cargo actual</td>
					<td colspan="6">Dirección</td>
					<td colspan="4">Teléfono</td>
					<td colspan="4">Ciudad</td>
				</tr>
				<tr>
					<td colspan="6">{{$informacion_familiar['cargo'] ?? ''}}</td>
					<td colspan="6">{{$informacion_familiar['direccion'] ?? ''}}</td>
					<td colspan="4">{{$informacion_familiar['telefono'] ?? ''}}</td>
					<td colspan="4">{{$informacion_familiar['ciudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="6" rowspan="2">Nº de personas que dependen
		económicamente del solicitante: {{$informacion_familiar['numPersonas'] ?? ''}}</td>
					<td colspan="9">Parentesco</td>
					<td colspan="5">Edades</td>
				</tr>
				<tr>
					<td colspan="9">{{$informacion_familiar['parentescos'] ?? ''}}</td>
					<td colspan="5">{{$informacion_familiar['edades'] ?? ''}}</td>
				</tr>
				@foreach($informacion_familiar['padres'] ?? [] as $padre)
					<tr>
						<td colspan="7">Nombre(s) padre(s)</td>
						<td colspan="7">Profesión, ocupación u oficio</td>
						<td colspan="6">Teléfono(s)</td>
					</tr>
					<tr>
						<td colspan="7">{{$padre['nombres'] ?? ''}}</td>
						<td colspan="7">{{$padre['profesion'] ?? ''}}</td>
						<td colspan="6">{{$padre['telefono'] ?? ''}}</td>
					</tr>
				@endforeach

				@foreach($informacion_familiar['hermanos'] ?? [] as $hermano)
					<tr>
						<td colspan="7">Nombre(s) hermano(s)</td>
						<td colspan="7">Profesión, ocupación u oficio</td>
						<td colspan="6">Teléfono(s)</td>
					</tr>
					<tr>
						<td colspan="7">{{$hermano['nombres'] ?? ''}}</td>
						<td colspan="7">{{$hermano['profesion'] ?? ''}}</td>
						<td colspan="6">{{$hermano['telefono'] ?? ''}}</td>
					</tr>
				@endforeach
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<h3>IV. EDUCACION Y APTITUDES</h3>
		<table>
			<tbody>
				<tr>
					<td colspan="4">ESTUDIOS</td>
					<td colspan="3">AÑO DE FINALIZACION</td>
					<td colspan="2">AÑOS CURSADOS</td>
					<td colspan="5">TITULO OBTENIDO</td>
					<td colspan="6">NOMBRE DE LA INSTITUCION</td>
					<td colspan="3">CIUDAD</td>
				</tr>
				<tr>
					<td colspan="4">Primaria</td>
					<td colspan="3">{{$educacion_aptitudes['primariaAnoFinalizacion'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['primariaAnosCursados'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['primariaTitulo'] ?? ''}}</td>
					<td colspan="6">{{$educacion_aptitudes['primariaInstitucion'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['primariaCiudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4">Bachillerato: {{$educacion_aptitudes['bachilleratoSelect'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['bachilleratoAnoFinalizacion'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['bachilleratoAnosCursados'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['bachilleratoTitulo'] ?? ''}}</td>
					<td colspan="6">{{$educacion_aptitudes['bachilleratoInstitucion'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['bachilleratoCiudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4">Educación Superior: {{$educacion_aptitudes['educacionSuperiorSelect'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['educacionSuperiorAnoFinalizacion'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['educacionSuperiorAnosCursados'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['educacionSuperiorTitulo'] ?? ''}}</td>
					<td colspan="6">{{$educacion_aptitudes['educacionSuperiorInstitucion'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['educacionSuperiorCiudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4">Postgrados</td>
					<td colspan="3">{{$educacion_aptitudes['postgradosAnoFinalizacion'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['postgradosAnosCursados'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['postgradosTitulo'] ?? ''}}</td>
					<td colspan="6">{{$educacion_aptitudes['postgradosInstitucion'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['postgradosCiudad'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4" rowspan="2">Otros: cursos, diplomados, seminarios</td>
					<td colspan="4">Intensidad horaria</td>
					<td colspan="8">Nombre del programa</td>
					<td colspan="7">Institución</td>
				</tr>
				<tr>
					<td colspan="4">{{$educacion_aptitudes['intesidadHoraria'] ?? ''}}</td>
					<td colspan="8">{{$educacion_aptitudes['nombreDelPrograma'] ?? ''}}</td>
					<td colspan="7">{{$educacion_aptitudes['institucion'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="4">¿Cursa estudios actualmente?</td>
					<td colspan="9">¿Qué tipo de estudios?</td>
					<td colspan="5">Duración (años, semestres, meses)</td>
					<td colspan="5">Año / semestre que cursa</td>
				</tr>
				<tr>
					<td colspan="2">Si {{($educacion_aptitudes['cursaEstudios'] ?? '') == 'Si' ? 'X' : ''}}</td>
					<td colspan="2">No {{($educacion_aptitudes['cursaEstudios'] ?? '') == 'No' ? 'X' : ''}}</td>
					<td colspan="9">{{$educacion_aptitudes['tipoEstudios'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['duracionEstudios'] ?? ''}}</td>
					<td colspan="5">{{$educacion_aptitudes['semestreCursa'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="15">Nombre de la institución</td>
					<td colspan="8" rowspan="2">Horario {{$educacion_aptitudes['horario'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="15">{{$educacion_aptitudes['nombreInstitucion'] ?? ''}}</td>
				</tr>
				<tr>
					<th colspan="23">OTROS CONOCIMIENTOS: Indique el grado de dominio R- Regular, B- Bien, MB- Muy Bien</th>
				</tr>
				<tr>
					<td colspan="5">Sistemas {{($educacion_aptitudes['sistemas'] ?? '') == 'Si' ? 'Si: X No' : 'Si: No: X'}}</td>
					<td colspan="6">1. {{$educacion_aptitudes['programa1'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['nivelP1'] ?? ''}}</td>
					<td colspan="7">3. {{$educacion_aptitudes['programa3'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['nivelP3'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="5">¿Programa(s) que maneja?</td>
					<td colspan="6">2. {{$educacion_aptitudes['programa2'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['nivelP2'] ?? ''}}</td>
					<td colspan="7">4. {{$educacion_aptitudes['programa4'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['nivelP4'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="5">Idiomas</td>
					<td colspan="11"></td>
					<td colspan="2">Lectura</td>
					<td colspan="2">Escritura</td>
					<td colspan="3">Hablado</td>
				</tr>
				<tr>
					<td colspan="5">{{($educacion_aptitudes['idiomas'] ?? '') == 'Si' ? 'Si: X No' : 'Si: No: X'}}</td>
					<td colspan="11">1. {{$educacion_aptitudes['idioma1'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['lecturaI1'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['escrituraI1'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['habladoI1'] ?? ''}}</td>
				</tr>
				<tr>
					<td colspan="5">¿Qué idiomas(s) conoce?</td>
					<td colspan="11">2. {{$educacion_aptitudes['idioma2'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['lecturaI2'] ?? ''}}</td>
					<td colspan="2">{{$educacion_aptitudes['escrituraI2'] ?? ''}}</td>
					<td colspan="3">{{$educacion_aptitudes['habladoI2'] ?? ''}}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<h3>V. TRAYECTORIA POR EMPRESAS</h3>
	</div>

</body>
</html>