<template>
  <div>
    <div class="flex flex-col min-w-0 w-full shadow-lg rounded-lg bg-gray-100 border-1">
      <div class="flex-auto px-4 lg:px-0 py-10 pt-0">
        <form>
          <div class="flex flex-wrap mx-2 mt-10">
            <!-- Tipo de reporte -->
            <div class="w-full lg:w-3/12">
              <div class="relative w-full mb-3">
                <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="grid-password">
                  Buscar por guarda de seguridad:
                </label>
                <t-rich-select v-model="formData.user_id" :options="guardas" placeholder="Seleccione una opción">
                </t-rich-select>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.user_id.required">Seleccione una opción</p>
            </div>

            <!-- Fecha inicial -->
            <div class="w-full lg:w-3/12 px-4">
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

            <div class="w-full lg:w-3/12">
              <div class="flex p-6">
                <button
                  class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                  type="button" @click="validarDatos('consultar')">
                  <p v-if="!spiner"><em class="fas fa-search"></em> Buscar</p>
                  <p v-else><em class="fas fa-spinner fa-pulse"></em> Buscando...</p>
                </button>

                <button
                  class="bg-red-700 text-white hover:bg-red-800 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                  type="button" @click="validarDatos('pdf')">
                  <p><em class="fas fa-file-pdf"></em> Pdf</p>
                </button>
              </div>
            </div>
          </div>

        </form>

        <div class="block w-full overflow-x-auto mx-3 mt-6">
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
          <table class="items-center w-full bg-gray-100 border-collapse" ref="content">
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
                  Asunto
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Ubicación
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Latitud/Longitud
                </th>
                <th
                  class="px-4 text-blue-600 border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                  Anotaciones
                </th>
                <th
                  class="px-4 text-blue-600 text-center border-blue-600 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
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
                  {{ item.usuario.name.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.asunto.nombre.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.ubicacion.nombre.toUpperCase() }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ `${item.latitud || '-'}/${item.longitud || '-'} ` }}
                </td>
                <td
                  class="text-gray-700 border-t-0 border-gray-300 border border-solid px-4 border-l-0 border-r-0 text-sm p-2">
                  {{ item.anotaciones }}
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
                    <router-link :to="{ name: 'EditMinuta', params: { id: item.id } }" title="Editar registro">
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
        user_id: 'TODOS',
        fecha_inicial: '',
        fecha_final: ''
      },
      submited: false,
      spiner: false,
      datos: [],
      guardas: [],
      showResult: true,
      modal: false,
      datosModal: {},
      rol: localStorage.getItem('rol'),
      sede: JSON.parse(localStorage.getItem('sede')) || {},
      puesto: JSON.parse(localStorage.getItem('puesto')) || {},
    }
  },
  mounted() {
    this.getUsersGuardas();
  },

  methods: {
    async getUsersGuardas() {
      await axios.get('/api/getUsersGuardas').then((response) => {
        this.guardas = response.data;
        this.guardas.forEach(item => item.text = item.name.toUpperCase());
        this.guardas.unshift({ id: 'TODOS', text: 'TODOS' });
      });
    },
    async consultar() {
      this.spiner = true;
      await axios.post('/api/getReporteMinuta', this.formData).then((response) => {
        this.datos = response.data;
        if (this.datos.length > 0) { this.showResult = true }
        else { this.showResult = false }
        this.spiner = false;
        this.submited = false;
      });
    },

    makePDF() {
      location.href = '/api/pdf_recordMinuta?user_id=' + this.formData.user_id + '&fecha_inicial=' + this.formData.fecha_inicial + '&fecha_final=' + this.formData.fecha_final + '&nombre_sede=' + this.sede.nombre + '&nombre_puesto=' + this.puesto.nombre;
    },

    fecha(d) {
      return moment(d).format('DD-MM-YYYY HH:mm:ss');
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
        url: '/api/deleteRecordMinuta',
        title: 'Eliminar registro',
        message: '¿Está seguro de eliminar el registro que tiene como anotaciones: ' + record.anotaciones + '?'
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
      user_id: { required },
      fecha_inicial: { required },
      fecha_final: { required },
    }
  },

  components: { Modal, TRichSelect }

}
</script>
