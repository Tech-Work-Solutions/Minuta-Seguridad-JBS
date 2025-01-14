<template>
    <div class="p-6 bg-gray-100">
        <form @submit.prevent="handleSubmit">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Está trabajando actualmente?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.trabajandoActualmente"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.trabajandoActualmente"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.trabajandoActualmente.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿En qué empresa?</label>
                            <input
                                v-model="formData.empresa"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.trabajandoActualmente === 'No'||!formData.trabajandoActualmente"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.empresa.required">
                                Ingrese el nombre de la empresa.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Estado laboral</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.estadoLaboral"
                                        type="radio"
                                        value="empleado"
                                        class="form-radio text-blue-600"
                                        :disabled="formData.trabajandoActualmente === 'No'||!formData.trabajandoActualmente"
                                    />
                                    Empleado
                                </label>
                                <label>
                                    <input
                                        v-model="formData.estadoLaboral"
                                        type="radio"
                                        value="independiente"
                                        class="form-radio text-blue-600"
                                        :disabled="formData.trabajandoActualmente === 'No'||!formData.trabajandoActualmente"
                                    />
                                    Independiente
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.estadoLaboral.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Tipo de contrato</label>
                            <input
                                v-model="formData.tipoContrato"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.trabajandoActualmente === 'No'||!formData.trabajandoActualmente"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipoContrato.required">
                                Ingrese el tipo de contrato
                            </p>
                        </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Trabajó antes en esta empresa?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.trabajoEnLaEmpresa"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.trabajoEnLaEmpresa"
                                        type="radio"
                                        value="no"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.trabajoEnLaEmpresa.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Solicitó empleo antes en esta empresa? </label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.solicitoEnLaEmpresa"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.solicitoEnLaEmpresa"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.solicitoEnLaEmpresa.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Fecha:</label>
                            <div class="flex space-x-2">
                                <div class="w-1/3">
                                    <input
                                        v-model="formData.dia"
                                        type="number"
                                        placeholder="Día"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                        :disabled="formData.solicitoEnLaEmpresa === 'No'||!formData.solicitoEnLaEmpresa"
                                    />
                                    <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.dia.required">
                                        Ingrese el día
                                    </p>
                                </div>
                                <div class="w-1/3">
                                    <input
                                        v-model="formData.mes"
                                        type="number"
                                        placeholder="Mes"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                        :disabled="formData.solicitoEnLaEmpresa === 'No'||!formData.solicitoEnLaEmpresa"
                                    />
                                    <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.mes.required">
                                        Ingrese el mes
                                    </p>
                                </div>
                                <div class="w-1/3">
                                    <input
                                        v-model="formData.anio"
                                        type="number"
                                        placeholder="Año"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                        :disabled="formData.solicitoEnLaEmpresa === 'No'||!formData.solicitoEnLaEmpresa"
                                    />
                                    <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.anio.required">
                                        Ingrese el año
                                    </p>
                                </div>
                            </div>
                        </div>
                       
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Lo recomienda alguien de esta empresa?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.recomendado"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.recomendado"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.recomendado.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre de quien lo recomienda</label>
                            <input
                                v-model="formData.nombreRecomienda"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.recomendado === 'No'||!formData.recomendado"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombreRecomienda.required">
                                Ingrese el nombre de quien lo recomienda
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Dependencia de quien lo recomienda</label>
                            <input
                                v-model="formData.dependenciaRecomienda"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.recomendado === 'No'||!formData.recomendado"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.dependenciaRecomienda.required">
                                Ingrese la dependencia de quien lo recomienda
                            </p>
                        </div>
                    </div>
                </div>  
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Tiene parientes que trabajan en esta empresa?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.tieneParientes"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.tieneParientes"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tieneParientes.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre del pariente</label>
                            <input
                                v-model="formData.nombrePariente"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.tieneParientes === 'No'||!formData.tieneParientes"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombrePariente.required">
                                Ingrese el nombre de su pariente
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Dependencia del pariente</label>
                            <input
                                v-model="formData.dependenciaPariente"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.tieneParientes === 'No'||!formData.tieneParientes"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.dependenciaPariente.required">
                                Ingrese la dependencia de su pariente
                            </p>
                        </div>                       
                    </div>
                </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-3 items-start">
                        <div class="md:col-span-1">
                            <label class="block text-sm font-medium text-gray-600">
                                ¿Cómo tuvo conocimiento de la vacante?
                            </label>
                            <select
                                v-model="formData.fuenteVacante"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            >
                                <option value="">Seleccione</option>
                                <option value="Anuncio">Anuncio</option>
                                <option value="Amigo">Amigo</option>
                                <option value="Agencia">Por medio de agencia</option>
                                <option value="Otro">Otro</option>
                            </select>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fuenteVacante.required">
                                Elija una opción.
                            </p>
                        </div>

                        <!-- Campo de texto -->
                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">¿Cuál?</label>
                            <input
                                v-model="formData.otroMedio"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="!formData.fuenteVacante||formData.fuenteVacante !== 'Otro'"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.otroMedio.required">
                                Ingrese el medio por el cual se enteró de la vacante
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿En qué ciudad o población ha vivido la mayor parte de su vida?</label>
                            <input
                                v-model="formData.residenciaPrincipal"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.residenciaPrincipal.required">
                                Ingrese el su residencia principal
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿En qué ciudades o regiones del país ha <br> trabajado?</label>
                            <input
                                v-model="formData.zonasDeTrabajo"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.zonasDeTrabajo.required">
                                Ingrese las ciudades
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Aceptaría trabajar en una ciudad o sitio distinto al inicialmente contratado?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.disponibleParaReubicacion"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.disponibleParaReubicacion"
                                        type="radio"
                                        value="no"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.disponibleParaReubicacion.required">
                                Elija una opción.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">Vive en casa</label>
                            <select
                                v-model="formData.casaPropia"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            >
                                <option value="">Seleccione</option>
                                <option value="Familiar">Familiar</option>
                                <option value="Propia">Propia</option>
                                <option value="Alquilada">Alquilada</option>
                            </select>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.casaPropia.required">
                                Elija una opción. 
                            </p>
                        </div>               

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre del arrendador</label>
                            <input
                                v-model="formData.arrendador"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="!formData.casaPropia||formData.casaPropia !== 'Alquilada'"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.arrendador.required">
                                Ingrese el nombre del arrendador.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Teléfono del arrendador</label>
                            <input
                                v-model="formData.telefonoArrendador"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="!formData.casaPropia||formData.casaPropia !== 'Alquilada'"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefonoArrendador.required">
                                Ingrese el telefono del arrendador.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Hace cuánto tiempo reside ahi?</label>
                            <input
                                v-model="formData.tiempoEnVivienda"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tiempoEnVivienda.required">
                                Ingrese el tiempo en la vivienda.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Actualmente tiene algún ingreso adicional? </label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.ingresoAdicional"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.ingresoAdicional"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    No
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ingresoAdicional.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Descríbalo e indique su valor mensual </label>
                            <input
                                v-model="formData.detalleIngresos"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.ingresoAdicional === 'No'||!formData.ingresoAdicional"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.detalleIngresos.required">
                                Ingrese la descripción.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Cuánto suman sus obligaciones económicas mensuales</label>
                            <input
                                v-model="formData.totalObligaciones"
                                type="number"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.totalObligaciones.required">
                                Ingrese el valor de sus obligaciones.
                            </p>
                        </div>
                    </div>
                </div>        
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Por qué conceptos?</label>
                            <input
                                v-model="formData.conceptoObligaciones"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.ingresoAdicional === 'No'||!formData.ingresoAdicional"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.conceptoObligaciones.required">
                                Campo requerido.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Cuánto es su aspiración salarial?</label>
                            <input
                                v-model="formData.aspiracionSalarial"
                                type="number"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.aspiracionSalarial.required">
                                Ingrese su aspiración salarial.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <div class="md:col-span-2 lg:col-span-1">
                            <label class="block text-sm font-medium text-gray-600">
                                ¿Cuál(es) es(son) su(s) principal(es) afición(es)?
                            </label>
                            <input
                                v-model="formData.aficiones"
                                type="text"
                                class="mt-1 px-3 py-2 border rounded-lg text-gray-700 focus:outline-none w-full"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.aficiones.required">
                                Ingrese sus aficiones.
                            </p>
                        </div>
                        <div class="md:col-span-1 lg:col-span-1">
                            <label class="block text-sm font-medium text-gray-600">
                                ¿Practica algún deporte?
                            </label>
                            <div class="flex items-center space-x-4 mt-1">
                                <label class="flex items-center">
                                    <input
                                        v-model="formData.practicaDeporte"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                    />
                                    <span class="ml-2">Si</span>
                                </label>
                                <label class="flex items-center">
                                    <input
                                        v-model="formData.practicaDeporte"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                    />
                                    <span class="ml-2">No</span>
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.practicaDeporte.required">
                                Elija una opción.
                            </p>
                        </div>

                        <div class="md:col-span-2 lg:col-span-1">
                            <label class="block text-sm font-medium text-gray-600">
                                ¿Cuál(es)?
                            </label>
                            <input
                                v-model="formData.deportes"
                                type="text"
                                class="mt-1 px-3 py-2 border rounded-lg text-gray-700 focus:outline-none w-full"
                                :disabled="formData.practicaDeporte === 'No'||!formData.practicaDeporte"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.deportes.required">
                                Campo requerido.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-span-full">
                    <label class="block text-sm font-medium text-gray-600 mb-2">
                        ¿Alguna vez ha obtenido distinciones o reconocimientos por su desempeño en actividades deportivas, culturales, sociales, etc.?
                    </label>
                    <div class="flex flex-col md:flex-row md:items-start md:gap-4">
                        <div class="flex flex-col">
                            <div class="flex flex-col md:flex-row md:items-center md:mr-4">
                                <label class="flex items-center space-x-2 mb-2 md:mb-0">
                                    <input
                                        v-model="formData.tuvoReconocimientos"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                        name="tuvoReconocimientos"
                                    />
                                    <span>Si</span>
                                </label>
                                <label class="flex items-center space-x-2 lg:ml-4">
                                    <input
                                        v-model="formData.tuvoReconocimientos"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                        name="tuvoReconocimientos"
                                    />
                                    <span>No</span>
                                </label>
                            </div>
                            <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.tuvoReconocimientos.required">
                                Elija una opción.
                            </p>
                        </div>
                        <div class="flex-1">
                            <input
                                v-model="formData.reconocimientos"
                                type="text"
                                placeholder="¿Cuál(es)?"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.tuvoReconocimientos === 'No'||!formData.tuvoReconocimientos"
                            />
                            <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.reconocimientos.required">
                                Campo requerido.
                            </p>
                        </div>
                    </div>
                </div>                
                <div class="col-span-full">
                    <label class="block text-sm font-medium text-gray-600 mb-2">
                        ¿Pertenece a algún tipo de asociación comunitaria, deportiva, cultural, etc.?
                    </label>
                    <div class="flex flex-col md:flex-row md:items-start md:gap-4">
                        <div class="flex flex-col">
                            <div class="flex flex-col md:flex-row md:items-center md:mr-4">
                                <label class="flex items-center space-x-2 mb-2 md:mb-0">
                                    <input
                                        v-model="formData.perteneceAsociaciones"
                                        type="radio"
                                        value="Si"
                                        class="form-radio text-blue-600"
                                        name="perteneceAsociaciones"
                                    />
                                    <span>Si</span>
                                </label>
                                <label class="flex items-center space-x-2 lg:ml-4">
                                    <input
                                        v-model="formData.perteneceAsociaciones"
                                        type="radio"
                                        value="No"
                                        class="form-radio text-blue-600"
                                        name="perteneceAsociaciones"
                                    />
                                    <span>No</span>
                                </label>
                            </div>
                            <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.perteneceAsociaciones.required">
                                Elija una opción.
                            </p>
                        </div>
                        <div class="flex-1">
                            <input
                                v-model="formData.asociaciones"
                                type="text"
                                placeholder="¿Cuál(es)?"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                                :disabled="formData.perteneceAsociaciones === 'No'||!formData.perteneceAsociaciones"
                            />                
                            <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.asociaciones.required">
                                Campo requerido.
                            </p> 
                        </div>
                    </div>              
                </div>                

                <div class="col-span-full">
                    <div class="flex items-center space-x-2">
                        <h2 class="text-lg font-bold text-gray-700">OBJETIVOS</h2>
                        <p class="text-base text-gray-600">Mencione brevemente que expectativas tiene a nivel laboral, educativo y personal e indique como planea hacerlas realidad</p>
                    </div>
                    <div v-for="(objetivo, index) in formData.objetivos" :key="index" class="mb-4">                        
                        <input
                            v-model="formData.objetivos[index]"
                            type="text"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                        />                        
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && $v.formData.objetivos.$error">
                        Debe agregar al menos un objetivo.
                    </p>
                </div>
            </div>
            <div class="flex mb-4 mt-5">
                <button
                    class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                    type="submit"
                >
                    <p v-if="!spiner && !isUpdating">Guardar</p>
                    <p v-else-if="!spiner && isUpdating">Actualizar</p>
                    <p v-else-if="spiner && !isUpdating"><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                    <p v-else><em class="fas fa-spinner fa-pulse"></em> Actualizando...</p>
                </button>
            </div>
        </form>
    </div>
