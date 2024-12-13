<template>
   <div>
       <div v-if="!isLoading">
           <div class="container mx-auto my-10 px-4 h-full">
               <div class="flex content-center items-center justify-center h-full">
                   <div class="w-full md:w-3/4 lg:w-6/12 xl:w-4/12 px-4">
                       <div class="relative flex flex-col min-w-0 break-words w-full mb-6 bg-gray-700 border-1">
                           <div class="rounded-t mb-0 px-6 py-6">
                               <div class="btn-wrapper text-center mt-4">
                                   <h1 class="text-2xl uppercase text-blue-400 font-bold">{{userName}}</h1>
                               </div>
                               <hr class="mt-6 border-b-1 border-gray-300" />
                           </div>
                           <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
                               <div class="text-white text-center mb-3 font-bold">
                                   <p>Seleccione su puesto y sede</p>
                               </div>
                               <form>
                                   <div class="relative w-full mb-3">
                                       <label class="block text-white text-sm font-bold mb-2">
                                           Puesto
                                       </label>
                                       <select
                                           v-model="formData.puesto"
                                           class="border-0 px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                                       >
                                           <option disabled value="">Seleccione un puesto</option>
                                           <option v-for="puesto in puestos" :key="puesto.id" :value="puesto.id">
                                               {{ puesto.nombre }}
                                           </option>
                                       </select>
                                       <p class="text-red-500 text-sm" v-if="submited && !formData.puesto">Seleccione un puesto</p>
                                   </div>

                                   <div class="relative w-full mb-3">
                                       <label class="block text-white text-sm font-bold mb-2">
                                           Sede
                                       </label>
                                       <select
                                           v-model="formData.sede"
                                           class="border-0 px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                                       >
                                           <option disabled value="">Seleccione una sede</option>
                                           <option v-for="sede in sedes" :key="sede.id" :value="sede.id">
                                               {{ sede.nombre }}
                                           </option>
                                       </select>
                                       <p class="text-red-500 text-sm" v-if="submited && !formData.sede">Seleccione una sede</p>
                                   </div>

                                   <div class="text-center my-4">
                                       <button
                                           class="bg-blue-500 hover:bg-blue-600 text-white active:bg-gray-600 text-sm font-bold px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
                                           type="button"
                                           @click="guardarSeleccion"
                                       >
                                           Continuar
                                       </button>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <div class="loading-page" v-else>
           <Loading />
       </div>
   </div>
</template>

<script>
import Loading from '../layouts/Loading.vue';

export default {
    data() {
        return {
            isLoading: false,
            formData: {
                puesto: '',
                sede: ''
            },
            submited: false,
            userName: '',
            puestos: [],
            sedes: []
        };
    },

    mounted() {
        document.body.style.backgroundColor = 'rgba(55, 65, 81, 1)';
        const userString = localStorage.getItem("user");
        if (userString) {
            const user = JSON.parse(userString);
            this.userName = user.name;
        }

        const clientesData = JSON.parse(localStorage.getItem("puestos"));
        if (clientesData && Array.isArray(clientesData)) {
            this.puestos = clientesData.map(cliente => ({
                id: cliente.id,
                nombre: cliente.nombre
            }));
        }
    },

    beforeDestroy() {
        document.body.style.backgroundColor = '';
    },

    watch: {
        'formData.puesto'(nuevoPuesto) {
            const clientesData = JSON.parse(localStorage.getItem("puestos"));
            if (clientesData && Array.isArray(clientesData)) {
                const clienteSeleccionado = clientesData.find(cliente => cliente.id === nuevoPuesto);
                if (clienteSeleccionado) {
                    this.sedes = clienteSeleccionado.sedes.map(sede => ({
                        id: sede.sede_id,
                        nombre: sede.sede_nombre
                    }));
                } else {
                    this.sedes = [];
                }
            }
        }
    },

    methods: {
        guardarSeleccion() {
            this.submited = true;
            if (!this.formData.puesto || !this.formData.sede) {
                return;
            }
            const clientesData = JSON.parse(localStorage.getItem("puestos"));
            const clienteSeleccionado = clientesData.find(cliente => cliente.id === this.formData.puesto);
            if (clienteSeleccionado) {
                localStorage.setItem('permisosFormulario', JSON.stringify(clienteSeleccionado.permisos_formulario));
                localStorage.setItem('permisosMenu', JSON.stringify(clienteSeleccionado.permisos_menu));
                localStorage.setItem('puesto', JSON.stringify({ id: clienteSeleccionado.id, nombre: clienteSeleccionado.nombre }));

                const sedeSeleccionada = clienteSeleccionado.sedes.find(sede => sede.sede_id === this.formData.sede);
                
                if (sedeSeleccionada) {
                    localStorage.setItem('sede', JSON.stringify({ id: sedeSeleccionada.sede_id, nombre: sedeSeleccionada.sede_nombre }));
                } else {
                    console.error("Sede seleccionada no encontrada.");
                }
            }
            localStorage.removeItem('puestos');
            this.$router.push('/dashboard');
        }
    },

    components: { Loading }
};
</script>

