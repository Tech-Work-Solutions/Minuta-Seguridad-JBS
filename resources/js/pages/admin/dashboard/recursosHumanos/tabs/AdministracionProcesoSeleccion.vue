<template>
    <div class="bg-gray-100 p-6">
        <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
            <div class="overflow-x-auto mt-4">

                <table class="table-auto w-full text-sm border-collapse border border-gray-300">
                    <thead>
                        <tr>
                            <th colspan="4" rowspan="3" class="border border-gray-300 p-2">Nombres del entrevistador
                            </th>
                            <th colspan="4" rowspan="2" class="border border-gray-300 p-2">Entrevista</th>
                            <th colspan="7" class="border border-gray-300 p-2">Observaciones</th>
                        </tr>
                        <tr>
                            <th colspan="4" class="border border-gray-300 p-2">Asistió a entrevista</th>
                            <th colspan="3" rowspan="2" class="border border-gray-300 p-2">Hora de Llegada</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="border border-gray-300 p-2">Día</th>
                            <th colspan="2" class="border border-gray-300 p-2">Hora</th>
                            <th colspan="2" class="border border-gray-300 p-2">Si</th>
                            <th colspan="2" class="border border-gray-300 p-2">No</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(asistencia, index) in formData.asistencias" :key="index">
                            <td colspan="4" class="border border-gray-300 p-2">
                                <div>
                                    <input type="text" placeholder="Nombre Entrevistador" v-model="asistencia.nombres"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                                    <p class="text-red-500 text-sm"
                                        v-if="submited && !$v.formData.asistencias[0].nombres.required && index === 0">
                                        Ingrese un entrevistador.
                                    </p>
                                </div>
                            </td>
                            <td colspan="2" class="border border-gray-300 p-2">
                                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                    <input type="date" v-model="asistencia.dia" :disabled="!asistencia.nombres"
                                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                                    <p class="text-red-500 text-sm"
                                        v-if="submited && !$v.formData.asistencias[0].dia.required && index === 0">
                                        Ingrese el día de la entrevista.
                                    </p>
                                </div>
                            </td>
                            <td colspan="2" class="border border-gray-300 p-2">
                                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                    <input type="time" id="appt" name="appt" min="07:00" max="18:00"
                                        v-model="asistencia.hora" :disabled="!asistencia.nombres"
                                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                                    <p class="text-red-500 text-sm"
                                        v-if="submited && !$v.formData.asistencias[0].hora.required && index === 0">
                                        Ingrese la hora de la entrevista.
                                    </p>
                                </div>
                            </td>
                            <td colspan="2" class="border border-gray-300 p-2">
                                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                    <input type="radio" name="asistencia" value="Si" class="form-radio text-blue-600"
                                        :disabled="!asistencia.nombres" v-model="asistencia.asistio">
                                    <p class="text-red-500 text-sm"
                                        v-if="submited && !$v.formData.asistencias[0].asistio.required && index === 0">
                                        Elija si asistió el postulante.
                                    </p>
                                </div>
                            </td>
                            <td colspan="2" class="border border-gray-300 p-2">
                                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                    <label>
                                        <input type="radio" name="asistencia" value="No" :disabled="!asistencia.nombres"
                                            class="form-radio text-blue-600" v-model="asistencia.asistio">
                                        <p class="text-red-500 text-sm"
                                            v-if="submited && !$v.formData.asistencias[0].asistio.required && index === 0">
                                            Elija una opción.
                                        </p>
                                    </label>
                                </div>
                            </td>
                            <td colspan="3" class="border border-gray-300 p-2">
                                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                    <input type="time" id="appt" name="appt" min="07:00" max="18:00"
                                        :disabled="!asistencia.nombres || asistencia.asistio === 'No'"
                                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                                </div>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>

            <!-- Evaluation Table -->
            <div class="overflow-x-auto mt-4">

                <div class="mt-6">
                    <h2 class="text-lg font-bold text-gray-800">Algunos Aspectos Importantes para el Cargo</h2>
                    <p class="text-sm text-gray-500">(R - Regular, B - Bien, MB - Muy Bien)</p>
                    <table class="w-full mt-4 table-auto border-collapse border border-gray-300 text-sm">
                        <thead>
                            <tr>
                                <th class="border border-gray-300 p-2">Aspectos</th>
                                <th class="border border-gray-300 p-2">Primer Entrevistador</th>
                                <th class="border border-gray-300 p-2">Segundo Entrevistador</th>
                                <th class="border border-gray-300 p-2">Aspectos</th>
                                <th class="border border-gray-300 p-2">Primer Entrevistador</th>
                                <th class="border border-gray-300 p-2">Segundo Entrevistador</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(aspecto, index) in formData.aspectos" :key="index">
                                <td class="border border-gray-300 p-2">{{ aspecto.nombre }}
                                </td>
                                <td class="border border-gray-300 p-2 text-center">
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="R"
                                            v-model="aspecto.primerEntrevistador" class="form-radio text-blue-600" /> R
                                    </label>
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="B"
                                            v-model="aspecto.primerEntrevistador" class="form-radio text-blue-600" /> B
                                    </label>
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="MB"
                                            v-model="aspecto.primerEntrevistador" class="form-radio text-blue-600" /> MB
                                    </label>
                                </td>
                                <td class="border border-gray-300 p-2 text-center">
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="R"
                                            v-model="aspecto.segundoEntrevistador" class="form-radio text-blue-600" /> R
                                    </label>
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="B"
                                            v-model="aspecto.segundoEntrevistador" class="form-radio text-blue-600" /> B
                                    </label>
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="MB"
                                            v-model="aspecto.segundoEntrevistador" class="form-radio text-blue-600" />
                                        MB
                                    </label>
                                </td>
                                <td class="border border-gray-300 p-2"
                                    v-if="aspecto.nombre2 && aspecto.nombre2 !== 'Otro'">

                                    {{ aspecto.nombre2 }}

                                </td>
                                <td class="border border-gray-300 p-2" v-if="aspecto.nombre2 === 'Otro'">

                                    <input type="text" placeholder="Ingrese el aspecto"
                                        v-model="aspecto.nombreInputOtro"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />

                                </td>
                                <td class="border border-gray-300 p-2 text-center" v-if="aspecto.nombre2">
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="R"
                                            v-model="aspecto.primerEntrevistador2" class="form-radio text-blue-600" /> R
                                    </label>
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="B"
                                            v-model="aspecto.primerEntrevistador2" class="form-radio text-blue-600" /> B
                                    </label>
                                    <label>
                                        <input type="radio" :name="'primerEntrevistador-' + index" value="MB"
                                            v-model="aspecto.primerEntrevistador2" class="form-radio text-blue-600" />
                                        MB
                                    </label>
                                </td>

                                <td class="border border-gray-300 p-2 text-center" v-if="aspecto.nombre2">
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="R"
                                            v-model="aspecto.segundoEntrevistador2" class="form-radio text-blue-600" />
                                        R
                                    </label>
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="B"
                                            v-model="aspecto.segundoEntrevistador2" class="form-radio text-blue-600" />
                                        B
                                    </label>
                                    <label>
                                        <input type="radio" :name="'segundoEntrevistador-' + index" value="MB"
                                            v-model="aspecto.segundoEntrevistador2" class="form-radio text-blue-600" />
                                        MB
                                    </label>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Conclusions -->
            <div class="mt-6">
                <h2 class="text-lg font-bold text-gray-800">Conclusiones de la Entrevista</h2>
                <div class="mt-2 grid grid-cols-1 gap-4">
                    <div>
                        <label class="block font-medium text-gray-700">Primer Entrevistador</label>
                        <textarea v-model="formData.conclusionPrimerEntrevistador"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"></textarea>
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Segundo Entrevistador</label>
                        <textarea v-model="formData.conclusionSegundoEntrevistador"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"></textarea>
                    </div>
                </div>
            </div>

            <!-- Final Selection -->
            <div class="mt-6 border-t pt-4">
                <h2 class="text-lg font-bold text-gray-800">Selección Final</h2>
                <div class="grid grid-cols-2 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block font-medium text-gray-700">Candidato seleccionado definitivamente</label>
                        <div class="flex items-center space-x-4">
                            <label><input type="radio" name="candidatoSeleccionado" value="Si"
                                    class="form-radio text-blue-600" v-model="formData.candidatoSeleccionado">
                                Sí</label>
                            <label><input type="radio" name="candidatoSeleccionado" value="No"
                                    class="form-radio text-blue-600" v-model="formData.candidatoSeleccionado">
                                No</label>
                        </div>
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Candidato elegible próximamente</label>
                        <div class="flex items-center space-x-4">
                            <label><input type="radio" name="seleccionado" value="Si" class="form-radio text-blue-600"
                                    v-model="formData.candidatoProximo">
                                Sí</label>
                            <label><input type="radio" name="seleccionado" value="No" class="form-radio text-blue-600"
                                    v-model="formData.candidatoProximo">
                                No</label>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label class="block font-medium text-gray-700">Contrátese a partir del</label>
                        <input type="date" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.fechaContratacion"
                            :disabled="formData.candidatoSeleccionado === 'No' && formData.candidatoProximo === 'No'">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Sueldo</label>
                        <input type="number" placeholder="$"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.sueldo"
                            :disabled="formData.candidatoSeleccionado === 'No' && formData.candidatoProximo === 'No'">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Cargo</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.cargo"
                            :disabled="formData.candidatoSeleccionado === 'No' && formData.candidatoProximo === 'No'">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Tipo de Contrato</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.tipoContrato"
                            :disabled="formData.candidatoSeleccionado === 'No' && formData.candidatoProximo === 'No'">
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="mt-6">
                <h2 class="text-lg font-bold text-gray-800">Referencias Verificadas</h2>
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label class="block font-medium text-gray-700">Referencias verificadas por</label>
                        <input type="text" v-model="formData.verificadorReferencia"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Primer Entrevistador</label>
                        <input type="text" v-model="formData.primerEntrevistador"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Segundo Entrevistador</label>
                        <input type="text" v-model="formData.segundoEntrevistador"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                    </div>
                    <div>

                        <label class="block font-medium text-gray-700">Firma de Contratación</label>
                        <label
                            class="h-10 border rounded-lg bg-gray-100 flex flex-col justify-center items-center cursor-pointer relative">

                            <span v-if="!formData.firma_autorizador_preview" class="text-sm text-gray-500">Firma
                                Autorización</span>
                            <img v-if="formData.firma_autorizador_preview" :src="formData.firma_autorizador_preview"
                                class="w-full h-full rounded-lg" />
                            <input type="file" accept="image/*" @change="handleFileUpload" class="hidden" />
                        </label>
                    </div>
                </div>
            </div>
            <div class="flex mb-4 mt-5">
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
import { required } from 'vuelidate/lib/validators';

