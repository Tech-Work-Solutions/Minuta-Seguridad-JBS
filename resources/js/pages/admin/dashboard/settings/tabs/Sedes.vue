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
                    :disabled="rol !== 'ADMINISTRADOR' && !editar"
                    class="z-10"
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
                        :disabled="rol !== 'ADMINISTRADOR' && !editar"
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
                        :disabled="rol !== 'ADMINISTRADOR' && !editar"
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
                        :disabled="rol !== 'ADMINISTRADOR' && !editar"
                        class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
                  </div>
                </div>
              </div> 
              <div class="w-full mt-5">
                <div class="relative w-full mb-5 flex items-center">
                  <label
                    class="block text-gray-600 text-sm font-semibold mr-2"
                    htmlFor="grid-password"
                  >
                    Estado:
                  </label>                                      
                  <toggle-button 
                    v-model="formData.estadoSwitch" 
                    :labels="false" 
                    color="rgba(59, 130, 246, var(--tw-bg-opacity))"
                    :disabled="puestoNombre !== 'MASTER' && !editar"
                  />                               
                </div>
              </div>             
            </div>
            <div class="flex mb-4" v-if="rol === 'ADMINISTRADOR' && !editar">
              <button 
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" 
                  type="button"
                  @click="registrarSede">
                  <p v-if="!spiner">Guardar</p>
                  <p v-else><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
              </button>
            </div>
            <div class="flex mb-4 mt-5" v-if="editar">
              <button
                class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                type="button" @click="registrarSede">
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
                  <h3
                    class="font-semibold text-lg text-white mb-2"
                    v-if="rol === 'ADMINISTRADOR'"
                  >
                    Sedes registradas
                  </h3>
                  <input 
                    type="text" 
                    placeholder="Buscar..."
                    v-model="search"
                    v-if="rol === 'ADMINISTRADOR'"
                    class="px-2 py-2 placeholder-gray-400 text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full pl-10"/>
              </div>
            </div>
          </div>
          <div class="block w-full overflow-x-auto mb-12">
            <table class="items-center w-full bg-gray-100 border-collapse">
              <thead>
                <tr class="bg-gray-100 text-left">
                    <th
                    class="px-3 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Puesto
                    </th>
                    <th
                    class="px-3 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Direccion
                    </th>
                    <th
                    class="px-3 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold "
                    >
                      Sede
                    </th>
                    <th
                      class="px-3 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold " v-if="rol === 'ADMINISTRADOR'">
                      Acciones
                    </th>
                </tr>
              </thead>
              <tbody>
                <tr class="bg-gray-100 text-left" v-for="(sede, index) in searchSede" :key="sede.id">                  
                  <td
                    class="px-3 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.nombre ? sede.nombre.toUpperCase() : '' }}
                  </td>
                  <td
                    class="px-3 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.direccion ? sede.direccion.toUpperCase() : '' }}
                  </td>
                  <td
                    class="px-3 text-gray-700 border-gray-300 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap"
                    >
                    {{ sede.client ? sede.client.toUpperCase() : '' }}
                  </td>
                  <td 
                    class="px-3 text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                    <div class="flex flex-wrap justify-center"  v-if="rol === 'ADMINISTRADOR'">
                      <button 
                        class="bg-blue-500 hover:bg-blue-600 text-white font-bold w-10 h-10 rounded-full flex items-center justify-center disabled:opacity-50"
                        @click="editarSede(sede.id, index)">
                        <i class="fas fa-pen"></i>
                      </button>
                      <div @click="openModal(sede)" title="Eliminar registro"
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
  import { TRichSelect } from 'vue-tailwind/dist/components';
  import Modal from '../../components/ModalDelete.vue';

  export default {
    data() {
      return {
        submited: false,
        formData: {
          nombre: '',
          cliente_id: '',
          direccion: '',
          telefono: '',
          estado: 'ACTIVO',
          estadoSwitch: true
        },
        sedes: [],
        clients: [],
        search: '',
        spiner: false,
        sede:'',
        editar: false,
        userId: null,
        sedeNombre: '',
        idSede: '',
        modal: false,
        datosModal: {},
        rol: '',
        puesto: '',
        puestoNombre: '',
      };
    },
  
    async mounted() {
      this.spiner = false;
      try {
        this.puesto = JSON.parse(localStorage.getItem('puesto'));
        this.puestoNombre = this.puesto.nombre.toUpperCase();
        const userObject = localStorage.getItem("user");
        this.rol = localStorage.getItem('rol');
        if (userObject) {
            const user = JSON.parse(userObject);
            this.userId = user.id;
        }
        if(this.puestoNombre === 'MASTER'){
          await this.getSedes(); 
          await this.getClients();
        } else {
          await this.getSedesByClient(this.puesto.id);
          await this.getClients(this.puesto.id);
          this.formData.cliente_id = this.puesto.id
        }
      } catch (error) {
        console.error('Error en mounted:', error);
        this.$toaster.error('Ocurrió un error al cargar la información.');
      } 
    },

    created() {
      this.$parent.$on('tab-activated', this.handleTabActivated);
    },
  
    methods: {
      handleTabActivated(tabName) {
        if (tabName === 'sedes') {
          if(this.puestoNombre === 'MASTER'){
            this.getClients();
          }      
        }
      },
      registrarSede(){
          this.spiner = true;
          if (this.puestoNombre !== 'MASTER') {
            this.formData.estadoSwitch = true;
            this.formData.estado = 'ACTIVO';
          } else {
            if (this.formData.estadoSwitch === true) {
              this.formData.estado = 'ACTIVO';
            } else if(this.formData.estadoSwitch === false) {
              this.formData.estado = 'INACTIVO';
            }
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
          if(this.editar) {
            this.actualizarSede();
          } else {
            this.register();
          }         
      }, 
  
      async register() {
        try {
          await axios.post('/api/registerSede', this.formData);
          this.spiner = false;
          this.submited = false;
          this.formData.nombre = this.formData.direccion = this.formData.telefono = '';
          this.formData.estadoSwitch = true;
          this.formData.estado = 'ACTIVO';
          this.clients= [],
          this.$toaster.success('Registro creado con exito.');
          if(this.puestoNombre === 'MASTER'){
            await this.getSedes();
            await this.getClients();
          } else {
            await this.getSedesByClient(this.puesto.id);
          }
        }
        catch(errors) {
          this.spiner = false;
          if (errors.response?.data?.errors?.nombre) {
            this.$toaster.error(errors.response.data.errors.nombre[0]);
          } else {
            this.$toaster.error('Algo salió mal.');
          }
        };
      },
  
      async getSedes(id= null) {
        try {
          const response = await axios.get('/api/getSedes', {
              params: id ? { id } : {},
          });

          this.sedes = response.data.sedes.filter((item) => item.estado === 'ACTIVO');
        } catch (error) {
            console.error('Error al obtener las sedes:', error);
            this.$toast.error('No se pudieron cargar las sedes. Inténtalo de nuevo.');
        }
      },
      
      async getClients(id = null){
        try {
            const response = await axios.get('/api/getClients', {
                params: id ? { id } : {}
            });
            this.clients = response.data.filter((item) => item.estado === 'ACTIVO');
            this.clients.forEach((item) => {
              item.text = item.nombre.toUpperCase();
            });
        } catch (errors) {
            console.log(errors.response?.data?.errors || errors);
        }
      },

      async getSedesByClient(idClient = null){
        const id = {'client_id': idClient};
        const response = await axios.get('/api/getSedesByClient', { params: id });        
        this.sedes = response.data.sedes.filter((item) => item.estado === 'ACTIVO');             
        this.sedes.forEach((sede) => {
          sede.text = sede.nombre.toUpperCase();
        });
      },
      onChange() {
         const client = this.clients.find((d) => d.id === this.formData.cliente_id);
      },
      editarSede(idSede, index) {
        this.editar = true;
        this.idSede = idSede;        
        this.formData.direccion = this.sedes[index].direccion;
        this.formData.nombre = this.sedes[index].nombre;
        this.formData.telefono = this.sedes[index].telefono;
        this.formData.cliente_id = this.sedes[index].cliente_id;
        this.formData.estadoSwitch = this.sedes[index].estado === 'ACTIVO' ? true : false;
        this.formData.estado = this.sedes[index].estado; 
        console.log("🚀 ~ editarSede ~ this.formData:", this.formData)
      },
      openModal(sede) {
        this.datosModal = {
          id: sede.id,
          url: '/api/deleteSede',
          title: 'Eliminar registro',
          message: '¿Está seguro de eliminar la sede: ' + sede.nombre + '?'
        }
        this.modal = true;
      },
      closeModal(value) {
        this.modal = value
      },
      async closeModalSuccess(value) {
        if(this.puestoNombre === 'MASTER'){
          await this.getSedes();
          await this.getClients();
        } else {
          await this.getSedesByClient(this.puesto.id);
        } 
        this.modal = value;
        this.formData.cliente_id = null;
        this.$toaster.success('Se eliminó correctamente la sede seleccionada');
      },
      async actualizarSede () {
        try {
          const data = {         
              nombre: this.formData.nombre,
              telefono: this.formData.telefono,
              estado: this.formData.estado,
              direccion: this.formData.direccion,
              cliente_id: this.formData.cliente_id,
              estado: this.formData.estadoSwitch === true ? 'ACTIVO' : 'INACTIVO',
          };
          if(this.rol === 'ADMINISTRADOR') {
            await axios.put(`/api/updateSede/${this.idSede}`, data);
          } else {
            await axios.put(`/api/updateSede/${this.sede.id}`, data);
          }
          this.spiner = false;
          this.submited = false;        
          this.editar = false;
          this.formData.telefono = this.formData.nombre = this.formData.direccion = '';
          this.formData.estado = 'ACTIVO';
          this.formData.estadoSwitch = true;
          this.formData.cliente_id = null;
          if(this.puestoNombre === 'MASTER'){
            await this.getSedes();
            await this.getClients();
          } else {
            await this.getSedesByClient(this.puesto.id);
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
    components: { TRichSelect, Modal }
  }
  </script>

<style scoped>
.child-flex >*, .flex {
    flex: 0 0 auto;
}
</style>