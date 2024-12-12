<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-users "></em> Registro de Visitantes
         </h1>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">
         <div class="flex-auto px-4 lg:px-10 py-4 pt-0">
            <form>
               <div class="flex flex-wrap mt-6">
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
                              v-model="formData.anotaciones"></textarea>
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

                        <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure v-if="audioPreview">
                              <audio :src="audioMinuta" controls></audio>
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

                        <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                           <figure v-if="videoPreview">
                              <video :src="videoMinuta" controls></video>
                           </figure>
                        </div>
                     </div>

                  </div>
               </div>
               <div class="flex mb-8 mt-6">
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
                        Tipo
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Visitante/Empleado
                     </th>
                     <th
                        class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Documento
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        EPS
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        ARL
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Entrada/Salida
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Destino
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Observaciones
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        Foto
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        audio
                     </th>
                     <th
                        class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                        video
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
                        {{ item.user.name.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.person.tipo.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.person.nombres.toUpperCase() }} {{ item.person.apellidos.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.person.tipo_documento.documento.toUpperCase() }} : {{ item.person.numero_documento }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.person.eps.nombre.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.person.arl.nombre.toUpperCase() }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.entrada_salida === 'E' ? 'ENTRADA' : 'SALIDA' }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.destino }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        {{ item.observaciones }}
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        <div class="w-32 lg:w-48 h-32 lg:h-48 rounded overflow-hidden">
                           <img :src="item.foto" alt="">
                        </div>
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        <div class="w-32 lg:w-48 rounded overflow-hidden">
                           <audio v-if="item.audio" :src="item.audio" controls></audio>
                        </div>
                     </td>
                     <td
                        class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                        <div class="w-32 lg:w-48 rounded overflow-hidden">
                           <video v-if="item.video" :src="item.video" controls></video>
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
import { required, numeric } from 'vuelidate/lib/validators';
import moment from 'moment';
export default {
   data() {
      return {
         formData: {
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
         datos: [],
         show: false,
         tipos: [{ id: 'EMPLEADO', text: 'EMPLEADO' }, { id: 'VISITANTE', text: 'VISITANTE' }],
         audioPreview: null,
         videoPreview: null,
      };
   },

   mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.formData.user_id = user.id;
      if (user.rol === 'ADMINISTRATIVO') {
         this.$router.push('/dashboard');
      }
      this.show = true;
      this.getEps()
      this.getArls();
      this.getTipoDocumentos();
      this.getRecordsVisitantesByUser();
   },

   methods: {
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

      async getRecordsVisitantesByUser() {
         await axios.post('/api/getRecordsVisitantesByUser', { user_id: this.formData.user_id }).then((response) => {
            this.datos = response.data
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

      async registrar() {
         this.spiner = true;
         let datos = new FormData();
         datos.append('observaciones', this.formData.anotaciones);
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
         datos.append('file', this.formData.imagen);
         datos.append('audio', this.formData.audio);
         datos.append('video', this.formData.video);
         await axios.post('/api/recordVisitante', datos).then((response) => {
            this.getRecordsVisitantesByUser();
            this.spiner = false
            this.submited = false
            this.limpiar();
            this.formData.destino = '';
            this.formData.numero_documento = '';
            this.formData.entrada_salida = '';
            this.formData.anotaciones = '';
            this.imgMinuta = '';
            this.formData.imagen = '';
            this.formData.audio = '';
            this.audioPreview = '';
            this.formData.video = '';
            this.videoPreview = '';
            this.$toaster.success('Registro creado con éxito.');
         }).catch((errors) => {
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salió mal.');
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
         this.registrar();
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