<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-user-plus"></em> Editar usuario</h1>
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
            </div>
            <div class="space-y-4">
               <div class="p-4 bg-gray-100 rounded-md shadow">
                  <h3 class="text-sm text-gray-500 font-bold mb-4">Agregar Puesto y Sede</h3>
                  <div class="mb-4">
                     <label class="block text-sm text-gray-500 font-semibold mb-2">Puesto:</label>
                     <t-rich-select 
                        v-model="selectedPuesto" 
                        :options="puestos"                     
                        placeholder="Selecciona un puesto" 
                        class="z-50"
                        @change="getSedesByPuesto2"
                     />
                  </div>
                  <div class="mb-4">
                     <label class="block text-sm text-gray-500 font-semibold mb-2">Sede:</label>
                     <t-rich-select 
                        v-model="sedeSelected" 
                        :options="sedes"                     
                        placeholder="Selecciona una sede" 
                        class="z-51"
                        :disabled="selectedPuesto === null"
                     />
                  </div>
                  <button
                     :disabled="!selectedPuesto || !sedeSelected" 
                     class="bg-blue-500 text-white hover:bg-blue-700 font-bold py-2 px-4 rounded" 
                     @click="agregarPuestoYSedes"
                  >
                     Agregar
                  </button>
                  <p v-if="errorMessage" class="text-red-500 text-sm mt-2">
                     {{ errorMessage }}
                  </p>
               </div>

               <div class="space-y-4" v-if="puestosYSedes.length > 0">
                  <h3 class="text-sm text-gray-500 font-bold">Puestos y Sedes Agregados</h3>
                  <div 
                     v-for="(item, index) in renderPuestosYSedes" 
                     :key="`${item.puestoId}-${item.sedeId}`" 
                     class="p-4 bg-white rounded-md shadow"
                  >
                     <div class="flex justify-between items-center">
                        <div class="flex items-center space-x-4">
                           <p class="font-bold text-gray-500">Puesto: <span class="font-normal">{{ item.puestoNombre }}</span></p>
                           <p class="font-bold text-gray-500">Sede: <span class="font-normal">{{ item.sedeNombre }}</span></p>
                        </div>
                        <button 
                           class="bg-gray-300 text-white hover:bg-gray-400 font-bold p-3 rounded-full flex items-center justify-center disabled:opacity-50" 
                           @click="eliminarPuestoYSedes(item.puestoId, item.sedeId)"
                        >
                        <i class="fas fa-times"></i>
                        </button>
                     </div>
                  </div>
               </div>
            </div>
            <div class="flex p-4">
               <button 
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                  type="button"
                  @click="registrarUser">
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
import { required, email, minLength, numeric } from 'vuelidate/lib/validators';
import Multiselect from 'vue-multiselect';
import { TRichSelect } from 'vue-tailwind/dist/components';
import 'vue-multiselect/dist/vue-multiselect.min.css';
export default {
   components: {
      Multiselect,
      TRichSelect
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
         sedeSelected: null,
         spiner: false,
         tipoDocumentos: [],
         show: false,
         sedesOfClient: '',
         puestosDisponibles: [],
         sedesDisponibles: [],
         puestosYSedes: [],
         selectedPuesto: null,
         errorMessage: ""
      };
   },

   async mounted(){
      try {
         const rol = localStorage.getItem('rol');
         if (rol !== 'ADMINISTRADOR'){
            this.$router.push('/dashboard');
         } 
         this.show = true;
         const reponse = await axios.get('/api/getUser/'+this.$route.params.id)
         this.formData = reponse.data
         
         await this.getClients();
         await this.getTipoDocumentos();
         await this.getSedesAndClientesByUser({ user_id: this.$route.params.id });
         if(this.sedesOfClient.length > 0) {
            const sedes = this.sedesOfClient.slice();
            this.processSedesAndClients(sedes);
         }
      } catch (error) {
         console.error("Error al cargar los elementos:", error);
      }
   },
   computed: {
      renderPuestosYSedes() {
         const result = [];
         this.puestosYSedes.forEach(puestoData => {
            puestoData.sedes.forEach(sede => {
               result.push({
                  puestoId: puestoData.puesto.id,
                  puestoNombre: puestoData.puesto.nombre,
                  sedeId: sede.id,
                  sedeNombre: sede.nombre
               });
            });
         });
         return result;
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

      agregarPuestoYSedes() {
         this.errorMessage = "";
         const puestoFull = this.puestos.find(puesto => puesto.id === this.selectedPuesto);
         if (puestoFull) {
            const sedeFull = this.sedes.find(sede => sede.id === this.sedeSelected);
            const existingPuesto = this.puestosYSedes.find(item => item.puesto.id === puestoFull.id);
            if (existingPuesto) {
               if (!existingPuesto.sedes.some(s => s.id === sedeFull.id)) {
                  existingPuesto.sedes.push(sedeFull);
               }
            } else {
               this.puestosYSedes.push({
                  puesto: puestoFull,
                  sedes: [sedeFull]
               });
            }
         }
         this.selectedPuesto = null;
         this.sedeSelected = null;
      },

      actualizarSedesDisponibles() {
         this.sedes = this.sedes.filter(sede => {
            return !this.puestosYSedes.some(puesto => 
               puesto.sedes.some(s => s.id === sede.id)
            );
         });

         this.puestosYSedes = this.puestosYSedes.filter(puesto => {
            if (puesto.sedes.length === 1) {
                  return puesto.sedes.some(sede => !this.sedes.find(s => s.id === sede.id));
            }
            return true;
         });
      },

      eliminarPuestoYSedes(puestoId, sedeId) {
         const puestoIndex = this.puestosYSedes.findIndex(puestosYSede => puestosYSede.puesto.id === puestoId);
         if (puestoIndex !== -1) {
            const sedeIndex = this.puestosYSedes[puestoIndex].sedes.findIndex(sede => sede.id === sedeId);
            if (sedeIndex !== -1) {
               this.puestosYSedes[puestoIndex].sedes.splice(sedeIndex, 1);
               if (this.puestosYSedes[puestoIndex].sedes.length === 0) {
                  this.puestosYSedes.splice(puestoIndex, 1);
               }
            }
         }
      },

      registrarUser(){
         this.error = false;
         this.spiner = true;
         this.validarDatos()         
      },

      async register(){
         try {
            const response = await axios.post('/api/editUser', this.formData);
            if (response.status === 200) {
               const user_id = response.data.user_id;
               const sedes = this.puestosYSedes.flatMap(puesto => 
                  puesto.sedes.map(sede => sede.id )
               );
               const data = { user_id, sedes };
               await axios.post('/api/updateUserSedes', data);
            }
            this.formData.name = this.formData.email = this.formData.password = '';               
            this.$router.push('/usuarios')
            this.$toaster.success('Registro actualizado con exito.')
         } catch (errors) {
            this.spiner = false;            
            if (errors.response && errors.response.data?.errors?.email) {
               this.$toaster.error(errors.response.data.errors.email[0]);
            } else {
               this.$toaster.error('La información proporcionada no es válida.');
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
         if (this.puestosYSedes.length < 1) {
            this.errorMessage = 'Debe agregar al menos un puesto y una sede';
            this.spiner = false;
            return;
         }
         this.register();          
      },

      async getClients(){
         await axios.get('/api/getClients').then((response) => {
         this.puestos = response.data.filter((item) => item.estado === 'ACTIVO');
         this.puestos.forEach((puesto) => {
            puesto.text = puesto.nombre.toUpperCase();
         });            
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      async getSedesByPuesto2() {
         if (this.selectedPuesto) {
            try {
               this.sedeSelected = null;
               this.sedes = [];
               const id = {'client_id': this.selectedPuesto};
               const response = await axios.get('/api/getSedesByClient', { params: id });
               this.sedes = response.data.sedes.filter((item) => item.estado === 'ACTIVO');
               this.sedes.forEach((sede) => {
                  sede.text = sede.nombre.toUpperCase();
               });
               this.actualizarSedesDisponibles();
            } catch (errors) {
                  console.log(errors.response?.data?.errors || "Ocurrió un error desconocido");
            }
         }
      },
      async getSedesAndClientesByUser(params) {
         try {
            const response = await axios.get('/api/getSedesAndClientesByUser', { params });
            this.sedesOfClient = response.data.sedes;
         } catch (errors) {
            console.log(errors.response.data.errors);
         }
      },
      
      processSedesAndClients(data) {
         data.forEach(item => {
            const existingPuesto = this.puestosYSedes.find(puesto => puesto.puesto.id === item.cliente.id);
            if (existingPuesto) {
                  if (!existingPuesto.sedes.some(sede => sede.id === item.sede_id)) {
                     existingPuesto.sedes.push({id: item.sede_id, nombre: item.sede_nombre});
                  }
            } else {
                  this.puestosYSedes.push({
                     puesto: item.cliente,
                     sedes: [{id: item.sede_id, nombre: item.sede_nombre}]
                  });
            }
         });
      }
      
   },

   validations: {
      formData: {
         name: { required },
         email: { required, email },
         password: { minLength: minLength(6)  }, 
         rol: { required },  
         tipo_documento_id: { required },         
         numero_documento: { required, numeric },         
         direccion: { required },         
         ciudad: { required },         
         telefono_uno: { required, numeric },         
         telefono_dos: { numeric },         
         fecha_nacimiento: { required }          
      }
        
    },  

}
</script>

<style scoped>
.child-flex >*, .flex {
    flex: 0 0 auto;
}
</style>