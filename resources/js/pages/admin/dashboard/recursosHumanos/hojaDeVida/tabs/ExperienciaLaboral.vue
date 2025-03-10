<template>
    <div class="p-8 bg-gray-100">
        <label class="block text-sm font-medium text-gray-400 mb-4">FAVOR RELACIONAR LOS ULTIMOS TRES EMPLEOS QUE USTED
            HA DESEMPEÑADO, COMENZANDO POR EL ULTIMO O ACTUAL. SI NECESITA DAR MAS
            DETALLES UTILICE UNA HOJA POR SEPARADO. ESTOS DATOS SERAN VERIFICADOS Y SU MANEJO SERA CONFIDENCIAL</label>
        <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
            <div v-for="(section, index) in formData.secciones" :key="index"
                class="mb-8 p-6 border border-gray-300 rounded-lg bg-gray-50">
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4">
                    <div class="sm:col-span-6">
                        <label class="block text-sm font-medium text-gray-600">Nombre de la última o actual
                            empresa</label>
                        <input v-model="section.nombreEmpresa" type="text"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                    </div>

                    <div class="sm:col-span-3">
                        <label class="block text-sm font-medium text-gray-600">Dirección</label>
                        <input v-model="section.direccion" type="text" placeholder="Dirección"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].direccion.required">
                            Ingrese la dirección
                        </p>
                    </div>

                    <div class="sm:col-span-3">
                        <label class="block text-sm font-medium text-gray-600">Teléfono(s)</label>
                        <input v-model="section.telefono" type="number" placeholder="Teléfono"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].telefono.required">
                            Ingrese el teléfono.
                        </p>
                    </div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-4 gap-4 mt-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Cargo</label>
                        <input v-model="section.cargo" type="text" placeholder="Cargo"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].cargo.required">
                            Ingrese el cargo
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">Nombre de su jefe inmediato</label>
                        <input v-model="section.jefeInmediato" type="text" placeholder="Jefe Inmediato"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].jefeInmediato.required">
                            Ingrese su jefe inmediato
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">Fecha de ingreso</label>
                        <input v-model="section.fechaIngreso" type="date" placeholder="Fecha Ingreso"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].fechaIngreso.required">
                            Ingrese la fecha de ingreso
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">Fecha de retiro</label>
                        <input v-model="section.fechaRetiro" type="date" placeholder="Fecha de Retiro"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-4 gap-4 mt-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Total tiempo servido</label>
                        <input v-model="section.tiempoServido" type="text" placeholder="Tiempo Servido"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">Sueldo inicial</label>
                        <input v-model="section.sueldoInicial" type="number" placeholder="Sueldo Inicial"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].sueldoInicial.required">
                            Ingrese el sueldo inicial
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">Sueldo final o actual</label>
                        <input v-model="section.sueldoFinal" type="number" placeholder="Sueldo final"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].sueldoFinal.required">
                            Ingrese el sueldo final o actual
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Cargo(s) desempeñado(s) por usted</label>
                        <input v-model="section.cargoDesempeñado" type="text" placeholder="Cargo(s) desempeñado(s)"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].cargoDesempeñado.required">
                            Ingrese el cargo desempeñado
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-6">
                    <div class="sm:col-span-12">
                        <label class="block text-sm font-medium text-gray-600">Funciones realizadas</label>
                        <input v-model="section.funcionesRealizadas" type="text" placeholder="Funciones realizadas"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].funcionesRealizadas.required">
                            Ingrese las funciones realizadas
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-6">
                    <div class="sm:col-span-12">
                        <label class="block text-sm font-medium text-gray-600">Logros obtenidos</label>
                        <input v-model="section.logrosObtenidos" type="text" placeholder="Logros obtenidos"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].logrosObtenidos.required">
                            Ingrese los logros obtenidos.
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mt-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Tipo de contrato</label>
                        <select v-model="section.tipoContrato"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                            <option value="">Seleccione...</option>
                            <option value="Indefinido">Indefinido</option>
                            <option value="Fijo">Fijo</option>
                            <option value="Directo">Contrato directo con la empresa</option>
                            <option value="Agencia">Contrato por medio de agencia</option>
                            <option value="Otro">Otro</option>
                        </select>
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].tipoContrato.required">
                            Seleccione una opción.
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">¿Cuanto tiempo?</label>
                        <input v-model="section.cuantoTiempo" type="text" placeholder="Cuanto tiempo"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="section.tipoContrato !== 'Fijo'" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].cuantoTiempo.required">
                            Ingrese el tiempo.
                        </p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-600">¿Cuál?</label>
                        <input v-model="section.cual" type="text" placeholder="Cuál"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="section.tipoContrato !== 'Otro'" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].cual.required">
                            Ingrese el tipo de contrato.
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-6">
                    <div class="sm:col-span-6">
                        <label class="block text-sm font-medium text-gray-600">Horario de trabajo:</label>
                        <select v-model="section.horarioTrabajo"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                            <option value="">Seleccione...</option>
                            <option value="Completo">Tiempo completo</option>
                            <option value="Medio Tiempo">½ Tiempo</option>
                            <option value="Horas">Por horas</option>
                        </select>
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].horarioTrabajo.required">
                            Seleccione una opción.
                        </p>
                    </div>
                    <div class="sm:col-span-6">
                        <label class="block text-sm font-medium text-gray-600">Jornada:</label>
                        <select v-model="section.jornadaTrabajo"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                            <option value="">Seleccione...</option>
                            <option value="Diurna">Diurna</option>
                            <option value="Nocturna">Nocturna</option>
                            <option value="otra">Otra jornada</option>
                        </select>
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.secciones.$each[index].jornadaTrabajo.required">
                            Seleccione una opción.
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-6">
                    <div class="sm:col-span-12">
                        <label class="block text-sm font-medium text-gray-600">Motivo del retiro</label>
                        <input v-model="section.motivoRetiro" type="text" placeholder="Motivo del retiro"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-6">
                    <div class="sm:col-span-12">
                        <label class="block text-sm font-medium text-gray-600">Verificación (Espacio exclusivo para el
                            entrevistador)</label>
                        <input v-model="section.verificacion" type="text" placeholder="Verificación"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring" />
                    </div>
                </div>
            </div>
            <div class="p-4 border-t border-gray-300">
                <label class="block text-sm font-medium text-gray-600 mt-6">
                    INFORMACIÓN DE SEGURIDAD SOCIAL (Relacione las entidades a las que actualmente está afiliado)
                </label>

                <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mt-6">
                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Entidad promotora de salud (EPS)?
                        </label>
                        <div class="flex space-x-2">
                            <label>
                                <input type="radio" v-model="formData.entidadPromotora" value="Si" class="mr-2" /> Si
                            </label>
                            <label class="ml-4">
                                <input type="radio" v-model="formData.entidadPromotora" value="No" class="mr-2" /> No
                            </label>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.entidadPromotora.required">
                            Seleccione una opción.
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Cuál?
                        </label>
                        <input v-model="formData.cualEntidad" type="text" placeholder="Cual"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.entidadPromotora !== 'Si'" />
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cualEntidad.required">
                            Ingrese la entidad promotora
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            Fecha de afiliación
                        </label>
                        <input v-model="formData.fechaAfiliacion" type="date" placeholder="Fecha de afiliación"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.entidadPromotora !== 'Si'" />
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fechaAfiliacion.required">
                            Ingrese la fecha de afiliación
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            Tipo de afiliado
                        </label>
                        <div class="flex space-x-2">
                            <label>
                                <input type="radio" v-model="formData.tipoAfiliado" value="Cotizante" class="mr-2"
                                    :disabled="formData.entidadPromotora !== 'Si'" /> Cotizante
                            </label>
                            <label class="ml-4">
                                <input type="radio" v-model="formData.tipoAfiliado" value="Beneficiario" class="mr-2"
                                    :disabled="formData.entidadPromotora !== 'Si'" /> Beneficiario
                            </label>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipoAfiliado.required">
                            Seleccione una opción.
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Fondo de pensiones?
                        </label>
                        <div class="flex space-x-2">
                            <label>
                                <input type="radio" v-model="formData.fondoPensiones" value="Si" class="mr-2" /> Si
                            </label>
                            <label class="ml-4">
                                <input type="radio" v-model="formData.fondoPensiones" value="No" class="mr-2" /> No
                            </label>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fondoPensiones.required">
                            Seleccione una opción.
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Cuál?
                        </label>
                        <input v-model="formData.cualFondo" type="text" placeholder="Cual"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.fondoPensiones !== 'Si'" />
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cualFondo.required">
                            Ingrese el fondo de pensiones.
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            Fecha de afiliación
                        </label>
                        <input v-model="formData.fechaAfiliacionFondo" type="date" placeholder="Fecha de afiliación"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.fondoPensiones !== 'Si'" />
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fechaAfiliacionFondo.required">
                            Ingrese la fecha de afiliación al fondo
                        </p>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Fondo de cesantías?
                        </label>
                        <div class="flex space-x-2">
                            <label>
                                <input type="radio" v-model="formData.fondoCesantias" value="Si" class="mr-2" /> Si
                            </label>
                            <label class="ml-4">
                                <input type="radio" v-model="formData.fondoCesantias" value="No" class="mr-2" /> No
                            </label>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fondoCesantias.required">
                            Seleccione una opción.
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            ¿Cuál?
                        </label>
                        <input v-model="formData.cualFondoCesantias" type="text" placeholder="Cual"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.fondoCesantias !== 'Si'" />
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cualFondoCesantias.required">
                            Ingrese el fondo de cesantías.
                        </p>
                    </div>

                    <div class="overflow-x-auto flex flex-col justify-center h-full">
                        <label class="block text-sm font-medium text-gray-600">
                            Fecha de afiliación
                        </label>
                        <input v-model="formData.fechaAfiliacionCesantias" type="date" placeholder="Fecha de afiliación"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring"
                            :disabled="formData.fondoCesantias !== 'Si'" />
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.fechaAfiliacionCesantias.required">
                            Ingrese la fecha de afiliación al fondo de cesantías.
                        </p>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label class="block font-medium text-gray-700">Soportes</label>
                <div :class="{ 'mt-4': formData.soportesPreview, 'mt-2': !formData.soportesPreview }" class="h-auto">
                    <label
                        class="h-10 border rounded-lg bg-gray-100 flex flex-col justify-center items-center cursor-pointer relative mb-4">
                        <span class="text-sm text-gray-500">Soportes</span>

                        <input type="file" accept="application/pdf" @change="handleFileUpload" class="hidden" />
                    </label>
                    <iframe v-if="formData.soportesPreview" :src="formData.soportesPreview"
                        class="w-full rounded-lg mb-4" style="height: 300px;"></iframe>

                </div>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.soportes.required">
                    Carge un archivo pdf con todos los soportes.
                </p>
            </div>

            <div :class="{ 'mt-4': formData.soportesPreview, 'mt-2': !formData.soportesPreview }" class="flex mb-4"
                v-if="canEditHv">
                <button
                    class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                    type="submit">
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
import { SECTIONS } from '../../../../../../constants';
import { EventBus } from '../../../../../../utils/util.js';

