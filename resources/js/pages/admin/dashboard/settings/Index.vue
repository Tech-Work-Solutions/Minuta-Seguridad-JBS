<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><i class="fas fa-cogs"></i> Configuraciones</h1>
      </div>
      <br>
      <div class="flex flex-wrap">
         <div class="w-full">
            <ul class="flex mb-0 list-none flex-wrap pt-3 pb-4 flex-row">
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(1)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 1, 'text-white bg-blue-500': openTab === 1}"
                  >
                     <em class="fas fa-car"></em> Vehículos
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(2)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 2, 'text-white bg-blue-500': openTab === 2}"
                  >
                     <em class="fas fa-user-shield"></em> Conductores
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(3)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 3, 'text-white bg-blue-500': openTab === 3}"
                  >
                     <em class="fas fa-globe"></em> Procedencias
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(4)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 4, 'text-white bg-blue-500': openTab === 4}"
                  >
                     <em class="fas fa-caravan"></em> Tipo de vehículos
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(5)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 5, 'text-white bg-blue-500': openTab === 5}"
                  >
                     <em class="fas fa-hospital-alt"></em> Eps
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(6)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 6, 'text-white bg-blue-500': openTab === 6}"
                  >
                     <em class="fas fa-building"></em> Arl
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(7)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 7, 'text-white bg-blue-500': openTab === 7}"
                  >
                     <em class="fas fa-pen-fancy"></em> Asuntos
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer max-w-xs">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(8)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 8, 'text-white bg-blue-500': openTab === 8}"
                  >
                     <em class="fas fa-id-card"></em> Tipos documento
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer max-w-xs">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(9)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 9, 'text-white bg-blue-500': openTab === 9}"
                  >
                     <em class="fas fa-user-circle"></em> Ubicaciones
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer max-w-xs">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(10)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 10, 'text-white bg-blue-500': openTab === 10}"
                  >
                     <em class="fas fa-user-circle"></em> Puestos
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer max-w-xs">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(11)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 11, 'text-white bg-blue-500': openTab === 11}"
                  >
                     <em class="fas fa-user-circle"></em> Sedes
                  </a>
               </li>
            </ul>
            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded">
            <div class="flex-auto">
               <div class="tab-content tab-space">
                  <div v-bind:class="{'hidden': openTab !== 1, 'block': openTab === 1}">
                     <Vehiculos />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 2, 'block': openTab === 2}">
                     <Conductores />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 3, 'block': openTab === 3}">
                     <Procedencias />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 4, 'block': openTab === 4}">
                     <Volquetas />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 5, 'block': openTab === 5}">
                     <Eps />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 6, 'block': openTab === 6}">
                     <Arl />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 7, 'block': openTab === 7}">
                     <Subject />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 8, 'block': openTab === 8}">
                     <TipoDocumento />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 9, 'block': openTab === 9}">
                     <Ubicacion />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 10, 'block': openTab === 10}">
                     <Clientes />
                  </div>
                  <div v-bind:class="{'hidden': openTab !==11, 'block': openTab === 11}">
                     <Sedes />
                  </div>
               </div>
            </div>
            </div>
         </div>
      </div>

  </div>
</template>

<script>
import Vehiculos from './tabs/Vehiculos.vue';
import Conductores from './tabs/Conductores.vue';
import Procedencias from './tabs/Procedencias.vue';
import Volquetas from './tabs/Volquetas.vue';
import Eps from './tabs/Eps.vue';
import Arl from './tabs/Arl.vue';
import Subject from './tabs/Subject.vue';
import TipoDocumento from './tabs/TipoDocumento.vue';
import Ubicacion from './tabs/Ubicacion.vue';
import Clientes from './tabs/Clientes';
import Sedes from './tabs/Sedes';
export default {
   name: "tabs",
   data() {
      return {
         openTab: 1,
         show: false
      }
   },
   mounted() {
      const rol = localStorage.getItem('rol');
      if (rol == 'GUARDA DE SEGURIDAD'){
         this.$router.push('/dashboard');
      } 
      this.show = true; 
   },
   methods: {
      toggleTabs: function(tabNumber){
         this.openTab = tabNumber
         if (tabNumber === 11) {
            this.$emit('tab-activated', 'sedes');
         }
      }
   },

   components: { Vehiculos, Conductores, Procedencias, Volquetas, Eps, Arl, Subject, TipoDocumento, Ubicacion, Clientes, Sedes }
}
</script>