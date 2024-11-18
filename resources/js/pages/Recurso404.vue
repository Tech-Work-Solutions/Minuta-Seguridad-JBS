<template>
   <div>
      <div v-if="!isLoading">
         <div class="w-full flex flex-wrap justify-center mb-10">
            <h1 class="m-10 text-2xl md:text-4xl text-blue-400 font-bold text-center">Recurso no encontrado</h1>
            <div class="w-full flex justify-center mb-20">
               <router-link to="/" class="text-blue-500 justify-center"> Regresar</router-link>
               <img :src="'./img/404.gif'" width="800" alt="404"> 
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
      return{
         isLoading: true,
      }
   },

   mounted(){
      setTimeout(() => {
         this.isLoading = false
      }, 1000)
   },

   components: { Loading }
}
</script>