</template>

<script>
import { required } from "vuelidate/lib/validators";

export default {
    props: {
        informacion_personal: {
            type: Object,
            default: () => ({}),
        },        
        userId: {
            type: Number,
            default: 0,
        },
        hasHv: {
            type: Boolean,
            default: false,
        },
    },
    data() {
        return {
            formData: {
                casaPropia: "",
                fuenteVacante: "",
                trabajandoActualmente: "",
                estadoLaboral: "",
                empresa: "",
                trabajoEnLaEmpresa: "",
                solicitoEnLaEmpresa: "",
                dia: "",
                mes: "",
                anio: "",
                recomendado: "",
                nombreRecomienda: "",
                dependenciaRecomienda: "",
                tieneParientes: "",
                nombrePariente: "",
                dependenciaPariente: "",
                fuenteVacante: "",
                otroMedio: "",
                residenciaPrincipal: "",
                zonasDeTrabajo: "",
                disponibleParaReubicacion: "",
                arrendador: "",
                telefonoArrendador: "",
                tiempoEnVivienda: "",
                ingresoAdicional: "",
                detalleIngresos: "",
                totalObligaciones: "",
                conceptoObligaciones: "",
                aspiracionSalarial: "",
                aficiones: "",
                practicaDeporte: "",
                deportes: "",
                tuvoReconocimientos: "",
                reconocimientos: "",
                perteneceAsociaciones: "",
                asociaciones: "",
                objetivos: ["", "", ""],
                tipoContrato: ""
            },
            submited: false,
            isUpdating: false,
            userId: null,
            spiner: false,
        };
    },
    async mounted() {        
        this.spiner = false;
        await this.loadData();
    },
    methods: {
        async handleSubmit() {
            try {
                if (!this.validarDatos()) {
                    return;
                }
                this.spiner = true;
                const formData = new FormData();

                formData.append("user_id", this.userId);
                formData.append("informacion_personal", JSON.stringify({
                    casaPropia: this.formData.casaPropia,
                    fuenteVacante: this.formData.fuenteVacante,
                    trabajandoActualmente: this.formData.trabajandoActualmente,
                    estadoLaboral: this.formData.estadoLaboral,
                    empresa: this.formData.empresa,
                    trabajoEnLaEmpresa: this.formData.trabajoEnLaEmpresa,
                    solicitoEnLaEmpresa: this.formData.solicitoEnLaEmpresa,
                    dia: this.formData.dia,
                    mes: this.formData.mes,
                    anio: this.formData.anio,
                    recomendado: this.formData.recomendado,
                    nombreRecomienda: this.formData.nombreRecomienda,
                    dependenciaRecomienda: this.formData.dependenciaRecomienda,
                    tieneParientes: this.formData.tieneParientes,
                    nombrePariente: this.formData.nombrePariente,
                    dependenciaPariente: this.formData.dependenciaPariente,
                    fuenteVacante: this.formData.fuenteVacante,
                    residenciaPrincipal: this.formData.residenciaPrincipal,
                    zonasDeTrabajo: this.formData.zonasDeTrabajo,
                    disponibleParaReubicacion: this.formData.disponibleParaReubicacion,
                    arrendador: this.formData.arrendador,
                    telefonoArrendador: this.formData.telefonoArrendador,
                    tiempoEnVivienda: this.formData.tiempoEnVivienda,
                    ingresoAdicional: this.formData.ingresoAdicional,
                    detalleIngresos: this.formData.detalleIngresos,
                    totalObligaciones: this.formData.totalObligaciones,
                    conceptoObligaciones: this.formData.conceptoObligaciones,
                    aspiracionSalarial: this.formData.aspiracionSalarial,
                    aficiones: this.formData.aficiones,
                    practicaDeporte: this.formData.practicaDeporte,
                    deportes: this.formData.deportes,
                    tuvoReconocimientos: this.formData.tuvoReconocimientos,
                    reconocimientos: this.formData.reconocimientos,
                    perteneceAsociaciones: this.formData.perteneceAsociaciones,
                    asociaciones: this.formData.asociaciones,
                    objetivos: this.formData.objetivos,
                    tipoContrato: this.formData.tipoContrato
                }));

                if (this.isUpdating) {
                    await axios.post("/api/updateHv", formData);
                    this.spiner = false;
                    this.submited = false;
                    this.$toaster.success("Datos actualizados con éxito.");
                } else {
                    await axios.post("/api/registerHv", formData);
                    this.isUpdating = true;
                    this.spiner = false;
                    this.submited = false;
                    this.$toaster.success("Datos registrados con éxito.");
                }

            } catch (error) {
                this.spiner = false;
                console.error(error);
                this.$toaster.error("Hubo un problema al guardar los datos.");
            }
        },
        async loadData() {

            if (this.informacion_personal && Object.keys(this.informacion_personal).length > 0 && this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.informacion_personal);
            }

            if (this.formData.fuenteVacante && this.formData.fuenteVacante === 'Agencia') {
                this.formData.fuenteVacante = "por medio de agencia"
            }

        },

        validarDatos() {
            this.submited = true;
            this.$v.$touch();

            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
                return false;
            }

            return true;
        },
    },
    validations: {
        formData: {
            trabajandoActualmente: { required },
            empresa: {
                required: (value, formData) => formData.trabajandoActualmente === 'Si' ? !!value : true,
            },
            tipoContrato: {
                required: (value, formData) => formData.trabajandoActualmente === 'Si' ? !!value : true,
            },
            estadoLaboral: {
                required: (value, formData) => formData.trabajandoActualmente === 'Si' ? !!value : true,
            },
            trabajoEnLaEmpresa: {required},
            solicitoEnLaEmpresa: {required},
            dia: {
                required: (value, formData) => formData.solicitoEnLaEmpresa === 'Si' ? !!value : true,
            },
            mes: {
                required: (value, formData) => formData.solicitoEnLaEmpresa === 'Si' ? !!value : true,
            },
            anio: {
                required: (value, formData) => formData.solicitoEnLaEmpresa === 'Si' ? !!value : true,
            },
            recomendado: {required},
            nombreRecomienda: {
                required: (value, formData) => formData.recomendado === 'Si' ? !!value : true,
            },
            dependenciaRecomienda: {
                required: (value, formData) => formData.recomendado === 'Si' ? !!value : true,
            },
            tieneParientes: {required},
            nombrePariente: {
                required: (value, formData) => formData.tieneParientes === 'Si' ? !!value : true,
            },
            dependenciaPariente: {
                required: (value, formData) => formData.tieneParientes === 'Si' ? !!value : true,
            },
            fuenteVacante: {required},            
            otroMedio: {
                required: (value, formData) => formData.fuenteVacante === 'Otro' ? !!value : true,
            },
            residenciaPrincipal: {required},
            zonasDeTrabajo: {required},
            disponibleParaReubicacion: {required},
            casaPropia: { required },
            arrendador: {
                required: (value, formData) => formData.casaPropia === 'Alquilada' ? !!value : true,
            },
            telefonoArrendador: {
                required: (value, formData) => formData.casaPropia === 'Alquilada' ? !!value : true,
            },
            tiempoEnVivienda: {required},          
            ingresoAdicional: {required},
            detalleIngresos: {
                required: (value, formData) => formData.ingresoAdicional === 'Si' ? !!value : true,
            },
            totalObligaciones: {required},
            conceptoObligaciones: {
                required: (value, formData) => formData.ingresoAdicional === 'Si' ? !!value : true,
            },
            aspiracionSalarial: {required},
            aficiones: {required},
            practicaDeporte: {required},
            deportes: {
                required: (value, formData) => formData.practicaDeporte === 'Si' ? !!value : true,
            },
            tuvoReconocimientos: {required},
            reconocimientos: {
                required: (value, formData) => formData.tuvoReconocimientos === 'Si' ? !!value : true,
            },
            perteneceAsociaciones: {required},
            asociaciones: {
                required: (value, formData) => formData.perteneceAsociaciones === 'Si' ? !!value : true,
            },
            objetivos: {
                atLeastOneRequired: (value) =>
                    Array.isArray(value) && value.some((objetivo) => objetivo.trim() !== ""),
            },
        },
    },
};
</script>
