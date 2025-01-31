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
                  <input type="text" v-model="formData.nit" :disabled="puestoNombre !== 'MASTER' && !editar"
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
                  <input type="text" v-model="formData.nombre" :disabled="puestoNombre !== 'MASTER' && !editar"
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
                  <input type="text" v-model="formData.email" :disabled="puestoNombre !== 'MASTER' && !editar"
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
                  class="w-full" :show-labels="false" :disabled="puestoNombre !== 'MASTER' && !editar" />
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
                  class="w-full" :show-labels="false" :disabled="puestoNombre !== 'MASTER' && !editar"/>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.selectedFormOptions.required">
                Debe seleccionar al menos una opción multimedia
              </p> 
            </div>
          </div>
          <div class="flex mb-4 mt-5" v-if="puestoNombre === 'MASTER' && !editar">
            <button
              class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
              type="button" @click="registrarCliente">
              <p v-if="!spiner">Guardar</p>
              <p v-else><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
            </button>
          </div>
          <div class="flex mb-4 mt-5" v-if="editar">
            <button
              class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
              type="button" @click="registrarCliente">
              <p v-if="!spiner">Actualizar</p>
              <p v-else><em class="fas fa-spinner fa-pulse"></em> Actualizando...</p>
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
              <h3 class="font-semibold text-lg text-white mb-2" v-if="puestoNombre === 'MASTER'">
                Puestos registrados
              </h3>
              <h3 class="font-semibold text-lg text-white mb-2" v-else>
                Puesto
              </h3>
              <input type="text" placeholder="Buscar..." v-model="search" v-if="puestoNombre === 'MASTER'"
                class="px-2 py-2 placeholder-gray-400 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10" />
            </div>
          </div>
        </div>
        <div class="block w-full overflow-x-auto mb-12">
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
                <th
                  class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Acciones
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
                <td 
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  <div class="flex flex-wrap justify-center">
                    <button 
                      class="bg-gray-300 text-white hover:bg-gray-400 font-bold w-10 h-10 rounded-full flex items-center justify-center disabled:opacity-50"
                      @click="editarPuesto(client.id, index)">
                      <i class="fas fa-pen"></i>
                    </button>
                    <div @click="openModal(client)" title="Eliminar registro" v-if="puestoNombre === 'MASTER'"
                      class="text-center cursor-pointer w-10 h-10 shadow-lg rounded-full bg-red-500 hover:bg-red-600 flex items-center justify-center">
                      <i class="fas fa-trash font-bold text-white"></i>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <Modal :modal="modal" @closeModal="closeModal" @closeModalSuccess="closeModalSuccess" :datos="datosModal" />
  </div>
</template>

