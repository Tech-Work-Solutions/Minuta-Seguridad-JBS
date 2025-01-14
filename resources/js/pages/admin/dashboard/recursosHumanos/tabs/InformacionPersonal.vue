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
                                Campo requerido.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿En qué empresa?</label>
                            <input
                                v-model="formData.empresa"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.empresa.required">
                                Campo requerido.
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
                                    />
                                    Empleado
                                </label>
                                <label>
                                    <input
                                        v-model="formData.estadoLaboral"
                                        type="radio"
                                        value="independiente"
                                        class="form-radio text-blue-600"
                                    />
                                    Independiente
                                </label>
                            </div>
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.estadoLaboral.required">
                                Campo requerido.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Tipo de contrato</label>
                            <input
                                v-model="formData.tipoContrato"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
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
                                        value="si"
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
                                        value="si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.solicitoEnLaEmpresa"
                                        type="radio"
                                        value="no"
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
                                        value="si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.recomendado"
                                        type="radio"
                                        value="no"
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
                                        value="si"
                                        class="form-radio text-blue-600"
                                    />
                                    Si
                                </label>
                                <label>
                                    <input
                                        v-model="formData.tieneParientes"
                                        type="radio"
                                        value="no"
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
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.dependenciaPariente.required">
                                Ingrese la dependencia de su pariente
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Cómo tuvo conocimiento de la existencia de la vacante?</label>
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
                                Campo requerido.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Cual?</label>
                            <input
                                v-model="formData.otroMedio"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.otroMedio.required">
                                Ingrese el medio por el cual se entero de la vacante
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
                                Ingrese el su residencia principal
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">¿Aceptaría trabajar en una ciudad o sitio distinto al inicialmente contratado?</label>
                            <div class="flex items-center space-x-4">
                                <label>
                                    <input
                                        v-model="formData.disponibleParaReubicacion"
                                        type="radio"
                                        value="si"
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
                                Campo requerido.
                            </p>
                        </div>               

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre del arrendador</label>
                            <input
                                v-model="formData.arrendador"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.arrendador.required">
                                Campo requerido.
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Teléfono del arrendador</label>
                            <input
                                v-model="formData.telefonoArrendador"
                                type="text"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefonoArrendador.required">
                                Campo requerido.
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
                                Campo requerido.
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
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.detalleIngresos.required">
                                Campo requerido.
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
                                Campo requerido.
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
                                Campo requerido.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-span-full">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <!-- Campo Aficiones -->
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
                                Campo requerido.
                            </p>
                        </div>

                        <!-- Campo ¿Practica algún deporte? -->
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

                        <!-- Campo ¿Cuál(es)? -->
                        <div class="md:col-span-2 lg:col-span-1">
                            <label class="block text-sm font-medium text-gray-600">
                                ¿Cuál(es)?
                            </label>
                            <input
                                v-model="formData.deportes"
                                type="text"
                                class="mt-1 px-3 py-2 border rounded-lg text-gray-700 focus:outline-none w-full"
                            />
                            <p class="text-red-500 text-sm" v-if="submited && !$v.formData.deportes.required">
                                Campo requerido.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-span-full">
                    <!-- Título y descripción -->
                    <label class="block text-sm font-medium text-gray-600 mb-2">
                        ¿Alguna vez ha obtenido distinciones o reconocimientos por su desempeño en actividades deportivas, culturales, sociales, etc.?
                    </label>

                    <!-- Contenedor para los radio buttons y el input -->
                    <div class="flex flex-col md:flex-row md:items-center md:gap-4">
                        <!-- Radio buttons (en móvil apilados y en desktop al lado del input) -->
                        <div class="flex flex-col md:flex-row md:mr-4">
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

                        <!-- Input (en desktop a la derecha de los radio buttons y en móviles abajo) -->
                        <input
                            v-model="formData.reconocimientos"
                            type="text"
                            placeholder="¿Cuál(es)?"
                            class="w-full mt-4 md:mt-0 px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                        />
                    </div>

                    <!-- Mensajes de error -->
                    <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.tuvoReconocimientos.required">
                        Elija una opción.
                    </p>
                    <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.reconocimientos.required">
                        Campo requerido.
                    </p>
                </div>

                
                <div class="col-span-full">
                    <label class="block text-sm font-medium text-gray-600 mb-2">
                        ¿Pertenece a algún tipo de asociación comunitaria, deportiva, cultural, etc.?
                    </label>
                    <div class="flex flex-col md:flex-row md:items-center md:gap-4">
                        <!-- Radio buttons alineados horizontalmente -->
                        <div class="flex flex-col md:flex-row md:mr-4">
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
                        <!-- Input "¿Cuál(es)?" ocupa el resto del espacio -->
                        <input
                            v-model="formData.asociaciones"
                            type="text"
                            placeholder="¿Cuál(es)?"
                            class="flex-grow px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                        />
                    </div>
                    <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.perteneceAsociaciones.required">
                        Elija una opción.
                    </p>
                    <p class="text-red-500 text-sm mt-2" v-if="submited && !$v.formData.asociaciones.required">
                        Campo requerido.
                    </p>               
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
                        <p class="text-red-500 text-sm" v-if="submited && !objetivo">
                            Campo requerido.
                        </p>
                    </div>
                </div>
            </div>

            <!-- Botón de enviar -->
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
            userId: null,
            spiner: false,
        };
    },
    async mounted() {
        const userObject = localStorage.getItem("user");
        if (userObject) {
            const user = JSON.parse(userObject);
            this.userId = user.id;
        }
        await this.loadData();
    },
    methods: {
        async handleSubmit() {
            this.submited = true;
            this.$v.$touch();

            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
                return;
            }

            const formData = new FormData();
            formData.append("user_id", this.userId);
            formData.append("informacion_personal", JSON.stringify(this.formData));

            try {
                await axios.post("/api/savePersonalInfo", formData);
                this.$toaster.success("Información guardada con éxito.");
            } catch (error) {
                console.error(error);
                this.$toaster.error("Hubo un problema al guardar los datos.");
            }
        },
        async loadData() {
            try {
                const response = await axios.get(`/api/getPersonalInfo`, {
                    params: { user_id: this.userId },
                });

                const savedData = response.data;

                if (savedData) {
                    Object.assign(this.formData, JSON.parse(savedData.informacion_personal));
                }
            } catch (error) {
                console.error(error);
                this.$toaster.error("Hubo un problema al cargar los datos.");
            }
        },
    },
    validations: {
        formData: {
            trabajandoActualmente: { required },
            empresa: { required },
            tipoContrato: { required },
            casaPropia: { required },
            arrendador: { required },
            telefonoArrendador: { required },
            objetivos: {
                $each: { required },
            },
            fuenteVacante: {required},
            estadoLaboral: {required},
            trabajoEnLaEmpresa: {required},
            solicitoEnLaEmpresa: {required},
            dia: {required},
            mes: {required},
            anio: {required},
            recomendado: {required},
            nombreRecomienda: {required},
            dependenciaRecomienda: {required},
            tieneParientes: {required},
            nombrePariente: {required},
            dependenciaPariente: {required},
            fuenteVacante: {required},
            otroMedio: {required},
            residenciaPrincipal: {required},
            zonasDeTrabajo: {required},
            disponibleParaReubicacion: {required},
            casaPropia: {required},
            tiempoEnVivienda: {required},
            ingresoAdicional: {required},
            detalleIngresos: {required},
            totalObligaciones: {required},
            conceptoObligaciones: {required},
            aspiracionSalarial: {required},
            aficiones: {required},
            practicaDeporte: {required},
            deportes: {required},
            tuvoReconocimientos: {required},
            reconocimientos: {required},
            perteneceAsociaciones: {required},
            asociaciones: {required},
        },
    },
};
</script>