export default {
    props: {
        administracion_proceso_seleccion: {
            type: Object,
            default: () => ({}),
        },
        firma_autorizador: {
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

    },
    data() {
        return {
            formData: {
                asistencias: [
                    {
                        nombres: '',
                        dia: '',
                        hora: '',
                        asistio: '',
                        horaLlegada: '',
                    },
                    {
                        nombres: '',
                        dia: '',
                        hora: '',
                        asistio: '',
                        horaLlegada: '',
                    }
                ],
                aspectos: [
                    {
                        nombre: 'Puntualidad',
                        primerEntrevistador: '',
                        segundoEntrevistador: '',
                        nombre2: 'Desempeño en cargos anteriores',
                        primerEntrevistador2: '',
                        segundoEntrevistador2: '',
                    },
                    {
                        nombre: 'Presentacion',
                        primerEntrevistador: '',
                        segundoEntrevistador: '',
                        nombre2: 'Aceptables motivos de retiro cargos anteriores',
                        primerEntrevistador2: '',
                        segundoEntrevistador2: '',
                    },
                    {
                        nombre: 'Aspectos de vigor y salud',
                        primerEntrevistador: '',
                        segundoEntrevistador: '',
                        nombre2: 'Se ajusta al perfil',
                        primerEntrevistador2: '',
                        segundoEntrevistador2: '',
                    },
                    {
                        nombre: 'Facilidad de expresión',
                        primerEntrevistador: '',
                        segundoEntrevistador: '',
                        nombre2: 'Otro',
                        nombreInputOtro: '',
                        primerEntrevistador2: '',
                        segundoEntrevistador2: '',
                    },
                ],
                candidatoSeleccionado: 'No',
                candidatoProximo: 'No',
                conclusionPrimerEntrevistador: '',
                conclusionSegundoEntrevistador: '',
                fechaContratacion: '',
                sueldo: 0,
                cargo: '',
                tipoContrato: '',
                verificadorReferencia: '',
                primerEntrevistador: '',
                segundoEntrevistador: '',
                firma_autorizador: null,
                firma_autorizador_preview: null,
            },
            submited: false,
            isUpdating: false,
            spiner: false,
        };
    },

    mounted() {
        this.spiner = false;
        this.loadData();
    },

    methods: {
        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                this.formData.firma_autorizador = file;
                this.formData.firma_autorizador_preview = URL.createObjectURL(file);
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
                formData.append("administracion_proceso_seleccion", JSON.stringify({
                    asistencias: this.formData.asistencias,
                    aspectos: this.formData.aspectos,
                    otroAspecto: this.formData.otroAspecto,
                    candidatoSeleccionado: this.formData.candidatoSeleccionado,
                    candidatoProximo: this.formData.candidatoProximo,
                    conclusionPrimerEntrevistador: this.formData.conclusionPrimerEntrevistador,
                    conclusionSegundoEntrevistador: this.formData.conclusionSegundoEntrevistador,
                    fechaContratacion: this.formData.fechaContratacion,
                    sueldo: this.formData.sueldo,
                    cargo: this.formData.cargo,
                    tipoContrato: this.formData.tipoContrato,
                    verificadorReferencia: this.formData.verificadorReferencia,
                    primerEntrevistador: this.formData.primerEntrevistador,
                    segundoEntrevistador: this.formData.segundoEntrevistador,
                }));

                if (this.formData.firma_autorizador) {
                    formData.append("firma_autorizador", this.formData.firma_autorizador);
                }

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
            if (this.administracion_proceso_seleccion && Object.keys(this.administracion_proceso_seleccion).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.administracion_proceso_seleccion);
            }
            if (this.firma_autorizador) {
                this.formData.firma_autorizador = this.firma_autorizador;
                this.formData.firma_autorizador_preview = this.firma_autorizador;
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
            asistencias: {
                0: {
                    nombres: { required },
                    dia: {
                        required: (value, formData) => formData.nombres ? !!value : true,
                    },
                    hora: {
                        required: (value, formData) => formData.nombres ? !!value : true,
                    },
                    asistio: {
                        required: (value, formData) => formData.nombres ? !!value : true,
                    },
                    horaLlegada: {
                        required: (value, formData) => formData.asistio === 'Si' ? !!value : true,
                    },
                },
            },
        }
    },
}
</script>

<style scoped>
@media (max-width: 768px) {
    .w-full {
        width: 100% !important;
    }

    .table-auto {
        table-layout: auto;
    }

    .table-auto input[type="text"] {
        width: 98px !important;
        padding: 0.75rem;
    }
}
</style>