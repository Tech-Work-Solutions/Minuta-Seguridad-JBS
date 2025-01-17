<template>
    <div class="bg-gray-100 p-6">
        <form class="bg-white rounded-lg shadow p-6">

            <table class="table-auto w-full items-center bg-gray-100 border-collapse">
                <thead>
                    <tr class="bg-blue-800 text-white">
                        <th colspan="4" rowspan="3" class="border border-gray-300 p-2">Nombres del entrevistador</th>
                        <th colspan="4" rowspan="2" class="border border-gray-300 p-2">Entrevista</th>
                        <th colspan="7" class="border border-gray-300 p-2">Observaciones</th>
                    </tr>
                    <tr class="bg-blue-800 text-white">
                        <th colspan="4" class="border border-gray-300 p-2">Asistió a entrevista</th>
                        <th colspan="3" rowspan="2" class="border border-gray-300 p-2">Hora de Llegada</th>
                    </tr>
                    <tr class="bg-blue-800 text-white">
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
                                <input type="text" placeholder="Código" v-model="asistencia.nombre"
                                    class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                            </div>
                        </td>
                        <td colspan="2" class="border border-gray-300 p-2">
                            <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                <input type="date" v-model="asistencia.dia"
                                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                            </div>
                        </td>
                        <td colspan="2" class="border border-gray-300 p-2">
                            <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                <input type="time" id="appt" name="appt" min="07:00" max="18:00"
                                    v-model="asistencia.hora"
                                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                            </div>
                        </td>
                        <td colspan="2" class="border border-gray-300 p-2">
                            <div class="relative flex w-full flex-wrap items-stretch mb-3">

                                <input type="radio" name="asistencia" value="Si" class="form-radio text-blue-600"
                                    v-model="asistencia.asistio">

                            </div>
                        </td>
                        <td colspan="2" class="border border-gray-300 p-2">
                            <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                <label>
                                    <input type="radio" name="asistencia" value="No" class="form-radio text-blue-600"
                                        v-model="asistencia.asistio">
                                </label>
                            </div>
                        </td>
                        <td colspan="3" class="border border-gray-300 p-2">
                            <div class="relative flex w-full flex-wrap items-stretch mb-3">
                                <input type="time" id="appt" name="appt" min="07:00" max="18:00"
                                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-32" />
                            </div>
                        </td>
                    </tr>
                </tbody>

            </table>

            <!-- Evaluation Table -->
            <div class="mt-6">
                <h2 class="text-lg font-bold text-gray-800">Algunos Aspectos Importantes para el Cargo</h2>
                <p class="text-sm text-gray-500">(R - Regular, B - Bien, MB - Muy Bien)</p>
                <table class="w-full mt-4 table-auto border-collapse border border-gray-300 text-sm">
                    <thead>
                        <tr class="bg-blue-800 text-white">
                            <th class="border border-gray-300 p-2">Aspectos</th>
                            <th class="border border-gray-300 p-2">Primer Entrevistador</th>
                            <th class="border border-gray-300 p-2">Segundo Entrevistador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(aspecto, index) in formData.aspectos" :key="index">
                            <td class="border border-gray-300 p-2">{{ aspecto.nombre }}</td>
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
                                        v-model="aspecto.segundoEntrevistador" class="form-radio text-blue-600" /> MB
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="border border-gray-300 p-2">
                                <label>
                                    <input type="text" placeholder="Código" v-model="formData.otroAspecto.nombre"
                                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                                </label>
                            </td>
                            <td class="border border-gray-300 p-2 text-center">
                                <label>
                                    <input type="radio" value="R" v-model="formData.otroAspecto.primerEntrevistador"
                                        class="form-radio text-blue-600" /> R
                                </label>
                                <label>
                                    <input type="radio" value="B" v-model="formData.otroAspecto.primerEntrevistador"
                                        class="form-radio text-blue-600" /> B
                                </label>
                                <label>
                                    <input type="radio" value="MB" v-model="formData.otroAspecto.primerEntrevistador"
                                        class="form-radio text-blue-600" /> MB
                                </label>
                            </td>
                            <td class="border border-gray-300 p-2 text-center">
                                <label>
                                    <input type="radio" value="R" v-model="formData.otroAspecto.segundoEntrevistador"
                                        class="form-radio text-blue-600" /> R
                                </label>
                                <label>
                                    <input type="radio" value="B" v-model="formData.otroAspecto.segundoEntrevistador"
                                        class="form-radio text-blue-600" /> B
                                </label>
                                <label>
                                    <input type="radio" value="MB" v-model="formData.otroAspecto.segundoEntrevistador"
                                        class="form-radio text-blue-600" />
                                    MB
                                </label>
                            </td>
                        </tr>

                    </tbody>
                </table>
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
                                    v-model="formData.proximamenteSeleccionado">
                                Sí</label>
                            <label><input type="radio" name="seleccionado" value="No" class="form-radio text-blue-600"
                                    v-model="formData.proximamenteSeleccionado">
                                No</label>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label class="block font-medium text-gray-700">Contrátese a partir del</label>
                        <input type="date" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.fechaContratacion">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Sueldo</label>
                        <input type="number" placeholder="$"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.sueldo">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Cargo</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.cargo">
                    </div>
                    <div>
                        <label class="block font-medium text-gray-700">Tipo de Contrato</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.tipoContrato">
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
                        <label class="block font-medium text-gray-700">Firma de quien Autoriza Contratación</label>
                        <input type="text" v-model="formData.firmaAutorizador"
                            class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
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
import { TRichSelect } from 'vue-tailwind/dist/components';

export default {
    data() {
        return {
            formData: {
                asistencias: [
                    {
                        nombre: '',
                        dia: '',
                        hora: '',
                        asistio: '',
                        horaLlegada: '',
                    },
                    {
                        nombre: '',
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
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Presentacion',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Aspectos de vigor y salud',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Facilidad de expresión',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Desempeño en cargos anteriores',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Aceptables motivos de retiro cargos anteriores',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                    {
                        nombre: 'Se ajusta al perfil',
                        primerEntrevistador: '',
                        segundoEntrevistador: ''
                    },
                ],
                otroAspecto: {
                    nombre: '',
                    primerEntrevistador: '',
                    segundoEntrevistador: ''
                },
                candidatoSeleccionado: 'No',
                proximamenteSeleccionado: 'No',
                conclusionPrimerEntrevistador: '',
                conclusionSegundoEntrevistador: '',
                fechaContratacion: '',
                sueldo: 0,
                cargo: '',
                tipoContrato: '',
                verificadorReferencia: '',
                primerEntrevistador: '',
                segundoEntrevistador: '',
                firmaAutorizador: '',
            },

        };
    },

    async mounted() {
    },

    methods: {
    },

    validations: {
        formData: {
        }
    },

    computed: {

    },

    components: { TRichSelect }

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