<template>
  <div class="flex flex-wrap">
    <div class="flex flex-col w-full md:w-2/4 bg-gray-100 border-1">
      <div class="flex-auto p-3 lg:px-5 pt-0">
        <form>
          <div class="flex flex-wrap mt-5">
            <div class="w-full">
              <div class="relative w-full mb-5">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  NIT:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <span
                    class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                    <em class="fas fa-user"></em>
                  </span>
                  <input type="text" v-model="formData.nit"
                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                </div>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nit.required">Ingrese el NIT</p>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nit.numeric">Ingrese solo números</p>
              </div>
            </div>
            <div class="w-full">
              <div class="relative w-full mb-5">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Nombre:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <span
                    class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                    <em class="fas fa-user"></em>
                  </span>
                  <input type="text" v-model="formData.nombre"
                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                </div>
                <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombre.required">Ingrese el nombre del
                  puesto</p>
              </div>
            </div>
            <div class="w-full">
              <div class="relative w-full mb-5">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Email:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <span
                    class="z-10 h-full leading-snug font-normal absolute text-center text-gray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3">
                    <em class="fas fa-user"></em>
                  </span>
                  <input type="text" v-model="formData.email"
                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
                </div>
              </div>
            </div>
            <div class="w-full">
              <div class="relative w-full mb-5">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Opciones de menu:
                </label>
                <multiselect v-model="selectedMenuOptions" :options="menuOptions" :multiple="true" :searchable="true"
                  :close-on-select="false" label="nombre" track-by="id" placeholder="Selecciona las opciones"
                  class="w-full" :show-labels="false" />
                  <p class="text-red-500 text-sm" v-if="submited && !$v.selectedMenuOptions.required">
                    Debe seleccionar al menos una opción de menú
                  </p>
              </div>
            </div>
            <div class="w-full">
              <div class="relative w-full mb-5">
                <label class="block text-gray-600 text-sm font-semibold mb-2" for="form-visible">
                  Opciones multimedia:
                </label>
                <multiselect v-model="selectedFormOptions" :options="formOptions" :multiple="true" :searchable="true"
                  :close-on-select="false" label="nombre" track-by="id" placeholder="Selecciona las opciones"
                  class="w-full" :show-labels="false" />
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.selectedFormOptions.required">
                Debe seleccionar al menos una opción multimedia
              </p> 
            </div>
          </div>
          <div class="flex mb-4 mt-5">
            <button
              class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
              type="button" @click="registrarCliente">
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
              <h3 class="font-semibold text-lg text-white mb-2">
                Puestos registrados
              </h3>
              <input type="text" placeholder="Buscar..." v-model="search"
                class="px-2 py-2 placeholder-gray-400 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
            </div>
          </div>
        </div>
        <div class="block w-full overflow-x-auto mb-12">
          <!-- Projects table -->
          <table class="items-center w-full bg-gray-100 border-collapse">
            <thead>
              <tr class="bg-gray-100 text-left">
                <th
                  class="px-4 text-center text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  #
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  NIT
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Puesto
                </th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-gray-100 text-left" v-for="(client, index) in searchClient" :key="client.id">
                <td
                  class="px-4 text-center text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap">
                  {{ index + 1 }}
                </td>
                <td
                  class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap">
                  {{ client.nit }}
                </td>
                <td
                  class="px-4 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap">
                  {{ client.nombre.toUpperCase() }}
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
import Multiselect from 'vue-multiselect';
import 'vue-multiselect/dist/vue-multiselect.min.css';
import '../../../../../../css/app.css';
export default {
  components: {
    Multiselect
  },
  data() {
    return {
      submited: false,
      formData: {
        nit: '',
        nombre: '',
        email: '',
        estado: true,
        permisos_formulario: '',
        permisos_menu: '',
        img_header: null,
        img_footer: null,
      },
      clients: [],
      menuOptions: [],
      formOptions: [],
      selectedMenuOptions: [],
      selectedFormOptions: [],
      search: '',
      spiner: false,
      reportHeaderImage: '',
      reportFooterImage: '',
    };
  },

  mounted() {
    this.spiner = false;
    this.getClients();
    this.getOpcionesMenu();
    this.getOpcionesFormulario();
  },

  methods: {
    registrarCliente() {
      this.spiner = true;
      this.selectedMenuOptions = this.selectedMenuOptions.map(option => ({
        id: option.id,
        nombre: option.nombre
      })).sort((a, b) => a.id - b.id);

      this.selectedFormOptions = this.selectedFormOptions.map(option => ({
        id: option.id,
        nombre: option.nombre
      })).sort((a, b) => a.id - b.id);
      this.formData.permisos_formulario = JSON.stringify(this.selectedFormOptions)
      this.formData.permisos_menu = JSON.stringify(this.selectedMenuOptions)
      if (this.formData.estado === true) {
        this.formData.estado = 'ACTIVO';
      } else if(this.formData.estado === false) {
        this.formData.estado = 'INACTIVO';
      }
      this.validarDatos()
    },
    validarDatos() {
      this.submited = true;
      this.$v.$touch();
      if (this.$v.$invalid) {
        this.spiner = false;
        return false;
      }
      this.register();
    },

    async register() {
      const data = new FormData();
      data.append('nit', this.formData.nit);
      data.append('nombre', this.formData.nombre);
      data.append('email', this.formData.email);
      data.append('estado', this.formData.estado);
      if (this.formData.img_header != null) {
        data.append('img_header', this.formData.img_header);
      }
      if (this.formData.img_footer != null) {
        data.append('img_footer', this.formData.img_footer);
      }
      data.append('permisos_formulario', this.formData.permisos_formulario);
      data.append('permisos_menu', this.formData.permisos_menu);

      await axios.post('/api/registerClients', data).then((response) => {
        this.spiner = false;
        this.submited = false;
        this.formData.nit = this.formData.nombre = this.formData.email = '';
        this.formData.estado = true,
          this.formData.permisos_formulario = '',
          this.formData.permisos_menu = '',

          this.menuOptions = [],
          this.formOptions = [],
          this.selectedMenuOptions = [],
          this.selectedFormOptions = [];
        this.reportHeaderImage = '';
        this.reportFooterImage = '';

        this.$toaster.success('Registro creado con exito.');
        this.getClients();
        this.getOpcionesMenu();
        this.getOpcionesFormulario();
      }).catch((errors) => {
        this.spiner = false;
        if (errors.response.data.errors && errors.response.data.errors.nit) {
          this.$toaster.error(errors.response.data.errors.nit[0]);
        } else {
          this.$toaster.error('Algo salio mal.');
        }
      });
    },

    getClients() {
      axios.get('/api/getClients').then((response) => {
        this.clients = response.data.filter((item) => item.estado === 'ACTIVO');
      }).catch((errors) => {
        console.log(errors.response.data.errors)
      });
    },

    getOpcionesMenu() {
      axios.get('/api/getOpcionesMenu').then((response) => {
        this.menuOptions = response.data;

      }).catch((errors) => {
        console.log(errors.response.data.errors)
      });
    },

    getOpcionesFormulario() {
      axios.get('/api/getOpcionesFormulario').then((response) => {
        this.formOptions = response.data
      }).catch((errors) => {
        console.log(errors.response.data.errors)
      });
    },

    obtenerImagen(imageType, e) {
      let file = e.target.files[0];
      if (file) {
        if (imageType === 'header') {
          this.formData.img_header = file;
        } else if (imageType === 'footer') {
          this.formData.img_footer = file;
        }

        //leer y mostrar imagen
        this.cargarImagen(file, imageType);
      }
    },

    cargarImagen(file, imageType) {
      let reader = new FileReader();
      reader.onload = (e) => {
        if (imageType === 'header') {
          this.reportHeaderImage = e.target.result;
        } else if (imageType === 'footer') {
          this.reportFooterImage = e.target.result;
        }
      };
      reader.readAsDataURL(file);
    },

  },

  validations: {
    formData: {
      nombre: { required },
      nit: { required, numeric },         
      },
      selectedFormOptions: {
        required: (value) => value && value.length > 0,
      },
      selectedMenuOptions: {
        required: (value) => value && value.length > 0,
      },
  },

  computed: {
    searchClient() {
      return this.clients.filter((c) => (c.nombre).toUpperCase().includes(this.search.toUpperCase()));
    },
  }
}
</script>