<template>

    <div class="flex flex-col w-full bg-gray-100 border-1">
        <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1 pt-5">
            <div class="flex-auto px-4 lg:px-10 py-6 pt-0">


                <form>


                    <div class="flex flex-col w-full">
                        <div class="flex flex-col lg:flex-row lg:flex-wrap w-full justify-center">


                            <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
                                <label
                                    class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                                    <em class="fas fa-cloud-upload-alt fa-3x"></em>
                                    <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                                    <input type='file' class="opacity-0" accept="image/*" @change="obtenerImagen" />
                                </label>

                                <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                                    <figure>
                                        <img :src="imagenMinuta" alt="">
                                    </figure>
                                </div>
                            </div>

                            <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
                                <label
                                    class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                                    <em class="fas fa-cloud-upload-alt fa-3x"></em>
                                    <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                                    <input type='file' class="opacity-0" accept="image/*" @change="obtenerImagen" />
                                </label>

                                <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                                    <figure>
                                        <img :src="imagenMinuta" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="flex mb-4">
                        <button
                            class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                            type="button" @click="registrarProcedencia">
                            <p v-if="!spiner">Guardar</p>
                            <p v-else><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</template>

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';
import { required } from 'vuelidate/lib/validators';
export default {
    data() {
        return {
            formData: {
                img_header: '',
                img_footer: '',
            },
            imgMinutaHeader: '',
            imgMinutaFooter: '',
            imagenes: {},
            spiner: false,
            submited: false,
            show: false,

        };
    },

    async mounted() {
        this.show = true;
        //this.getImagenes();
        //this.getRecordsMinutaByUser();
    },

    methods: {
        async getImagenes() {
            await axios.get('/api/getImagenesReporte').then((response) => {
                console.log(response)
                this.imagenes = response.data;
                console.log('llegó ', this.imagenes);
            }).catch((errors) => {
                console.log(errors.response.data.errors)
            });
        },

        async getRecordsMinutaByUser() {
            await axios.post('/api/getRecordsMinutaByUser', { user_id: this.id_user }).then((response) => {
                this.datos = response.data
            }).catch((errors) => {
                console.log(errors.response.data.errors)
            });
        },
        async registrar() {
            this.spiner = true;
            let datos = new FormData();

            datos.append('img_header', this.formData.imagen);
            datos.append('img_footer', this.formData.audio);

            await axios.post('/api/registerMinuta', datos).then((response) => {
                this.getRecordsMinutaByUser();
                this.spiner = false
                this.submited = false
                //this.imgMinuta = '';
                //this.formData.imagen = '';
                this.$toaster.success('Registro creado con éxito.');
            }).catch((errors) => {
                this.spiner = false
                this.submited = false
                this.$toaster.error('Algo salió mal.');
                console.log(errors.response.data.errors)
            });
        },
        obtenerImagen(e) {
            let file = e.target.files[0];
            this.formData.imagen = file;
            this.cargarImagen(file);
        },
        obtenerAudio(e) {
            let file = e.target.files[0];
            if (!file) {
                this.audioPreview = '';
                return;
            }
            if (file.type.startsWith("audio/")) {
                this.audioPreview = URL.createObjectURL(file);
                this.formData.audio = file;
            } else {
                this.$toaster.error("Por favor selecciona un archivo de audio válido.");
                this.audioPreview = null;
            }
        },

        cargarImagen(file) {
            let reader = new FileReader();
            reader.onload = (e) => {
                this.imgMinuta = e.target.result;
            }
            reader.readAsDataURL(file);
        },

        validarDatos() {
            this.submited = true;
            this.$v.$touch();
            if (this.$v.$invalid) {
                this.spiner = false;
                return false;
            }
            this.registrar();
        },
    },

    validations: {
        formData: {
            subject_id: { required },
        }
    },

    computed: {
        imagenMinuta() {
            return this.imgMinuta;
        },

    },

    components: { TRichSelect }

}
</script>