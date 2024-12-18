<template>
  <div>
    <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">
      <div class="flex-auto px-4 lg:px-0 py-10 pt-0">
        <form>
          <div class="flex flex-wrap mt-10">
            <!-- Fecha inicial -->
            <div class="w-full lg:w-3/12">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Desde:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <input type="date" v-model="formData.fecha_inicial"
                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full" />
                </div>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fecha_inicial.required">Ingrese una fecha
                inicial</p>
            </div>

            <!-- Fecha final -->
            <div class="w-full lg:w-3/12 px-4">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Hasta:
                </label>
                <div class="relative flex w-full flex-wrap items-stretch mb-3">
                  <input type="date" v-model="formData.fecha_final"
                    class="px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline w-full" />
                </div>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fecha_final.required">Ingrese una fecha
                final</p>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Buscar por:
                </label>
                <t-rich-select v-model="formData.tipo" :options="tipos" placeholder="Seleccione una opción"
                  @change="onChange">
                </t-rich-select>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipo.required">Seleccione una opción</p>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4" v-if="showVehiculo">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Vehículo:
                </label>
                <t-rich-select v-model="formData.value_id" :options="vehiculos" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4" v-if="showConductor">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Conductor:
                </label>
                <t-rich-select v-model="formData.value_id" :options="conductores" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4" v-if="showProcedencia">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Procedencia:
                </label>
                <t-rich-select v-model="formData.value_id" :options="procedencias" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4" v-if="showVolqueta">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Tipo vehículo:
                </label>
                <t-rich-select v-model="formData.value_id" :options="volquetas" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
            </div>

            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12 px-4" v-if="showGuarda">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Guarda:
                </label>
                <t-rich-select v-model="formData.value_id" :options="guardas" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
            </div>


          </div>
          <div class="flex flex-wrap mt-2">
            <div class="w-full lg:w-3/12">
              <div class="flex">
                <button
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none ease-linear transition-all duration-150"
                  type="button" @click="validarDatos('consultar')">
                  <p v-if="!spiner"><em class="fas fa-search"></em> Buscar</p>
                  <p v-else><em class="fas fa-spinner fa-pulse"></em> Buscando...</p>
                </button>
                <button
                  class="bg-red-700 text-white hover:bg-red-800 font-bold text-sm px-6 py-3 ml-3 rounded shadow hover:shadow-lg outline-none focus:outline-none ease-linear transition-all duration-150"
                  type="button" @click="validarDatos('pdf')">
                  <p><em class="fas fa-file-pdf"></em> Pdf</p>
                </button>
              </div>
            </div>
          </div>
        </form>

        <div class="block w-full overflow-x-auto mt-6">
          <div v-if="!showResult"
            class="bg-blue-100 border-t-4 mb-2 border-blue-500 rounded-b text-teal-900 py-3 shadow-md" role="alert">
            <div class="flex">
              <div class="py-1"><svg class="fill-current h-6 w-6 text-blue-500 mr-4" xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 20 20">
                  <path
                    d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z" />
                </svg></div>
              <div>
                <p class="font-semi-bold text-gray-600">No se encontraron resultados </p>
              </div>
            </div>
          </div>
          <!-- Projects table -->
          <table class="items-center w-full bg-gray-100 border-collapse">
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
                  Vehículo
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Conductor
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Procedencia
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Tipo vehículo
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Entrada o salida
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Observaciones
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Foto
                </th>
                <th
                  class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Audio
                </th>
                <th
                  class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Video
                </th>
                <th v-if="rol == 'ADMINISTRADOR'"
                  class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Acciones
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
                  {{ item.vehicle.placa.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.driver.nombre.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.origin.nombre.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.volqueta.nombre.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.entrada_salida === 'E' ? 'ENTRADA' : 'SALIDA' }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.observaciones }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  <div class="w-32 lg:w-48 rounded overflow-hidden">
                    <img :src="item.foto" alt="">
                  </div>
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  <div class="w-32 lg:w-48 rounded overflow-hidden">
                    <audio v-if="item.audio" :src="item.audio" alt="" controls></audio>
                  </div>
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  <div class="w-32 lg:w-48 rounded overflow-hidden">
                    <video v-if="item.video" :src="item.video" alt="" controls></video>
                  </div>
                </td>
                <td v-if="rol == 'ADMINISTRADOR'"
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  <div class="flex flex-wrap justify-center">
                    <router-link :to="{ name: 'EditRecordVehicle', params: { id: item.id } }" title="Editar registro">
                      <div
                        class="text-center mr-2 inline-flex items-center justify-center w-8 h-8 shadow-lg rounded-full bg-blue-500 hover:bg-blue-600 ease-linear transition-all duration-150">
                        <i class="fas fa-pen font-bold text-white"></i>
                      </div>
                    </router-link>

                    <div @click="openModal(item)" title="Eliminar registro"
                      class="text-center inline-flex cursor-pointer items-center justify-center w-8 h-8 shadow-lg rounded-full bg-red-500 hover:bg-red-600 ease-linear transition-all duration-150">
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
import { TRichSelect } from 'vue-tailwind/dist/components';
import Modal from '../../components/ModalDelete.vue';
import { required } from 'vuelidate/lib/validators';
import moment from 'moment';
export default {
  data() {
    return {
      formData: {
        tipo: 'TODOS',
        fecha_inicial: '',
        fecha_final: '',
        value_id: ''
      },
      submited: false,
      spiner: false,
      datos: [],
      vehiculos: [],
      conductores: [],
      procedencias: [],
      volquetas: [],
      guardas: [],
      showResult: true,
      showVehiculo: false,
      showConductor: false,
      showProcedencia: false,
      showVolqueta: false,
      showGuarda: false,
      modal: false,
      datosModal: {},
      rol: localStorage.getItem('rol'),
      tipos: [
        { id: 'TODOS', text: 'TODOS' },
        { id: 'GUARDA', text: 'GUARDA' },
        { id: 'VEHICULO', text: 'VEHICULO' },
        { id: 'CONDUCTOR', text: 'CONDUCTOR' },
        { id: 'PROCEDENCIA', text: 'PROCEDENCIA' },
        { id: 'VOLQUETA', text: 'TIPO VEHICULO' }
      ]
    }
  },

  mounted() {
    this.getVehiculos();
    this.getConductores();
    this.getProcedencias();
    this.getVolquetas();
    this.getUsersGuardas();
  },

  methods: {
    async getVehiculos() {
      await axios.get('/api/getVehiculos').then((response) => {
        this.vehiculos = response.data;
        this.vehiculos.forEach(item => item.text = item.placa.toUpperCase());
      });
    },
    async getConductores() {
      await axios.get('/api/getConductores').then((response) => {
        this.conductores = response.data;
        this.conductores.forEach(item => item.text = item.nombre.toUpperCase());
      });
    },
    async getProcedencias() {
      await axios.get('/api/getProcedencias').then((response) => {
        this.procedencias = response.data;
        this.procedencias.forEach(item => item.text = item.nombre.toUpperCase());
      });
    },
    async getVolquetas() {
      await axios.get('/api/getVolquetas').then((response) => {
        this.volquetas = response.data;
        this.volquetas.forEach(item => item.text = item.nombre.toUpperCase());
      });
    },
    async getUsersGuardas() {
      await axios.get('/api/getUsersGuardas').then((response) => {
        this.guardas = response.data;
        this.guardas.forEach(item => item.text = item.name.toUpperCase());
      });
    },
    onChange() {
      this.formData.value_id = '';
      this.showVehiculo = false;
      this.showConductor = false;
      this.showProcedencia = false;
      this.showVolqueta = false;
      this.showGuarda = false;
      if (this.formData.tipo === 'VEHICULO') {
        this.showVehiculo = true;
      }
      if (this.formData.tipo === 'CONDUCTOR') {
        this.showConductor = true;
      }
      if (this.formData.tipo === 'PROCEDENCIA') {
        this.showProcedencia = true;
      }
      if (this.formData.tipo === 'VOLQUETA') {
        this.showVolqueta = true;
      }
      if (this.formData.tipo === 'GUARDA') {
        this.showGuarda = true;
      }
    },
    async consultar() {
      this.spiner = true;
      await axios.post('/api/getReporteVehiculos', this.formData).then((response) => {
        this.datos = response.data;
        if (this.datos.length > 0) { this.showResult = true }
        else { this.showResult = false }
        this.spiner = false;
        this.submited = false;
      });
    },

    fecha(d) {
      return moment(d).format('DD-MM-YYYY HH:mm:ss');
    },

    makePDF() {
      location.href = '/api/pdf_recordVehicle?value_id=' + this.formData.value_id + '&tipo=' + this.formData.tipo + '&fecha_inicial=' + this.formData.fecha_inicial + '&fecha_final=' + this.formData.fecha_final;
    },

    validarDatos(action) {
      this.submited = true;
      this.$v.$touch();
      if (this.$v.$invalid) {
        this.spiner = false;
        return false;
      }
      if (action === "consultar") {
        this.consultar();
      } else {
        this.makePDF();
      }
    },
    openModal(record) {
      this.datosModal = {
        id: record.id,
        url: '/api/deleteRecordVehicle',
        title: 'Eliminar registro',
        message: '¿Está seguro de eliminar el registro que tiene como observaciones: ' + record.observaciones + '?'
      }
      this.modal = true;
    },

    closeModal(value) {
      this.modal = value
    },
    closeModalSuccess(value) {
      this.consultar();
      this.modal = value;
      this.$toaster.success('Se eliminó correctamente el registro seleccionado');
    }

  },

  validations: {
    formData: {
      tipo: { required },
      fecha_inicial: { required },
      fecha_final: { required },
    }
  },

  components: { Modal, TRichSelect }

}
</script>
