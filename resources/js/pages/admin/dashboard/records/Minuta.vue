<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-file-signature"></em> Registro de
            Minuta</h1>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">
         <div class="flex-auto px-4 lg:px-10 py-6 pt-0">
            <form>
               <div class="flex flex-wrap mt-6">
                  <div class="w-full lg:w-6/12  px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Asunto:
                        </label>
                        <t-rich-select v-model="formData.subject_id" :options="subjects"
                           placeholder="Seleccione una opción">
                           <template slot="dropdownDown" slot-scope="{ query }">
                              <div v-if="query" class="text-center">
                                 <button type="button"
                                    class="block w-full p-3 text-white bg-blue-500 border hover:bg-blue-600"
                                    @click="createAsunto(query)">
                                    Crear asunto: {{ query }}
                                 </button>
                              </div>
                           </template>
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.subject_id.required">Seleccione un
                        asunto</p>
                  </div>

                  <div class="w-full lg:w-6/12  px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Puesto:
                        </label>
                        <t-rich-select v-model="formData.ubicacion_id" :options="ubicaciones"
                           placeholder="Seleccione una opción">
                           <template slot="dropdownDown" slot-scope="{ query }">
                              <div v-if="query" class="text-center">
                                 <button type="button"
                                    class="block w-full p-3 text-white bg-blue-500 border hover:bg-blue-600"
                                    @click="createUbicacion(query)">
                                    Crear puesto: {{ query }}
                                 </button>
                              </div>
                           </template>
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ubicacion_id.required">Seleccione un
                        puesto o
                        ubicación</p>
                  </div>

                  <div class="w-full px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Anotaciones:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <textarea rows="3" class="w-full p-2 border border-1 border-gray-300 rounded-md"
                              v-model="formData.anotaciones"></textarea>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.anotaciones.required">Ingrese las
                           anotaciones
                           correspondientes</p>
                     </div>
                  </div>
               </div>


               <div class="flex flex-col md:flex-row items-center">
                  <div class="mr-6">
                     <label
                        class="w-60 h-36 flex flex-col items-center ml-4 mt-5 px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                        <em class="fas fa-cloud-upload-alt fa-3x"></em>
                        <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                        <input type='file' class="opacity-0" @change="obtenerImagen" />

                     </label>

                  </div>
                  <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                     <figure>
                        <img :src="imagenMinuta" alt="">
                     </figure>
                  </div>
               </div>
               <div class="flex flex-col md:flex-row items-center">
                  <div class="mr-6">
                     <label
                        class="w-60 h-36 flex flex-col items-center ml-4 mt-5 px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                        <em class="fas fa-music fa-3x"></em>
                        <span class="mt-2 text-sm font-semibold">Adjuntar Audio</span>
                        <input type='file' accept="audio/*" class="opacity-0" @change="obtenerAudio" />

                     </label>

                  </div>
                  <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                     <figure v-if="audioPreview">
                        <audio :src="audioMinuta" controls></audio>
                     </figure>
                  </div>
               </div>
               <div class="flex p-6 -mt-20 md:mt-0">
                  <button
                     class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 ease-linear transition-all duration-150"
                     type="button" @click="validarDatos">
                     <p v-if="!spiner">Guardar</p>
                     <p v-else><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                  </button>
               </div>
            </form>
         </div>

         <div class="block w-full overflow-x-auto m-2 -mt-10">
            <table class="items-center w-full bg-gray-100 border-collapse mb-4">
               <thead>
                  <tr class="bg-gray-100 text-left">
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Fecha y hora
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Guarda
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Asunto
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Puesto
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Anotaciones
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Foto
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        audio
                     </th>
                  </tr>
               </thead>
               <tbody>
                  <tr v-for="item in datos" :key="item.id">
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ fecha(item.created_at) }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.usuario.name.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.asunto.nombre.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.ubicacion.nombre.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.anotaciones }}
                     </td>

                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        <div class="w-32 lg:w-48 rounded overflow-hidden">
                           <img :src="item.foto" alt="">
                        </div>
                     </td>

                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        <div class="w-32 lg:w-48 rounded overflow-hidden">
                           <audio :src="item.audio" controls></audio>
                        </div>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>

      </div>
   </div>
