<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><i class="fas fa-user-plus"></i> Registrar nuevo usuario</h1>
         <router-link :to="{ name: 'Usuarios'}" title="Regresar">
            <div
               class="text-center inline-flex items-center justify-center w-10 h-10 shadow-lg rounded-full bg-red-500 hover:bg-red-600 ease-linear transition-all duration-150"
               >
                  <em class="fas fa-arrow-left font-bold text-white"></em>
            </div>
         </router-link>
      </div>
      <div class="flex flex-col min-w-0 w-full shadow-lg my-8 rounded-lg bg-gray-100 border-1">         
         <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
            <form>
            
            <div class="flex flex-wrap mt-10">

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Nombre:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-user"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.name"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.name.required">Ingrese el nombre del usuario</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Tipo de documento:
                  </label>
                  <select v-model="formData.tipo_documento_id" class="w-full px-3 py-3 pr-8 text-gray-600 bg-white rounded text-md shadow cursor-pointer">
                     <option v-for="tipoDoc in tipoDocumentos" :key="tipoDoc.id" :value="tipoDoc.id"> {{ tipoDoc.documento.toUpperCase() }}</option>                     
                  </select>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipo_documento_id.required">Seleccione un tipo de documento</p>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Número documento:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-address-card"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.numero_documento"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.numero_documento.required">Ingrese el número de documento</p>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.numero_documento.numeric">Ingrese solo números</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Fecha de nacimiento:
                     </label>
                     <div class="relative flex w-full flex-wrap items-stretch mb-3">
                        <input 
                           type="date" 
                           v-model="formData.fecha_nacimiento"
                           class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full"/>
                     </div>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fecha_nacimiento.required">Ingrese la fecha de nacimiento</p>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Dirección de residencia:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-map-marker-alt"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.direccion"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.direccion.required">Ingrese la dirección</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Ciudad:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-globe-americas"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.ciudad"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ciudad.required">Ingrese la ciudad</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Teléfono uno:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-phone"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.telefono_uno"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefono_uno.required">Ingrese el teléfono</p>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefono_uno.numeric">Ingrese solo numeros</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Teléfono dos:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-phone"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.telefono_dos"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefono_dos.numeric">Ingrese solo numeros</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Correo electrónico:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-envelope"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.email"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.email.required">Ingrese el correo electrónico</p>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.email.email">El correo electrónico no es valido</p>
                  </div>
               </div>

               

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                  <label
                     class="block text-gray-600 text-sm font-semibold mb-2"
                     htmlFor="grid-password"
                  >
                     Contraseña:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                     <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-key"></em>
                     </span>
                     <input 
                        type="text" 
                        v-model="formData.password"
                        class="px-3 py-3 placeholder-gray-300 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.password.required">Ingrese una contraseña</p>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.password.minLength">La contraseña debe tener 6 caracteres como mínimo</p>
                  </div>
               </div>

               <div class="w-full lg:w-4/12 px-4">
                  <div class="relative w-full mb-3">
                     <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                     >
                        Rol:
                     </label>
                     <select name="rol" v-model="formData.rol"  class="w-full px-3 py-3 pr-8 text-gray-600 bg-white rounded text-md shadow cursor-pointer">
                        <option value="ADMINISTRADOR"> ADMINISTRADOR</option> 
                        <option value="ADMINISTRATIVO"> ADMINISTRATIVO</option> 
                        <option value="GUARDA DE SEGURIDAD"> GUARDA DE SEGURIDAD</option> 
                     </select>
                     <p class="text-red-500 text-sm" v-if="submited && !$v.formData.rol.required">Seleccione un rol</p>
                  </div>
               </div>
               <div class="w-full lg:w-4/12 px-4">
                <div class="relative w-full mb-3">
                  <label
                    class="block text-gray-600 text-sm font-semibold mb-2"
                    htmlFor="grid-password"
                  >
                    Puestos:
                  </label>
                  <multiselect
                    v-model="puestosSelected"
                    :options="puestos"
                    :multiple="true"
                    :searchable="true"
                    :close-on-select="false"
                    label="nombre"
                    track-by="id"
                    placeholder="Selecciona las opciones"
                    class="w-full"
                    :show-labels="false"
                    @close="onPuestosChange"
                  />
                </div>
              </div>
              <div class="w-full lg:w-4/12 px-4">
                <div class="relative w-full mb-3">
                  <label
                    class="block text-gray-600 text-sm font-semibold mb-2"
                    htmlFor="grid-password"
                  >
                    Sedes:
                  </label>
                  <multiselect
                    v-model="sedesSelected"
                    :options="sedes"
                    :multiple="true"
                    :searchable="true"
                    :close-on-select="false"
                    label="nombre"
                    track-by="id"
                    placeholder="Selecciona las opciones"
                    class="w-full"
                    :show-labels="false"
                    :disabled="puestosSelected.length === 0"
                  />
                </div>
              </div>                              
            </div>
            
            <div class="flex p-6">
               <button 
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                  type="button"
                  @click="registrarUser">
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
import { required, email, minLength, numeric } from 'vuelidate/lib/validators';
import Multiselect from 'vue-multiselect';
import 'vue-multiselect/dist/vue-multiselect.min.css';

