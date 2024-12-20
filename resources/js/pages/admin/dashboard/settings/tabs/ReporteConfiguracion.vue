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
                                    <input type='file' class="opacity-0" accept="image/*"
                                        @change="obtenerImagenHeader" />
                                </label>

                                <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                                    <figure>
                                        <img :src="imagenMinutaHeader" alt="">
                                    </figure>
                                </div>
                            </div>

                            <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
                                <label
                                    class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                                    <em class="fas fa-cloud-upload-alt fa-3x"></em>
                                    <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                                    <input type='file' class="opacity-0" accept="image/*"
                                        @change="obtenerImagenFooter" />
                                </label>

                                <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                                    <figure>
                                        <img :src="imagenMinutaFooter" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="flex mb-4">
                        <button
                            class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                            type="button" @click="registrar">
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
        await this.getImagenes();
    },

    methods: {
        async getImagenes() {
            await axios.get('/api/getImagenesReporte').then((response) => {
                console.log(response)
                this.imagenes = response.data;
                this.imgMinutaHeader = this.imagenes.img_header;
                this.imgMinutaFooter = this.imagenes.img_footer;
            }).catch((errors) => {
                console.log(errors.response.data.errors)
            });
        },
        async registrar() {
            this.spiner = true;
            let datos = new FormData();

            datos.append('img_header', this.formData.img_header);
            datos.append('img_footer', this.formData.img_footer);
            try {
                await axios.post('/api/updateImagenesReporte', datos);
                this.spiner = false;
                this.submited = false;
                this.formData.img_header = '';
                this.formData.img_footer = '';
                this.$toaster.success('Tarea completada con éxito.');
            } catch (errors) {
                this.spiner = false;
                this.submited = false;
                this.$toaster.error('Algo salió mal.');
                console.log(errors.response.data.errors)
            }

        },
        obtenerImagenHeader(e) {
            let file = e.target.files[0];
            this.formData.img_header = file;
            this.cargarImagenHeader(file);
        },
        obtenerImagenFooter(e) {
            let file = e.target.files[0];
            this.formData.img_footer = file;
            this.cargarImagenFooter(file, this.imgMinutaFooter);
        },
        cargarImagenHeader(file) {
            let reader = new FileReader();
            reader.onload = (e) => {
                this.imgMinutaHeader = e.target.result;
            }
            reader.readAsDataURL(file);
        },
        cargarImagenFooter(file) {
            let reader = new FileReader();
            reader.onload = (e) => {
                this.imgMinutaFooter = e.target.result;
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
        }
    },

    computed: {
        imagenMinutaHeader() {
            return this.imgMinutaHeader;
        },
        imagenMinutaFooter() {
            return this.imgMinutaFooter;
        },

    },

    components: { TRichSelect }

}
</script>