</template>

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';
import { required } from 'vuelidate/lib/validators';
import moment from 'moment';
export default {
   data() {
      return {
         formData: {
            subject_id: '',
            ubicacion_id: '',
            anotaciones: '',
            imagen: '',
            user_id: '',
            audio: ''
         },
         imgMinuta: '',
         spiner: false,
         submited: false,
         subjects: [],
         ubicaciones: [],
         datos: [],
         id_user: '',
         show: false,
         audioPreview: null
      };
   },

   mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.formData.user_id = user.id;
      this.id_user = user.id;
      if (user.rol === 'ADMINISTRATIVO') {
         this.$router.push('/dashboard');
      }
      this.show = true;
      this.getSubjects();
      this.getUbicaciones();
      this.getRecordsMinutaByUser();
   },

   methods: {
      async getSubjects() {
         await axios.get('/api/getSubjects').then((response) => {
            this.subjects = response.data;
            this.subjects.forEach(item => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      async createAsunto(query) {
         await axios.post('/api/registerSubject', { nombre: query }).then((response) => {
            const item = response.data.res;
            this.subjects.unshift({ id: item.id, nombre: query.toUpperCase(), text: query.toUpperCase() });
            this.$toaster.success('Registro creado con exito.');
         }).catch((errors) => {
            if (errors.response.data.errors && errors.response.data.errors.nombre) {
               this.$toaster.error(errors.response.data.errors.nombre[0]);
            } else {
               this.$toaster.error('Algo salio mal.');
            }
         });
      },

      async getRecordsMinutaByUser() {
         await axios.post('/api/getRecordsMinutaByUser', { user_id: this.id_user }).then((response) => {
            this.datos = response.data
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      async getUbicaciones() {
         await axios.get('/api/getUbicaciones').then((response) => {
            this.ubicaciones = response.data
            this.ubicaciones.forEach((item) => item.text = item.nombre.toUpperCase())
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async createUbicacion(query) {
         await axios.post('/api/registerUbicacion', { nombre: query }).then((response) => {
            const item = response.data.res;
            this.ubicaciones.unshift({ id: item.id, nombre: query.toUpperCase(), text: query.toUpperCase() });
            this.$toaster.success('Registro creado con exito.');
         }).catch((errors) => {
            if (errors.response.data.errors && errors.response.data.errors.nombre) {
               this.$toaster.error(errors.response.data.errors.nombre[0]);
            } else {
               this.$toaster.error('Algo salio mal.');
            }
         });
      },
      async registrar() {
         this.spiner = true;
         let datos = new FormData();
         datos.append('subject_id', this.formData.subject_id);
         datos.append('ubicacion_id', this.formData.ubicacion_id);
         datos.append('anotaciones', this.formData.anotaciones);
         datos.append('user_id', this.formData.user_id);
         datos.append('file', this.formData.imagen);
         datos.append('audio', this.formData.audio);
         // console.log(this.formData)
         await axios.post('/api/registerMinuta', datos).then((response) => {
            this.getRecordsMinutaByUser();
            this.spiner = false
            this.submited = false
            this.formData.subject_id = '';
            this.formData.ubicacion_id = '';
            this.formData.anotaciones = '';
            this.imgMinuta = '';
            this.formData.imagen = '';
            this.formData.audio = '';
            this.audioPreview = '';
            this.$toaster.success('Registro creado con exito.');
         }).catch((errors) => {
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salio mal.');
            console.log(errors.response.data.errors)
         });
      },

      fecha(d) {
         return moment(d).format('DD-MM-YYYY HH:mm:ss');
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
         console.log('audio', file)
         if (file.type.startsWith("audio/")) {
            // Crear una URL para previsualizar el archivo
            this.audioPreview = URL.createObjectURL(file);
            this.formData.audio = file;
         } else {
            alert("Por favor selecciona un archivo de audio válido.");
            this.audioPreview = null;
         }

         // this.cargarImagen(file);
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
         ubicacion_id: { required },
         anotaciones: { required }
      }
   },

   computed: {
      imagenMinuta() {
         return this.imgMinuta;
      },
      audioMinuta() {
         return this.audioPreview;
      },

   },

   components: { TRichSelect }

}
</script>
