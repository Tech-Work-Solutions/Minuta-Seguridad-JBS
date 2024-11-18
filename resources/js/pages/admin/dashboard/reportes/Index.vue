<template>
   <div v-if="show">
      <div class="flex flex-wrap items-center">
         <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-chart-bar"></em> Reportes</h1>
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
                     <em class="fas fa-pen-fancy"></em> Reporte Minutas
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(2)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 2, 'text-white bg-blue-500': openTab === 2}"
                  >
                     <em class="fas fa-car"></em> Reporte Vehículos
                  </a>
               </li>
               <li class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                  <a 
                     class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                     v-on:click="toggleTabs(3)"
                     v-bind:class="{'text-gray-600 bg-white': openTab !== 3, 'text-white bg-blue-500': openTab === 3}"
                  >
                     <em class="fas fa-users"></em> Reporte Visitantes
                  </a>
               </li>
            </ul>
            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded">
            <div class="flex-auto">
               <div class="tab-content tab-space">
                  <div v-bind:class="{'hidden': openTab !== 1, 'block': openTab === 1}">
                     <ReporteMinutas />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 2, 'block': openTab === 2}">
                     <ReporteVehiculos />
                  </div>
                  <div v-bind:class="{'hidden': openTab !== 3, 'block': openTab === 3}">
                     <ReporteVisitantes />
                  </div>
                  
               </div>
            </div>
            </div>
         </div>
      </div>

  </div>
</template>

<script>
import ReporteMinutas from './tabs/ReporteMinutas.vue'
import ReporteVehiculos from './tabs/ReporteVehiculos.vue'
import ReporteVisitantes from './tabs/ReporteVisitantes.vue'

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
      if (rol === 'GUARDA DE SEGURIDAD'){
         this.$router.push('/dashboard');
         return;
      } 
      this.show = true; 
   },
   methods: {
      toggleTabs: function(tabNumber){
         this.openTab = tabNumber
      }
   },

   components: { ReporteMinutas, ReporteVehiculos, ReporteVisitantes }
}
</script>