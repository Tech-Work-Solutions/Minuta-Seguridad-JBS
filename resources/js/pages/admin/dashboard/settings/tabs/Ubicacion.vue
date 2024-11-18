<template>
  <div class="flex flex-wrap">
    <div class="flex flex-col w-full md:w-2/4 bg-gray-100 border-1">         
      <div class="flex-auto p-3 lg:px-5 pt-0">
        <form>
          <div class="flex flex-wrap mt-5">
            <div class="w-full">
                <div class="relative w-full mb-5">
                <label
                  class="block text-gray-600 text-sm font-semibold mb-2"
                  htmlFor="grid-password"
                >
                  Puesto o ubicación:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <span class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                      <em class="fas fa-car"></em>
                  </span>
                  <input 
                      type="text" 
                      v-model="formData.nombre"
                      class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                </div>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombre.required">Ingrese el nombre del puesto o ubicación</p>
                </div>
            </div>          
          </div>
          <div class="flex mb-4">
            <button 
                class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                type="button"
                @click="registrarUbicacion">
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
                  Puestos/ubicaciones registrados
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
                    Puesto/Ubicación
                  </th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-gray-100 text-left" v-for="(puesto, index) in searchPuesto" :key="puesto.id">
                <td
                  class="px-4 text-center text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                  >
                  {{ index+1 }}
                </td>
                <td
                  class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                  >
                  {{ puesto.nombre.toUpperCase() }}
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
import { required } from 'vuelidate/lib/validators';
export default {
  data() {
    return {
      submited: false,
      formData: {
        nombre: ''
      },
      puestos: [],
      search: '',
      spiner: false
    };
  },

  mounted() {
    this.spiner = false;
    this.getUbicaciones();      
  },

  methods: {
    registrarUbicacion(){
        this.spiner = true;
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
      await axios.post('/api/registerUbicacion', this.formData).then((response) => { 
        this.spiner = false;
        this.submited = false;
        this.formData.nombre = '';
        this.$toaster.success('Registro creado con exito.');
        this.getUbicaciones();
      }).catch((errors) => {
        this.spiner = false;
        if (errors.response.data.errors && errors.response.data.errors.nombre){
          this.$toaster.error(errors.response.data.errors.nombre[0]);
        }else{
          this.$toaster.error('Algo salio mal.');
        }
      });
    },

    getUbicaciones(){
      axios.get('/api/getUbicaciones').then((response) => {
        this.puestos = response.data
      }).catch((errors) => {
          console.log(errors.response.data.errors)
      });
    },
  },

  validations: {
    formData: {
        nombre: { required },          
    }
  },

  computed: {
    searchPuesto() {
      return this.puestos.filter((p) => (p.nombre).toUpperCase().includes(this.search.toUpperCase()));
    }
  }
}
</script>