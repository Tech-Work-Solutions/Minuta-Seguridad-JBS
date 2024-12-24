<template>
    <div class="flex flex-wrap">
      <div class="flex flex-col w-full md:w-2/4 bg-gray-100 border-1">         
        <div class="flex-auto p-3 lg:px-5 pt-0">
          <form>
            <div class="flex flex-wrap mt-5">

              <div class="w-full">                    
                <div class="relative w-full mb-3">
                    <label
                        class="block text-gray-600 text-sm font-semibold mb-2"
                        htmlFor="grid-password"
                    >
                        Puesto:
                    </label>
                    <t-rich-select
                    v-model="formData.cliente_id"
                    :options="clients"
                    placeholder="Seleccione una opción"
                    @change="onChange"
                    class="z-50"
                    >
                    </t-rich-select>
                </div>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cliente_id.required">Seleccione un puesto</p>                                      
              </div> 
              <div class="w-full">
                  <div class="relative w-full mb-5">
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
                        v-model="formData.nombre"
                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                  <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombre.required">Ingrese el nombre de la sede</p>
                  </div>
              </div>
              
              <div class="w-full">
                <div class="relative w-full mb-5">
                  <label
                    class="block text-gray-600 text-sm font-semibold mb-2"
                    htmlFor="grid-password"
                  >
                    Direccion:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                    <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-user"></em>
                    </span>
                    <input 
                        type="text" 
                        v-model="formData.direccion"
                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                </div>
              </div>
              <div class="w-full">
                <div class="relative w-full mb-5">
                  <label
                    class="block text-gray-600 text-sm font-semibold mb-2"
                    htmlFor="grid-password"
                  >
                    Telefono:
                  </label>
                  <div class="relative flex w-full flex-wrap items-stretch mb-3">
                    <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                        <em class="fas fa-user"></em>
                    </span>
                    <input 
                        type="number" 
                        v-model="formData.telefono"
                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                </div>
              </div>              
            </div>
            <div class="flex mb-4">
              <button 
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                  type="button"
                  @click="registrarSede">
                  <p v-if="!spiner">Guardar</p>
                  <p v-else><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
              </button>
            </div>
          </form>
        </div>
      </div>
      <div class="flex flex-col w-full md:w-2/4 bg-gray-100 border-1">
        <div class="flex-auto p-3 lg:p-5">
          <div class="rounded-t mb-0 mt-5 px-4 py-3 border-0 bg-gray-600">
            <div class="flex flex-wrap items-center">
              <div class="relative w-full px-4 max-w-full flex-grow flex-1">
                  <h3
                    class="font-semibold text-lg text-white mb-2"
                  >
                    Sedes registradas
                  </h3>
                  <input 
                    type="text" 
                    placeholder="Buscar..."
                    v-model="search"
                    class="px-2 py-2 placeholder-gray-400 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
              </div>
            </div>
          </div>
          <div class="block w-full overflow-x-auto mb-12">
            <!-- Projects table -->
            <table class="items-center w-full bg-gray-100 border-collapse">
              <thead>
                <tr class="bg-gray-100 text-left">
                    <th
                    class="px-4 text-center text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      #
                    </th>
                    <th
                    class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Puesto
                    </th>
                    <th
                    class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Direccion
                    </th>
                    <th
                    class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Sede
                    </th>
                </tr>
              </thead>
              <tbody>
                <tr class="bg-gray-100 text-left" v-for="(sede, index) in searchSede" :key="sede.id">
                  <td
                    class="px-4 text-center text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ index+1 }}
                  </td>
                  <td
                    class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.nombre ? sede.nombre.toUpperCase() : '' }}
                  </td>
                  <td
                    class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.direccion ? sede.direccion.toUpperCase() : '' }}
                  </td>
                  <td
                    class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.client ? sede.client.toUpperCase() : '' }}
                  </td>
                </tr>
              </tbody>
            </table>
         </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { required, numeric } from 'vuelidate/lib/validators';
  import { TRichSelect } from 'vue-tailwind/dist/components';

  export default {
    data() {
      return {
        submited: false,
        formData: {
          nombre: '',
          cliente_id: '',
          direccion: '',
          telefono: '',
          estado: true,          
        },
        sedes: [],
        clients: [],
        search: '',
        spiner: false
      };
    },
  
    mounted() {
      this.spiner = false;
      this.getSedes(); 
      this.getClients();
    },

    created() {
      this.$parent.$on('tab-activated', this.handleTabActivated);
    },
  
    methods: {
      handleTabActivated(tabName) {
        if (tabName === 'sedes') {
          this.getClients();
        }
      },
      registrarSede(){
          this.spiner = true;
          if(this.formData.estado === true){
            this.formData.estado = 'ACTIVO';
          } else {
            this.formData.estado = 'INACTIVO';
          }  
          this.validarDatos()         
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
  
      async register(){  
        await axios.post('/api/registerSede', this.formData).then((response) => { 
          this.spiner = false;
          this.submited = false;
          this.formData.nombre = this.formData.direccion = this.formData.telefono = '';
          this.formData.estado = true;
          this.clients= [],
          this.$toaster.success('Registro creado con exito.');
          this.getSedes();
          this.getClients();
        }).catch((errors) => {
          this.spiner = false;
          if (errors.response.data.errors && errors.response.data.errors.nombre){
            this.$toaster.error(errors.response.data.errors.nombre[0]);
          }else{
            this.$toaster.error('Algo salio mal.');
          }
        });
      },
  
      getSedes(){
        axios.get('/api/getSedes').then((response) => {
          this.sedes = response.data.filter((item) => item.estado === 'ACTIVO');
        
        }).catch((errors) => {
            console.log(errors.response.data.errors)
        });
      },

      async getClients(){
         await axios.get('/api/getClients').then((response) => {
          this.clients = response.data.filter((item) => item.estado === 'ACTIVO');
          this.clients.forEach((item) => {
            item.text = item.nombre.toUpperCase();
          }); 
            
         }).catch((errors) => {
            console.log(errors.response.data.errors)
         });
      },
      onChange() {
         const client = this.clients.find((d) => d.id === this.formData.cliente_id);
      },
    },

    beforeDestroy() {
      this.$parent.$off('tab-activated', this.handleTabActivated);
    },
  
    validations: {
      formData: {
          nombre: { required },         
          cliente_id: { required }    
      }
    },
  
    computed: {
        searchSede() {
            let sedes = this.sedes.filter((c) => (c.nombre).toUpperCase().includes(this.search.toUpperCase()));
            
            if (sedes.length > 0 && this.clients.length > 0) {
                for (let index = 0; index < sedes.length; index++) {
                    const sede = sedes[index];
                    const client = this.clients.find(client => client.id === sede.cliente_id);  
                    if (client) {
                        sede.client = client.nombre;
                    }
                }
            }
            return sedes;
        }
    },
    components: { TRichSelect }
  }
  </script>