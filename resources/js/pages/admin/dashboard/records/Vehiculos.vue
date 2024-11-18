<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-car"></em> Registro de Vehículos</h1>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">         
         <div class="flex-auto px-4 lg:px-10 py-5 pt-0">
            <form>
               <div class="flex flex-wrap mt-6">
                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Placa:
                     </label>
                        <t-rich-select
                           v-model="formData.vehicle_id"
                           :options="vehicles"
                           placeholder="Seleccione una opción"
                        >
                           <template
                              slot="dropdownDown"
                              slot-scope="{ query }"
                           >
                              <div
                              v-if="query"
                              class="text-center"
                              >
                              <button
                                 type="button"
                                 class="block w-full p-3 text-white bg-blue-500 border hover:bg-blue-600"
                                 @click="createVehicle(query)"
                              >
                                 Crear vehículo: {{ query }}
                              </button>
                              </div>
                           </template>
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.vehicle_id.required">Seleccione una placa</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Conductor:
                     </label>
                        <t-rich-select
                           v-model="formData.driver_id"
                           :options="drivers"
                           placeholder="Seleccione una opción"
                           @change="onChange"
                        >
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.driver_id.required">Seleccione un conductor</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                        <label
                           class="block text-gray-600 text-sm font-semibold mb-2"
                           htmlFor="grid-password"
                        >
                           C.C conductor:
                        </label>
                        <div class="relative flex w-full flex-wrap items-stretch mb-3">
                           <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                              <em class="fas fa-id-card"></em>
                           </span>
                           <input 
                              type="text" 
                              v-model="documento"
                              disabled
                              class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                        </div>
                     </div>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Procedencia:
                     </label>
                        <t-rich-select
                           v-model="formData.origin_id"
                           :options="origins"
                           placeholder="Seleccione una opción"
                        >
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.origin_id.required">Seleccione una procedencia</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Vehículo:
                     </label>
                        <t-rich-select
                           v-model="formData.volqueta_id"
                           :options="volquetas"
                           placeholder="Seleccione una opción"
                        >
                        </t-rich-select>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.volqueta_id.required">Seleccione una volqueta</p>
                  </div>

                  <div class="w-full lg:w-4/12 px-4">
                     <div class="m-1">
                        <label
                           class="block text-gray-600 text-sm font-semibold mb-2"
                           htmlFor="grid-password"
                        >
                           Tipo de registro:
                        </label>
                        <div class="mt-2">
                           <label class="inline-flex items-center cursor-pointer">
                              <input type="radio" class="form-radio border border-1 border-gray-400" name="accountType" value="E" v-model="formData.entrada_salida">
                              <span class="ml-2 text-gray-600 text-sm font-semibold">Entrada</span>
                           </label>
                           <label class="inline-flex items-center ml-6 cursor-pointer">
                              <input type="radio" class="form-radio border border-1 border-gray-400" name="accountType" value="S" v-model="formData.entrada_salida">
                              <span class="ml-2 text-gray-600 text-sm font-semibold">Salida</span>
                           </label>
                        </div>
                     </div>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.entrada_salida.required">Seleccione una opción</p>
                  </div>

                  <div class="w-full px-4">
                     <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Observaciones:
                     </label>
                     <div class="relative flex w-full flex-wrap items-stretch mb-3">
                        <textarea
                           rows="3"
                           class="w-full p-2 border border-1 border-gray-300 rounded-md"
                           v-model="formData.anotaciones"
                        ></textarea>
                     </div>
                     </div>
                  </div>
               </div>                    

                
               <div class="flex flex-col md:flex-row items-center">
                  <div class="mr-6">
                     <label
                        class="w-60 h-36 flex flex-col items-center ml-4 mt-5 px-4 py-6 bg-white rounded-md shadow-md tracking-wide border border-blue cursor-pointer hover:bg-blue-500 hover:text-white text-blue-500 ease-linear transition-all duration-150">
                        <em class="fas fa-cloud-upload-alt fa-3x"></em>
                        <span class="mt-2 text-sm font-semibold">Adjuntar foto</span>
                        <input type='file' class="opacity-0" @change="obtenerImagen"/>
                     
                     </label>                  
                     
                  </div>
                  <div class="w-full md:w-60 mt-4 p-12 md:p-0 rounded-md overflow-hidden">
                     <figure>
                        <img :src="imagenMinuta" alt="">
                     </figure>
                  </div>
                  
               </div>
               <div class="flex p-6 -mt-20 md:mt-0">
                  <button 
                     class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                     type="button"
                     @click="validarDatos">
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
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Fecha y hora
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Guarda
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Vehículo
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Conductor
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Procedencia
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Tipo vehículo
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Entrada o salida
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Observaciones
                     </th>
                     <th
                     class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                     >
                     Foto
                     </th>
               </tr>
               </thead>
               <tbody>
               <tr v-for="item in datos" :key="item.id">
                     <td               
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ fecha(item.created_at) }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.user.name.toUpperCase() }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.vehicle.placa.toUpperCase() }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.driver.nombre.toUpperCase() }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.origin.nombre.toUpperCase() }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.volqueta.nombre.toUpperCase() }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.entrada_salida === 'E' ? 'ENTRADA' : 'SALIDA' }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     {{ item.observaciones }}
                     </td>
                     <td
                     class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2"
                     >
                     <div class="w-32 lg:w-48 rounded overflow-hidden">
                        <img :src="item.foto" alt="">
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
            vehicle_id: '',
            driver_id: '',
            origin_id: '',
            volqueta_id: '',
            user_id: '',
            anotaciones: '',
            imagen: '',
            entrada_salida: ''
         }, 
         imgMinuta: '',
         spiner: false,
         submited: false,
         vehicles: [],
         origins: [],
         drivers: [],
         volquetas: [],
         documento: '',
         datos: [],
         id_user: '',
         show: false
      };
   },

   mounted() {
      const user = JSON.parse(localStorage.getItem('user'));
      this.formData.user_id = user.id;
      this.id_user = user.id;
      if(user.rol === 'ADMINISTRATIVO'){
         this.$router.push('/dashboard');
      }
      this.show = true;
      this.getVehicles()
      this.getDrivers();
      this.getOrigins();
      this.getVolquetas();
      this.getRecordsVehiculosByUser();
   },

   methods: {
      async getVehicles(){
         await axios.get('/api/getVehiculos').then((response) => {
            this.vehicles = response.data;
            this.vehicles.forEach((item) => item.text = item.placa.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      async createVehicle(query) {
         await axios.post('/api/registerVehiculo', {placa: query}).then((response) => { 
            const item = response.data.res;
            this.vehicles.unshift({id: item.id, placa: query.toUpperCase(), text: query.toUpperCase()});
            this.$toaster.success('Registro creado con exito.');
         }).catch((errors) => {
            if (errors.response.data.errors && errors.response.data.errors.placa){
               this.$toaster.error(errors.response.data.errors.placa[0]);
            }else{
               this.$toaster.error('Algo salio mal.');
            }
         });
      },

      async getDrivers(){
         await axios.get('/api/getConductores').then((response) => {
            this.drivers = response.data;
            this.drivers.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getOrigins(){
         await axios.get('/api/getProcedencias').then((response) => {
            this.origins = response.data;
            this.origins.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getVolquetas(){
         await axios.get('/api/getVolquetas').then((response) => {
            this.volquetas = response.data;
            this.volquetas.forEach((item) => item.text = item.nombre.toUpperCase());
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      async getRecordsVehiculosByUser(){
         await axios.post('/api/getRecordsVehiculosByUser', {user_id: this.id_user}).then((response) => {
            this.datos = response.data
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      onChange() {
         const driver = this.drivers.find((d) => d.id === this.formData.driver_id);
         if(driver){
            this.documento = driver.numero_documento;
         }
      }, 
      async registrar(){
         this.spiner = true;
         let datos = new FormData();
         datos.append('observaciones', this.formData.anotaciones);
         datos.append('entrada_salida', this.formData.entrada_salida);
         datos.append('vehicle_id', this.formData.vehicle_id);
         datos.append('driver_id', this.formData.driver_id);
         datos.append('origin_id', this.formData.origin_id);
         datos.append('volqueta_id', this.formData.volqueta_id);
         datos.append('user_id', this.formData.user_id);
         datos.append('file', this.formData.imagen);
         await axios.post('/api/recordVehicle', datos).then( (response) => {
            this.getRecordsVehiculosByUser();
            this.spiner = false
            this.submited = false
            this.formData.vehicle_id = '';
            this.formData.driver_id = '';
            this.formData.origin_id = '';
            this.formData.volqueta_id = '';
            this.formData.entrada_salida = '';
            this.documento = '';
            this.formData.anotaciones = '';
            this.imgMinuta = '';
            this.formData.imagen = '';
            this.$toaster.success('Registro creado con exito.');
         }).catch((errors) =>{
            this.spiner = false
            this.submited = false
            this.$toaster.error('Algo salio mal.');
            console.log(errors.response.data.errors)
         }); 
      },
      
      fecha(d){
        return moment(d).format('DD-MM-YYYY HH:mm:ss');    
      },

      obtenerImagen(e){
         let file = e.target.files[0];
         this.formData.imagen = file;
         this.cargarImagen(file);
      },

      cargarImagen(file){
         let reader = new FileReader();
         reader.onload = (e) => {
            this.imgMinuta = e.target.result;
         }
         reader.readAsDataURL(file);
      },

      validarDatos(){
         this.submited = true;
         this.$v.$touch();
         if(this.$v.$invalid){
            this.spiner = false;
            return false;
         }   
         this.registrar();          
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
      imagenMinuta(){
         return this.imgMinuta;
      },
      
   },

   components: { TRichSelect }

}
</script>