export default {
    props: {
        experiencia_laboral: {
            type: Object,
            default: () => ({}),
        },
        soportes: {
            type: String,
            default: '',
        },
        userId: {
            type: Number,
            default: 0,
        },
        hasHv: {
            type: Boolean,
            default: false,
        },
        canEditHv: {
            type: Boolean,
            default: false,
        },
    },

    data() {
        return {
            formData: {
                secciones: SECTIONS,
                soportes: null,
                soportesPreview: null,
            },
            submited: false,
            isUpdating: false,
            spiner: false,
            entidadPromotora: "",
            cualEntidad: "",
            fechaAfiliacion: "",
            tipoAfiliado: "",
            fondoPensiones: "",
            cualFondo: "",
            fechaAfiliacionFondo: "",
            fondoCesantias: "",
            cualFondoCesantias: "",
            fechaAfiliacionCesantias: ""
        };
    },

    watch: {
        "formData.entidadPromotora"(newValue) {
            if (newValue === "No") {
                this.formData.cualEntidad = "";
                this.formData.fechaAfiliacion = "";
                this.formData.tipoAfiliado = "";
            }
        },
        "formData.fondoPensiones"(newValue) {
            if (newValue === "No") {
                this.formData.cualFondo = "";
                this.formData.fechaAfiliacionFondo = "";
            }
        },
        "formData.fondoCesantias"(newValue) {
            if (newValue === "No") {
                this.formData.cualFondoCesantias = "";
                this.formData.fechaAfiliacionCesantias = "";
            }
        },
        "formData.secciones": {
            deep: true,
            handler(newSections) {
                newSections.forEach((section) => {
                    if (section.tipoContrato !== "Fijo") {
                        section.cuantoTiempo = "";
                    }
                    if (section.tipoContrato !== "Otro") {
                        section.cual = "";
                    }
                });
            },
        },
    },
    created() {
        EventBus.$on('alreadyHasHv', (value) => {
            this.isUpdating = value || this.hasHv;
        });
    },
    beforeDestroy() {
        EventBus.$off('alreadyHasHv');
    },
    async mounted() {
        this.spiner = false;
        await this.loadData();
    },

    methods: {
        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                this.formData.soportes = file;
                this.formData.soportesPreview = URL.createObjectURL(file);
            }
        },

        async handleSubmit() {
            try {
                if (!this.validarDatos()) {
                    return;
                }
                this.spiner = true;
                const formData = new FormData();

                formData.append("user_id", this.userId);
                formData.append("experiencia_laboral", JSON.stringify({
                    secciones: this.formData.secciones,
                    entidadPromotora: this.formData.entidadPromotora,
                    cualEntidad: this.formData.cualEntidad,
                    fechaAfiliacion: this.formData.fechaAfiliacion,
                    tipoAfiliado: this.formData.tipoAfiliado,
                    fondoPensiones: this.formData.fondoPensiones,
                    cualFondo: this.formData.cualFondo,
                    fechaAfiliacionFondo: this.formData.fechaAfiliacionFondo,
                    fondoCesantias: this.formData.fondoCesantias,
                    cualFondoCesantias: this.formData.cualFondoCesantias,
                    fechaAfiliacionCesantias: this.formData.fechaAfiliacionCesantias
                }));

                if (this.formData.soportes) {
                    formData.append("soportes", this.formData.soportes);
                }

                if (this.isUpdating) {
                    await axios.post("/api/updateHv", formData);
                    this.spiner = false;
                    this.submited = false;
                    this.$toaster.success("Datos actualizados con éxito.");
                } else {
                    await axios.post("/api/registerHv", formData);
                    this.isUpdating = true;
                    this.sendEvent();
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
        sendEvent() {
            EventBus.$emit('alreadyHasHv', true);
        },
        async loadData() {
            if (this.experiencia_laboral && Object.keys(this.experiencia_laboral).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.experiencia_laboral);
            }
            if (this.soportes) {
                this.formData.soportes = this.soportes;
                this.formData.soportesPreview = this.soportes;
            }
        },
        validarDatos() {
            this.submited = true;
            this.$v.$touch();
            console.log(this.$v)
            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
                return false;
            }
            return true;
        },
    },

    validations: {
        formData: {
            secciones: {
                $each: {
                    direccion: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    telefono: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    cargo: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    jefeInmediato: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    fechaIngreso: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    sueldoInicial: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    sueldoFinal: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    cargoDesempeñado: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    funcionesRealizadas: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    logrosObtenidos: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    tipoContrato: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    cuantoTiempo: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa && formData.tipoContrato === 'Fijo' ? !!value : true;
                        }
                    },
                    cual: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa && formData.tipoContrato === 'Otro' ? !!value : true;
                        }
                    },
                    horarioTrabajo: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                    jornadaTrabajo: {
                        required: (value, formData) => {
                            return formData.nombreEmpresa ? !!value : true;
                        }
                    },
                }
            },
            soportes: { required },
            entidadPromotora: { required },
            cualEntidad: {
                required: (value, formData) => formData.entidadPromotora === 'Si' ? !!value : true,
            },
            fechaAfiliacion: {
                required: (value, formData) => formData.entidadPromotora === 'Si' ? !!value : true,
            },
            tipoAfiliado: {
                required: (value, formData) => formData.entidadPromotora === 'Si' ? !!value : true,
            },
            fondoPensiones: { required },
            cualFondo: {
                required: (value, formData) => formData.fondoPensiones === 'Si' ? !!value : true,
            },
            fechaAfiliacionFondo: {
                required: (value, formData) => formData.fondoPensiones === 'Si' ? !!value : true,
            },
            fondoCesantias: { required },
            cualFondoCesantias: {
                required: (value, formData) => formData.fondoCesantias === 'Si' ? !!value : true,
            },
            fechaAfiliacionCesantias: {
                required: (value, formData) => formData.fondoCesantias === 'Si' ? !!value : true,
            }
        }
    },
}
</script>

<style scoped>
button,
input,
select,
textarea {
    border-style: double;
}
</style>