<template>
    <div class="p-6 bg-gray-100">
        <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nombre esposa(o) o compañera(o):</label>
                    <input v-model="formData.nombre" type="text" placeholder="Nombre de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombre.required">
                        Ingrese el nombre esposa(o) o compañera(o)
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Profesión, ocupación u oficio:</label>
                    <input v-model="formData.profesion" type="text" placeholder="Ocupación de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.profesion.required">
                        Ingrese la Profesión, ocupación u oficio
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Empresa donde trabaja:</label>
                    <input v-model="formData.empresa" type="text" placeholder="Empresa de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.empresa.required">
                        Ingrese empresa de la pareja
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Cargo actual:</label>
                    <input v-model="formData.cargo" type="text" placeholder="Cargo de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cargo.required">
                        Ingrese su cargo
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Dirección:</label>
                    <input v-model="formData.direccion" type="text" placeholder="Dirección y barrio de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.direccion.required">
                        Ingrese la dirección
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Teléfono:</label>
                    <input v-model="formData.telefono" type="text" placeholder="Teléfono de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefono.required">
                        Ingrese un número de teléfono
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Ciudad:</label>
                    <input v-model="formData.ciudad" type="text" placeholder="Ciudad de la pareja"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ciudad.required">
                        Ingrese la ciudad de la pareja
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nº de personas que dependen
                        económicamente:</label>
                    <input v-model="formData.numPersonas" type="number" placeholder="N° de dependientes del solicitante"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.numPersonas.required">
                        Ingrese un número de dependientes
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Parentescos:</label>
                    <input v-model="formData.parentescos" type="text" placeholder="Hijo, Hija, Hermana, etc..."
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.parentescos.required">
                        Ingrese los parentescos de los dependientes
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Edades:</label>
                    <input v-model="formData.edades" type="text" placeholder="Edades en años 15, 20, 5"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.edades.required">
                        Ingrese edades de los dependientes
                    </p>
                </div>
            </div>

            <div class="grid md:grid-cols-1 lg:grid-cols-3 gap-2 py-2" v-for="(fam, index) in formData.padres"
                :key="index + 'p'">
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nombre(s) Padre(s):</label>
                    <input v-model="fam.nombres" type="text" placeholder="Nombre"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm"
                        v-if="submited && !$v.formData.padres.$each[index].nombres.required">
                        Ingrese los nombres de los padres
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Profesión, ocupación u oficio:</label>
                    <input v-model="fam.profesion" type="text" placeholder="Profesión"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm"
                        v-if="submited && !$v.formData.padres.$each[index].profesion.required">
                        Ingrese la profesion de los padres
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Teléfono(s):</label>
                    <input v-model="fam.telefono" type="text" placeholder="Teléfono"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm"
                        v-if="submited && !$v.formData.padres.$each[index].telefono.required">
                        Ingrese el teléfono de los padres
                    </p>
                </div>
            </div>

            <div class="grid md:grid-cols-1 lg:grid-cols-3 gap-2 py-2" v-for="(fam, index) in formData.hermanos"
                :key="index + 'h'">
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nombre(s) Hermano(s):</label>
                    <input v-model="fam.nombres" type="text" placeholder="Nombre"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Profesión, ocupación u oficio:</label>
                    <input v-model="fam.profesion" type="text" placeholder="Profesión"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm"
                        v-if="submited && !$v.formData.hermanos.$each[index].profesion.required">
                        Ingrese la profesion de los hermanos
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Teléfono(s):</label>
                    <input v-model="fam.telefono" type="text" placeholder="Teléfono"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" />
                    <p class="text-red-500 text-sm"
                        v-if="submited && !$v.formData.hermanos.$each[index].telefono.required">
                        Ingrese el teléfono de los hermanos
                    </p>
                </div>
            </div>

            <div class="flex mb-4 mt-5" v-if="canEditHv">
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
import { EventBus } from '../../../../../../utils/util.js';

export default {
    props: {
        informacion_familiar: {
            type: Object,
            default: () => ({})
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
                nombre: "",
                profesion: "",
                empresa: "",
                cargo: "",
                direccion: "",
                telefono: "",
                ciudad: "",
                numPersonas: "",
                parentescos: "",
                edades: "",
                padres: [
                    {
                        nombres: "",
                        profesion: "",
                        telefono: "",
                    },
                    {
                        nombres: "",
                        profesion: "",
                        telefono: "",
                    }
                ],
                hermanos: [
                    {
                        nombres: "",
                        profesion: "",
                        telefono: "",
                    },
                    {
                        nombres: "",
                        profesion: "",
                        telefono: "",
                    }
                ],
            },
            submited: false,
            isUpdating: false,
            spiner: false,
        };
    },
    created() {
        EventBus.$on('alreadyHasHv', (value) => {
            this.isUpdating = value || this.hasHv;
        });
    },
    beforeDestroy() {
        EventBus.$off('alreadyHasHv');
    },
    mounted() {
        this.spiner = false;
        this.loadData();
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
                formData.append("informacion_familiar", JSON.stringify({
                    nombre: this.formData.nombre,
                    profesion: this.formData.profesion,
                    empresa: this.formData.empresa,
                    cargo: this.formData.cargo,
                    direccion: this.formData.direccion,
                    telefono: this.formData.telefono,
                    ciudad: this.formData.ciudad,
                    numPersonas: this.formData.numPersonas,
                    parentescos: this.formData.parentescos,
                    edades: this.formData.edades,
                    padres: this.formData.padres,
                    hermanos: this.formData.hermanos,
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
                    this.sendEvent();
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
        loadData() {
            if (this.informacion_familiar && Object.keys(this.informacion_familiar).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.informacion_familiar);
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
            nombre: { required },
            profesion: { required },
            empresa: { required },
            cargo: { required },
            direccion: { required },
            telefono: { required },
            ciudad: { required },
            numPersonas: { required },
            parentescos: { required },
            edades: { required },
            padres: {
                $each: {
                    nombres: { required },
                    profesion: { required },
                    telefono: { required },
                },
            },
            hermanos: {
                $each: {
                    nombres: {},
                    profesion: {
                        required: (value, { nombres }) => !nombres || required(value)
                    },
                    telefono: {
                        required: (value, { nombres }) => !nombres || required(value)
                    },
                },
            },

        },
    },

};
</script>

<style scoped>
button,
input,
select,
textarea {
    border-style: double;
}
</style>