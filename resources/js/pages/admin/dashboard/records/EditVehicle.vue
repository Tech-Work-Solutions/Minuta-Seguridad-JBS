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
                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Placa:
                        </label>
                        <t-rich-select v-model="formData.vehicle_id" :options="vehicles"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.vehicle_id.required">Seleccione una
                        placa</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Conductor:
                        </label>
                        <t-rich-select v-model="formData.driver_id" :options="drivers"
                           placeholder="Seleccione una opción" @change="onChange">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.driver_id.required">Seleccione un
                        conductor</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           C.C conductor:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span
                              class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-id-card"></em>
                           </span>
                           <input type="text" v-model="documento" disabled
                              class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                        </div>
                     </div>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Procedencia:
                        </label>
                        <t-rich-select v-model="formData.origin_id" :options="origins"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.origin_id.required">Seleccione una
                        procedencia</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Vehículo:
                        </label>
                        <t-rich-select v-model="formData.volqueta_id" :options="volquetas"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.volqueta_id.required">Seleccione una
                        volqueta</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="m-1">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Tipo de registro:
                        </label>
                        <div class="mt-2">
                           <label class="inline-flex items-center cursor-pointer">
                              <input type="radio" class="form-radio border border-1 border-gray-400" name="accountType"
                                 value="E" v-model="formData.entrada_salida">
                              <span class="ml-2 text-gray-600 text-sm font-semibold">Entrada</span>
                           </label>
                           <label class="inline-flex items-center ml-6 cursor-pointer">
                              <input type="radio" class="form-radio border border-1 border-gray-400" name="accountType"
                                 value="S" v-model="formData.entrada_salida">
                              <span class="ml-2 text-gray-600 text-sm font-semibold">Salida</span>
                           </label>
                        </div>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.entrada_salida.required">Seleccione
                        una opción</p>
                  </div>

                  <div class="w-full px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Observaciones:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <textarea rows="3" class="w-full p-2 border border-1 border-gray-300 rounded-md"
                              v-model="formData.observaciones"></textarea>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="flex flex-col w-full">
                  <div class="flex flex-col lg:flex-row lg:flex-wrap w-full justify-center">

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
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

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
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

                     <div class="flex flex-col items-center w-full lg:w-60 mt-5 lg:mt-0 lg:ml-4">
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
                     class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
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
import moment from 'moment';
export default {
   data() {
      return {
         formData: {
            id: this.$route.params.id,
            vehicle_id: '',
            driver_id: '',
            origin_id: '',
            volqueta_id: '',
            user_id: '',
            observaciones: '',
            imagen: '',
            entrada_salida: '',
            audio: '',
            video: '',
         },
         imgMinuta: '',
         spiner: false,
         submited: false,
         vehicles: [],
         origins: [],
         drivers: [],
         volquetas: [],
         documento: '',
         id_user: '',
         show: false,
         imagen: '',
         audio: '',
         audioPreview: null,
         video: '',
         videoPreview: null,
      };
   },

   mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.formData.user_id = user.id;
      this.id_user = user.id;
      const rol = localStorage.getItem('rol');
      if (rol !== 'ADMINISTRADOR') {
         this.$router.push('/dashboard');
         return;
      }
      this.show = true;
      this.getVehicles()
      this.getDrivers();
      this.getOrigins();
      this.getVolquetas();
      axios.get('/api/getRecordVehicle/' + this.formData.id).then((response) => {
         this.documento = response.data.driver.numero_documento;
         this.imagen = response.data.foto;
         this.audio = response.data.audio;
         this.video = response.data.video;
         this.formData = response.data
      });
   },

   methods: {
      async getVehicles() {
         await axios.get('/api/getVehiculos').then((response) => {
            this.vehicles = response.data;
            this.vehicles.forEach((item) => item.text = item.placa.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getDrivers() {
         await axios.get('/api/getConductores').then((response) => {
            this.drivers = response.data;
            this.drivers.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getOrigins() {
         await axios.get('/api/getProcedencias').then((response) => {
            this.origins = response.data;
            this.origins.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getVolquetas() {
         await axios.get('/api/getVolquetas').then((response) => {
            this.volquetas = response.data;
            this.volquetas.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      onChange() {
         const driver = this.drivers.find((d) => d.id === this.formData.driver_id);
         if (driver) {
            this.documento = driver.numero_documento;
         }
      },

      async actualizar() {
         this.spiner = true;
         let datos = new FormData();
         datos.append('id', this.formData.id);
         datos.append('observaciones', this.formData.observaciones);
         datos.append('entrada_salida', this.formData.entrada_salida);
         datos.append('vehicle_id', this.formData.vehicle_id);
         datos.append('driver_id', this.formData.driver_id);
         datos.append('origin_id', this.formData.origin_id);
         datos.append('volqueta_id', this.formData.volqueta_id);
         datos.append('user_id', this.formData.user_id);
         datos.append('imagen', this.imagen);
         datos.append('file', this.formData.imagen);
         datos.append('audio', this.formData.audio);
         datos.append('audioOrigin', this.audio);
         datos.append('video', this.formData.video);
         datos.append('videoOrigin', this.video);
         datos.append('sede_id', this.formData.sede_id);
         await axios.post('/api/updateRecordVehicle', datos).then((response) => {
            this.spiner = false
            this.submited = false
            this.$toaster.success('Registro actualizado con éxito.');
         }).catch((errors) => {
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salió mal.');
            console.log(errors.response.data.errors);
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

         if (file.type.startsWith("audio/")) {
            this.audioPreview = URL.createObjectURL(file);
            this.formData.audio = file;
         } else {
            alert("Por favor selecciona un archivo de audio válido.");
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
            alert("Por favor selecciona un archivo de video válido.");
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

      validarDatos() {
         this.submited = true;
         this.$v.$touch();
         if (this.$v.$invalid) {
            this.spiner = false;
            return false;
         }
         this.actualizar();
      },
   },

   validations: {
      formData: {
         vehicle_id: { required },
         driver_id: { required },
         volqueta_id: { required },
         origin_id: { required },
         entrada_salida: { required }
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