export default {
   components: {
      Multiselect
   },
   data() {
      return {
         submited: false,
         formData: {
            name: '',
            email: '',
            password: '',
            rol: '',
            tipo_documento_id: '',
            numero_documento: '',
            direccion: '',
            ciudad: '',
            telefono_uno: '',
            telefono_dos: '',
            fecha_nacimiento: '',
         },
         puestos: [],
         puestosSelected: [],
         sedes: [],
         sedesSelected: [],
         spiner: false,
         tipoDocumentos: [],
         show: false
      };
   },

   async mounted() {
      const rol = localStorage.getItem('rol');
      if (rol !== 'ADMINISTRADOR'){
         this.$router.push('/dashboard');
      }
      try {
         await this.getClients();
         this.show = true;
         await this.getTipoDocumentos();
      } catch (error) {
         console.error("Error en al cargar los elementos:", error);
      }
   },

   methods: {
      async getTipoDocumentos(){
         await axios.get('/api/getDocumentos').then((response) => {
            this.tipoDocumentos = response.data
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      registrarUser(){
         this.error = false;
         this.spiner = true;
         this.validarDatos()         
      },

      async register() {
         try {
            const response = await axios.post('/api/register', this.formData);

            if (response.status === 200) {
               const user_id = response.data.user_id;
               const sedes = this.sedesSelected.map(option => option.id);
               const data = { user_id, sedes };
               await axios.post('/api/registerUserSede', data);
            }
            
            this.formData.name = this.formData.email = this.formData.password = '';
            this.formData.tipo_documento_id = this.formData.numero_documento = this.formData.fecha_nacimiento = '';
            this.formData.direccion = this.formData.ciudad = this.formData.telefono_uno = '';
            this.formData.telefono_dos = '';
            this.puestosSelected = this.sedesSelected = this.puestos = this.sedes = [];
            
            this.$router.push('/usuarios');
            this.$toaster.success('Registro creado con exito.');
         } catch (errors) {
            this.spiner = false;            
            if (errors.response && errors.response.data.errors.email) {
                  this.$toaster.error(errors.response.data.errors.email[0]);
            } else {
                  this.$toaster.error('Ocurrió un error');
            }
         }
      },

      validarDatos(){
            this.submited = true;
            this.$v.$touch();
            if(this.$v.$invalid){
               this.spiner = false;
               return false;
            }   
            this.register();          
      },
      
      async getClients(){
         await axios.get('/api/getClients').then((response) => {
         this.puestos = response.data.filter((item) => item.estado === 'ACTIVO');
         this.puestos.forEach((item) => {
            item.nombre = item.nombre.toUpperCase();
         });            
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getSedesByIds(data){
         const ids = {'client_ids': data}
         await axios.get('/api/getSedesByClients', {params: ids}).then((response) => {
         this.sedes = response.data.sedes.filter((item) => item.estado === 'ACTIVO');
         this.sedes.forEach((item) => {
            item.nombre = item.nombre.toUpperCase();
         });            
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },

      onPuestosChange() {
         if (this.puestosSelected.length > 0) {
            const puestosIds = this.puestosSelected.map((puesto) => puesto.id);
            this.getSedesByIds(puestosIds);
         } else {
            this.sedes = [];
         }
      },
      
   },

   validations: {
      formData: {
         name: { required },
         email: { required, email },
         password: { required, minLength: minLength(6)  },   
         rol: { required },         
         tipo_documento_id: { required },         
         numero_documento: { required, numeric },         
         direccion: { required },         
         ciudad: { required },         
         telefono_uno: { required, numeric },         
         telefono_dos: { numeric },         
         fecha_nacimiento: { required }     
      }        
    }
}
</script>