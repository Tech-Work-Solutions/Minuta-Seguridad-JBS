<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-users "></em> Registro de Visitantes
         </h1>
         <router-link :to="{ name: 'Reportes' }" title="Regresar">
            <div
               class="text-center inline-flex items-center justify-center w-10 h-10 shadow-lg rounded-full bg-red-500 hover:bg-red-600 ease-linear transition-all duration-150">
               <em class="fas fa-arrow-left font-bold text-white"></em>
            </div>
         </router-link>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg my-8 rounded-lg bg-gray-100 border-1">
         <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
            <form>
               <div class="flex flex-wrap mt-10">
                  <!-- Input de busqueda de la persona -->
                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Número documento:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span
                              class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-id-card"></em>
                           </span>
                           <div class="flex w-full items-center">
                              <input type="text" v-model="formData.numero_documento" v-on:keyup.enter="searchPerson"
                                 class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                              <div title="Agregar beneficio" @click="searchPerson"
                                 class="text-center inline-flex items-center cursor-pointer rounded-sm justify-center w-10 h-10 shadow-lg bg-blue-500 hover:bg-blue-700 ease-linear transition-all duration-150">
                                 <em v-if="!load" class="fas fa-search text-xl font-bold text-white"></em>
                                 <em v-else class="fas fa-spinner fa-pulse text-xl font-bold text-white"></em>
                              </div>
                           </div>
                        </div>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.numero_documento.required">
                           Ingrese el número de documento</p>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.numero_documento.numeric">Ingrese
                           solo numeros</p>
                     </div>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Tipo de documento:
                        </label>
                        <t-rich-select v-model="formData.tipo_documento_id" :options="tipoDocumentos"
                           placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipo_documento_id.required">
                        Seleccione un tipo de documento</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Tipo:
                        </label>
                        <t-rich-select v-model="formData.tipo" :options="tipos" placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipo.required">Seleccione una opcion
                     </p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Nombres:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span
                              class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-user"></em>
                           </span>
                           <input type="text" v-model="formData.nombres"
                              class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                        </div>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombres.required">Ingrese el nombre
                     </p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Apellidos:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span
                              class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-user"></em>
                           </span>
                           <input type="text" v-model="formData.apellidos"
                              class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                        </div>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.apellidos.required">Ingrese el
                        apellido</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Destino:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span
                              class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-user"></em>
                           </span>
                           <input type="text" v-model="formData.destino"
                              class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                        </div>
                     </div>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           EPS:
                        </label>
                        <t-rich-select v-model="formData.eps_id" :options="epss" placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.eps_id.required">Seleccione una EPS
                     </p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           ARL:
                        </label>
                        <t-rich-select v-model="formData.arl_id" :options="arls" placeholder="Seleccione una opción">
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.arl_id.required">Seleccione una ARL
                     </p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="m-1">
                        <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                           Tipo de registro
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
               <div class="flex p-6">
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
import { required, numeric } from 'vuelidate/lib/validators';
import moment from 'moment';
export default {
   data() {
      return {
         formData: {
            id: this.$route.params.id,
            numero_documento: '',
            tipo_documento_id: '',
            nombres: '',
            apellidos: '',
            user_id: '',
            eps_id: '',
            arl_id: '',
            entrada_salida: '',
            destino: '',
            anotaciones: '',
            tipo: '',
            imagen: '',
            audio: '',
            video: '',
         },
         imgMinuta: '',
         spiner: false,
         submited: false,
         epss: [],
         arls: [],
         tipoDocumentos: [],
         load: false,
         show: false,
         imagen: '',
         tipos: [{ id: 'EMPLEADO', text: 'EMPLEADO' }, { id: 'VISITANTE', text: 'VISITANTE' }],
         audio: '',
         audioPreview: null,
         video: '',
         videoPreview: null,
      };
   },

   mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.formData.user_id = user.id;
      const rol = localStorage.getItem('rol');
      if (rol !== 'ADMINISTRADOR') {
         this.$router.push('/dashboard');
         return;
      }
      this.show = true;
      this.getEps()
      this.getArls();
      this.getTipoDocumentos();
      this.getRecord();
   },

   methods: {
      async getRecord() {
         await axios.get('/api/getRecordVisitante/' + this.formData.id).then((response) => {
            const { person } = response.data;
            this.imagen = response.data.foto;
            this.audio = response.data.audio;
            this.video = response.data.video;
            this.formData.numero_documento = person.numero_documento;
            this.formData.tipo_documento_id = person.tipo_documento_id;
            this.formData.tipo = person.tipo;
            this.formData.nombres = person.nombres;
            this.formData.apellidos = person.apellidos;
            this.formData.eps_id = person.eps_id;
            this.formData.arl_id = person.arl_id;
            this.formData.entrada_salida = response.data.entrada_salida;
            this.formData.destino = response.data.destino;
            this.formData.observaciones = response.data.observaciones;
         });
      },

      async getEps() {
         await axios.get('/api/getEps').then((response) => {
            this.epss = response.data;
            this.epss.forEach(item => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getArls() {
         await axios.get('/api/getArls').then((response) => {
            this.arls = response.data;
            this.arls.forEach(item => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getTipoDocumentos() {
         await axios.get('/api/getDocumentos').then((response) => {
            this.tipoDocumentos = response.data;
            this.tipoDocumentos.forEach(item => item.text = item.documento.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      searchPerson() {
         this.load = true;
         axios.post('/api/getPerson', { numero_documento: this.formData.numero_documento }).then((resp) => {
            if (resp.data && resp.data !== '') {
               this.formData.tipo_documento_id = resp.data.tipo_documento_id;
               this.formData.tipo = resp.data.tipo;
               this.formData.nombres = resp.data.nombres;
               this.formData.apellidos = resp.data.apellidos;
               this.formData.eps_id = resp.data.eps_id;
               this.formData.arl_id = resp.data.arl_id;
            } else {
               this.limpiar();
               this.$toaster.info('El usuario no se encuentra registrado en la base de datos');
            }
            this.load = false;
         })
      },

      async actualizar() {
         this.spiner = true;
         let datos = new FormData();
         datos.append('id', this.formData.id);
         datos.append('observaciones', this.formData.observaciones);
         datos.append('entrada_salida', this.formData.entrada_salida);
         datos.append('numero_documento', this.formData.numero_documento);
         datos.append('tipo_documento_id', this.formData.tipo_documento_id);
         datos.append('tipo', this.formData.tipo);
         datos.append('eps_id', this.formData.eps_id);
         datos.append('arl_id', this.formData.arl_id);
         datos.append('destino', this.formData.destino);
         datos.append('nombres', this.formData.nombres);
         datos.append('apellidos', this.formData.apellidos);
         datos.append('user_id', this.formData.user_id);
         datos.append('imagen', this.imagen);
         datos.append('file', this.formData.imagen);
         datos.append('audio', this.formData.audio);
         datos.append('audioOrigin', this.audio);
         datos.append('video', this.formData.video);
         datos.append('videoOrigin', this.video);
         await axios.post('/api/updateRecordVisitante', datos).then((response) => {
            this.spiner = false
            this.submited = false
            this.$toaster.success('Registro actualizado con exito.');
         }).catch((errors) => {
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salio mal.');
            console.log(errors.response.data.errors)
         });
      },

      limpiar() {
         this.formData.tipo_documento_id = '';
         this.formData.tipo = '';
         this.formData.nombres = '';
         this.formData.apellidos = '';
         this.formData.eps_id = '';
         this.formData.arl_id = '';
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
         numero_documento: { required, numeric },
         tipo_documento_id: { required },
         tipo: { required },
         nombres: { required },
         apellidos: { required },
         entrada_salida: { required },
         eps_id: { required },
         arl_id: { required }
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