<script>
import { required, numeric } from 'vuelidate/lib/validators';
import Multiselect from 'vue-multiselect';
import Modal from '../../components/ModalDelete.vue';
import 'vue-multiselect/dist/vue-multiselect.min.css';
import '../../../../../../css/app.css';
export default {
  components: {
    Multiselect, Modal
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
      rol: localStorage.getItem('rol'),
      puesto:'',
      editar: false,
      userId: null,
      puestoNombre: '',
      idPuesto: '',
      modal: false,
      datosModal: {},
    };
  },

  mounted() {
    this.spiner = false;
    this.getOpcionesMenu();
    this.getOpcionesFormulario();
    this.puesto = JSON.parse(localStorage.getItem('puesto'));
    this.puestoNombre = this.puesto.nombre.toUpperCase();
    const userObject = localStorage.getItem("user");
    if (userObject) {
        const user = JSON.parse(userObject);
        this.userId = user.id;
    }
    if(this.puestoNombre === 'MASTER'){
      this.getClients();
    } else {
      this.getClients(this.puesto.id);
    }    
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
      this.formData.permisos_formulario = this.selectedFormOptions;
      this.formData.permisos_menu = this.selectedMenuOptions;
        
      if (this.formData.estado === true) {
        this.formData.estado = 'ACTIVO';
      } else if(this.formData.estado === false) {
        this.formData.estado = 'INACTIVO';
      }
      this.validarDatos()
    },
    editarPuesto(idPuesto, index) {
      this.editar = true;
      this.idPuesto = idPuesto;
      this.selectedFormOptions = JSON.parse(this.clients[index].permisos_formulario);
      this.selectedMenuOptions = JSON.parse(this.clients[index].permisos_menu);
      this.formData.permisos_formulario = this.selectedFormOptions;
      this.formData.permisos_menu = this.selectedMenuOptions;
      this.formData.nit = this.clients[index].nit;
      this.formData.nombre = this.clients[index].nombre;
      this.formData.email = this.clients[index].email;   
    },
    openModal(puesto) {
      this.datosModal = {
        id: puesto.id,
        url: '/api/deleteClient',
        title: 'Eliminar registro',
        message: '¿Está seguro de eliminar el puesto: ' + puesto.nombre + '?'
      }
      this.modal = true;
    },
    closeModal(value) {
      this.modal = value
    },
    closeModalSuccess(value) {
      if(this.puestoNombre === 'MASTER'){
        this.getClients();
      } else {
        this.getClients(this.puesto.id);
      } 
      this.modal = value;
      this.$toaster.success('Se eliminó correctamente el puesto seleccionado');
    },
    async actualizarCliente () {
      try {
        const data = {
            nit: this.formData.nit,
            nombre: this.formData.nombre,
            email: this.formData.email,
            estado: this.formData.estado,
            permisos_formulario: this.formData.permisos_formulario,
            permisos_menu: this.formData.permisos_menu,
            estado: 'ACTIVO'
        };
        if(this.puestoNombre === 'MASTER') {
          await axios.put(`/api/updateClient/${this.idPuesto}`, data);
        } else {          
          await axios.put(`/api/updateClient/${this.puesto.id}`, data);
        }
        this.spiner = false;
        this.submited = false;        
        this.editar = false;
        this.formData.nit = this.formData.nombre = this.formData.email = '';
        this.formData.estado = false;
        this.formData.permisos_formulario = '';
        this.formData.permisos_menu = '';
        this.selectedMenuOptions = [];
        this.selectedFormOptions = [];

        if(this.puestoNombre === 'MASTER'){
          this.getClients();
        } else {
          this.getClients(this.puesto.id);
        } 
        this.$toaster.success('Registro Actualizado con exito.');
      } catch (errors) {
        this.spiner = false;
        if (errors.response.data.errors && errors.response.data.errors.nit) {
          this.$toaster.error(errors.response.data.errors.nit[0]);
        } else {
          this.$toaster.error('Algo salio mal.');
        }
      }
    },

    validarDatos() {
      this.submited = true;
      this.$v.$touch();
      if (this.$v.$invalid) {
        this.spiner = false;
        return false;
      }
      if(this.editar) {
        this.actualizarCliente();
      } else {
        this.register();
      }
    },

    async register() {
      try {
        const data = {
          nit: this.formData.nit,
          nombre: this.formData.nombre,
          email: this.formData.email,
          estado: this.formData.estado,
          permisos_formulario: this.selectedFormOptions,
          permisos_menu: this.selectedMenuOptions
        };

        await axios.post('/api/registerClients', data, {
          headers: { 'Content-Type': 'application/json' }
        });
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

          this.$toaster.success('Registro creado con exito.');
          this.getClients();
          this.getOpcionesMenu();
          this.getOpcionesFormulario();
      } catch (errors) {
        this.spiner = false;
        if (errors.response.data.errors && errors.response.data.errors.nit) {
          this.$toaster.error(errors.response.data.errors.nit[0]);
        } else {
          this.$toaster.error('Algo salio mal.');
        }
      }
    },

    async getClients(id = null) {
        try {
            const response = await axios.get('/api/getClients', {
                params: id ? { id } : {}
            });
            this.clients = response.data.filter((item) => item.estado === 'ACTIVO');
        } catch (errors) {
            console.log(errors.response?.data?.errors || errors);
        }
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