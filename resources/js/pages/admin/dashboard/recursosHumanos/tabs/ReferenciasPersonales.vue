<template>
    <div class="p-6 bg-gray-100">
        <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
            <div>
                <p class="font-semibold mb-2 text-blue-600">Relacione dos nombres de personas distintas a familiares o
                    empleadores:
                </p>
                <div class="grid md:grid-cols-1 lg:grid-cols-4 gap-2 py-2"
                    v-for="(reference, index) in formData.referencias" :key="index">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Nombre</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="reference.nombres" placeholder="Nombre">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.referencias.$each[index].nombres.required">
                            Ingrese los nombres del {{ index === 0 ? 'primer' : 'segundo' }} contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Ocupación</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="reference.ocupacion" placeholder="Ocupación">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.referencias.$each[index].ocupacion.required">
                            Ingrese la ocupación del {{ index === 0 ? 'primer' : 'segundo' }} contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Dirección</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="reference.direccion" placeholder="Dirección">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.referencias.$each[index].direccion.required">
                            Ingrese la dirección del {{ index === 0 ? 'primer' : 'segundo' }} contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Teléfono</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="reference.telefono" placeholder="Teléfono">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.referencias.$each[index].telefono.required">
                            Ingrese el teléfono del {{ index === 0 ? 'primer' : 'segundo' }} contacto de emergencia
                        </p>
                    </div>
                </div>
            </div>

            <div>
                <p class="font-semibold mb-2 text-blue-600">Nombre de un familiar que podamos contactar en caso de no
                    localizarlo a
                    usted directamente:</p>
                <div class="grid md:grid-cols-1 lg:grid-cols-4 gap-2 py-2">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Nombre</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.contactoEmergencia.nombres" placeholder="Nombre">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.contactoEmergencia.nombres.required">
                            Ingrese el nombres del contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Ocupación</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.contactoEmergencia.ocupacion" placeholder="Ocupación">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.contactoEmergencia.ocupacion.required">
                            Ingrese la ocupación del contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Dirección</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.contactoEmergencia.direccion" placeholder="Dirección">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.contactoEmergencia.direccion.required">
                            Ingrese la dirección del contacto de emergencia
                        </p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Teléfono</label>
                        <input type="text" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            v-model="formData.contactoEmergencia.telefono" placeholder="Teléfono">
                        <p class="text-red-500 text-sm"
                            v-if="submited && !$v.formData.contactoEmergencia.telefono.required">
                            Ingrese el télefono del contacto de emergencia
                        </p>
                    </div>

                </div>
            </div>

            <div class="mb-6">
                <p class="font-semibold mb-2">Verificación (Espacio exclusivo para el entrevistador):</p>
                <textarea class="w-full border p-2 h-24" v-model="formData.verificacionEntrevistador"></textarea>
            </div>

            <div class="text-sm border-t pt-4">
                <div class="grid grid-cols-12 gap-4">
                    <div class="col-span-6">
                        <div class="flex items-center space-x-2 mb-2">
                            <input type="checkbox" class="w-4 h-4" v-model="formData.autorizacion">
                            <label>Autorizo pedir información de mi Hoja de Vida sin ninguna
                                restricción.</label>
                        </div>
                        <p class="font-semibold text-blue-600">¡Importante!</p>
                        <p>Este es un formato de distribución GRATUITA, puede buscarlo en la Web, puede imprimir o
                            enviar este formato por correo electrónico sin restricciones.</p>
                    </div>
                    <div class="col-span-6">
                        <p class="mb-2">Nota importante:</p>
                        <p class="text-gray-600 text-sm">Favor no llamar por teléfono, ni concurrir a preguntar por el
                            resultado de esta solicitud. Nosotros le avisaremos, gracias.</p>
                        <p class="mt-4 font-semibold">Certificación:</p>
                        <p class="text-gray-600 text-sm">Para todos los efectos legales, certifico que todas las
                            respuestas informaciones anotadas por mí, en el presente formato son veraces.</p>
                    </div>
                </div>
                <div class="my-6">
                    <label
                        class="md:w-64 h-10 border rounded-lg bg-gray-100 flex flex-col justify-center items-center cursor-pointer relative">
                        <span v-if="!formData.firmaPreview" class="text-sm text-gray-500">Cargar Foto</span>
                        <img v-if="formData.firmaPreview" :src="formData.firmaPreview"
                            class="absolute w-full h-full rounded-lg" />
                        <input type="file" accept="image/*" @change="handleFileUpload" class="hidden" />
                    </label>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.firma.required">
                        Debe subir la imagén de su firma
                    </p>
                    <label for="id" class="font-semibold mt-2 block">C.C.:</label>
                    <input type="text" id="id" class="border p-2 w-full" v-model="formData.cc" placeholder="C.C.">
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cc.required">
                        Debe ingresar la cédula
                    </p>
                </div>
            </div>

            <button
                class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                type="submit">
                <p v-if="!spiner && !isUpdating">Guardar</p>
                <p v-else-if="!spiner && isUpdating">Actualizar</p>
                <p v-else-if="spiner && !isUpdating"><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                <p v-else><em class="fas fa-spinner fa-pulse"></em> Actualizando...</p>
            </button>
        </form>
    </div>
</template>

<script>
import { required } from 'vuelidate/lib/validators';

export default {
    props: {
        referencias_personales: {
            type: Object,
            default: () => ({}),
        },
        firma: {
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
                referencias: [
                    { nombres: '', ocupacion: '', direccion: '', telefono: '' },
                    { nombres: '', ocupacion: '', direccion: '', telefono: '' },
                ],
                contactoEmergencia: {
                    nombres: '',
                    ocupacion: '',
                    direccion: '',
                    telefono: '',
                },
                verificacionEntrevistador: '',
                autorizacion: false,
                firma: null,
                firmaPreview: null,
                cc: '',
            },
            submited: false,
            isUpdating: false,
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
                formData.append("referencias_personales", JSON.stringify({
                    referencias: this.formData.referencias,
                    contactoEmergencia: this.formData.contactoEmergencia,
                    verificacionEntrevistador: this.formData.verificacionEntrevistador,
                    autorizacion: this.formData.autorizacion,
                    firma: this.formData.firma,
                    firmaPreview: this.formData.firmaPreview,
                    cc: this.formData.cc,
                }));

                if (this.formData.firma) {
                    formData.append("firma", this.formData.firma);
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
        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                this.formData.firma = file;
                this.formData.firmaPreview = URL.createObjectURL(file);
            }
        },
        loadData() {
            if (this.referencias_personales && Object.keys(this.referencias_personales).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.referencias_personales);
            }

            if (this.firma) {
                this.formData.firma = this.firma;
                this.formData.fotoPreview = this.firma;
            }

        },
        validarDatos() {
            this.submited = true;
            this.$v.$touch();
            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
                return false;
            }

            if (!this.formData.autorizacion) {
                this.$toaster.error("Debes autorizar la recolección de información de tu hoja de vida.");
                return false;

            }
            return true;
        },

    },

    validations: {
        formData: {
            firma: { required },
            cc: { required },
            referencias: {
                $each: {
                    nombres: { required },
                    ocupacion: { required },
                    direccion: { required },
                    telefono: { required },
                },
            },
            contactoEmergencia: {
                nombres: { required },
                ocupacion: { required },
                direccion: { required },
                telefono: { required },
            },
        },
    },

    computed: {

    },

    components: {}

}
</script>