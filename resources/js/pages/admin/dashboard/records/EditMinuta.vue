<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-file-signature"></em> Modificar
            registro</h1>
         <router-link :to="{ name: 'Reportes' }" title="Regresar">
            <div
               class="text-center inline-flex items-center justify-center w-10 h-10 shadow-lg rounded-full bg-red-500 hover:bg-red-600 ease-linear transition-all duration-150">
               <em class="fas fa-arrow-left font-bold text-white"></em>
            </div>
         </router-link>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">
         <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
            <form>
               <div class="flex flex-wrap mt-6">
                  <div class="w-full lg:w-6/12  px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Asunto:
                        </label>
                        <t-rich-select v-model="formData.subject_id" :options="subjects"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.subject_id.required">Seleccione un
                        asunto</p>
                  </div>

                  <div class="w-full lg:w-6/12  px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Ubicación:
                        </label>
                        <t-rich-select v-model="formData.ubicacion_id" :options="ubicaciones"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ubicacion_id.required">
                        Seleccione una ubicación
                     </p>
                  </div>

                  <div class="w-full px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Anotaciones:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <textarea rows="3" class="w-full p-2 border border-1 border-gray-300 rounded-md bg-white"
                              v-model="formData.anotaciones"></textarea>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.anotaciones.required">Ingrese las
                           anotaciones correspondientes</p>
                     </div>
                  </div>
               </div>

               <div class="flex flex-col w-full">
                  <div class="flex flex-col lg:flex-row lg:flex-wrap w-full justify-center">

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4"
                        v-if="verificarPermiso('Adjuntar foto')">
                        <label
                           class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                           <em class="fas fa-cloud-upload-alt fa-3x"></em>
                           <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                           <input type='file' class="opacity-0" accept="image/*" @change="obtenerImagen" />
                        </label>
                        <div v-if="!imagenMinuta" class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <img :src="imagen">
                           </figure>
                        </div>
                        <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <img :src="imagenMinuta" alt="">
                           </figure>
                        </div>
                     </div>

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4"
                        v-if="verificarPermiso('Grabar audio')">
                        <label
                           class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                           <em class="fas fa-music fa-3x"></em>
                           <span class="mt-2 text-sm font-semibold">Adjuntar Audio</span>
                           <input type='file' accept="audio/*" class="opacity-0" @change="obtenerAudio" />

                        </label>

                        <div v-if="!audioMinuta" class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <audio :src="audio" controls></audio>
                           </figure>
                        </div>
                        <div v-if="audioMinuta" class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <audio :src="audioMinuta" alt="" controls></audio>
                           </figure>
                        </div>
                     </div>

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4"
                        v-if="verificarPermiso('Grabar video')">
                        <label
                           class="w-full h-36 flex flex-col items-center px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                           <em class="fas fa-video fa-3x"></em>
                           <span class="mt-2 text-sm font-semibold">Adjuntar Video</span>
                           <input type='file' accept="video/mp4,video/x-m4v,video/*" class="opacity-0"
                              @change="obtenerVideo" />
                        </label>

                        <div v-if="!videoMinuta" class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <video :src="video" controls></video>
                           </figure>
                        </div>
                        <div v-if="videoMinuta" class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure>
                              <video :src="videoMinuta" alt="" controls></video>
                           </figure>
                        </div>
                     </div>

                  </div>
               </div>

               <div class="flex p-6 -mt-20 md:mt-0">
                  <button
                     class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 ease-linear transition-all duration-150"
                     type="button" @click="validarDatos">
                     <p v-if="!spiner">Guardar cambios</p>
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
import { hasPermission } from '../../../../../js/utils/util';
export default {
   data() {
      return {
         formData: {
            id: this.$route.params.id,
            subject_id: '',
            ubicacion_id: '',
            anotaciones: '',
            imagen: '',
            user_id: '',
            audio: '',
            video: '',
            sede_id: '',
         },
         imgMinuta: '',
         spiner: false,
         submited: false,
         subjects: [],
         ubicaciones: [],
         id_user: '',
         imagen: '',
         show: false,
         audio: '',
         audioPreview: null,
         video: '',
         videoPreview: null,
         sede: {},
         permisosFormulario: JSON.parse(localStorage.getItem('permisosFormulario') || '[]'),
      };
   },

   async mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.sede = JSON.parse(localStorage.getItem('sede'));
      this.formData.user_id = user.id;
      this.id_user = user.id;
      const rol = localStorage.getItem('rol');
      if (rol !== 'ADMINISTRADOR') {
         this.$router.push('/dashboard');
         return;
      }
      this.show = true;
      this.getSubjects();
      await this.getUbicaciones();
      axios.get('/api/getRecordMinuta/' + this.formData.id).then((response) => {
         this.imagen = response.data.foto;
         this.audio = response.data.audio;
         this.video = response.data.video;
         this.formData = response.data;
      });
   },

   methods: {
      verificarPermiso(permissionName) {
         return hasPermission(this.permisosFormulario, permissionName);
      },

      async getSubjects() {
         await axios.get('/api/getSubjects').then((response) => {
            this.subjects = response.data;
            this.subjects.forEach(item => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors);
         });
      },

      async getUbicaciones() {
         const url = `/api/getUbicaciones${this.sede?.id ? `?sede_id=${this.sede.id}` : ''}`;
         try {
            const response = await axios.get(url);
            this.ubicaciones = response.data;
            this.ubicaciones.forEach((item) => item.text = item.nombre.toUpperCase())
         } catch (errors) {
            console.log(errors.response.data.errors);
         }
      },
      async actualizar() {
         this.spiner = true;
         let datos = new FormData();
         datos.append('subject_id', this.formData.subject_id);
         datos.append('ubicacion_id', this.formData.ubicacion_id);
         datos.append('anotaciones', this.formData.anotaciones);
         datos.append('user_id', this.formData.user_id);
         datos.append('id', this.formData.id);
         datos.append('imagen', this.imagen);
         datos.append('file', this.formData.imagen);
         datos.append('audio', this.formData.audio);
         datos.append('audioOrigin', this.audio);
         datos.append('video', this.formData.video);
         datos.append('videoOrigin', this.video);
         datos.append('sede_id', this.formData.sede_id);
         try {
            await axios.post('/api/updateRecordMinuta', datos);
            this.spiner = false
            this.submited = false
            this.$toaster.success('Registro actualizado con éxito.');
         } catch (errors) {
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salió mal.');
            console.log(errors.response.data.errors);
         }
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
      obtenerVideo(e) {
         let file = e.target.files[0];
         if (!file) {
            this.videoPreview = '';
            return;
         }

         if (file.type.startsWith("video/")) {
            this.videoPreview = URL.createObjectURL(file);
            this.formData.video = file;
         } else {
            this.$toaster.error("Por favor selecciona un archivo de video válido.");
            this.videoPreview = null;
         }
      },
      cargarImagen(file) {
         let reader = new FileReader();
         reader.onload = (e) => {
            this.imgMinuta = e.target.result;
         }
         reader.readAsDataURL(file);
      },

      async validarDatos() {
         this.submited = true;
         this.$v.$touch();
         if (this.$v.$invalid) {
            this.spiner = false;
            return false;
         }
         await this.actualizar();
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
      videoMinuta() {
         return this.videoPreview;
      },

   },

   components: { TRichSelect }

}
</script>