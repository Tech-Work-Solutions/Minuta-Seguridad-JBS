<template>
   <div>
      <div v-if="!isLoading">            
         <div class="container mx-auto mt-10 px-4 h-full">
            <div class="flex content-center items-center justify-center h-full">
               <div class="w-full md:w-6/12 lg:w-4/12 xl:w-4/12  px-4">
                  <div
                     class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-gray-700 md:bg-gray-700 border-0"
                  >
                     <div class="rounded-t mb-0 px-6 py-6">
                        
                        <div class="btn-wrapper text-center mt-4">
                           <h1 class="text-4xl text-blue-400 font-bold">SEGURIDAD JBS</h1>
                        </div>
                        <hr class="mt-6 border-b-1 border-gray-300" />
                     </div>
                     <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
                        <div class="text-white text-center mb-3 font-bold">
                        <p>Registro de usuarios</p>
                        </div>
                        <form>
                              <div class="relative w-full mb-3">
                              <label
                                 class="block text-white text-sm font-bold mb-2"
                                 htmlFor="grid-password"
                              >
                                 Nombre:
                              </label>
                              <input
                                 type="email"
                                 class="border-0  px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow border-green-700 focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                                 placeholder="Nombre ..."
                                 v-model="formData.name"
                              />
                              <p class="text-red-500 text-sm" v-text="errors.name"></p>
                           </div>
                        <div class="relative w-full mb-3">
                           <label
                              class="block text-white text-sm font-bold mb-2"
                              htmlFor="grid-password"
                           >
                              Correo electrónico:
                           </label>
                           <input
                              type="email"
                              class="border-0  px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow border-green-700 focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                              placeholder="ejemplo@ejemplo.com"
                              v-model="formData.email"
                           />
                           <p class="text-red-500 text-sm" v-text="errors.email"></p>
                        </div>

                        <div class="relative w-full mb-3">
                           <label
                              class="block text-white text-sm font-bold mb-2"
                              htmlFor="grid-password"
                           >
                              Contraseña
                           </label>
                           <input
                              type="password"
                              class="border-0 px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                              placeholder="Contraseña"
                              v-model="formData.password"
                           />
                           <p class="text-red-500 text-sm" v-text="errors.password"></p>
                        </div>
                        <div>
                           <label class="inline-flex items-center cursor-pointer">
                              <input
                              id="customCheckLogin"
                              type="checkbox"
                              class="form-checkbox border-0 rounded text-blue-300 ml-1 w-5 h-5 ease-linear transition-all duration-150"
                              />
                              <span class="ml-2 text-sm font-semibold text-white">
                              Recordarme
                              </span>
                           </label>
                        </div>

                        <div class="text-center mt-6">
                           <button
                              class="bg-blue-500 hover:bg-blue-600 text-white active:bg-gray-600 text-sm font-bold uppercase px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
                              type="button" @click="register"
                           >
                              Registrar usuario
                           </button>
                        </div>
                        </form>

                        <div class="flex flex-wrap mt-6 relative">
                           <div class="w-1/2">
                              <a href="javascript:void(0)" class="text-white">
                              <small>¿Olvido su contraseña?</small>
                              </a>
                           </div>
                        </div>
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
      return{
         isLoading: false,
         formData: {
            name: '',
            email: '',
            password: ''
         },
         errors: {},
      }
   },

   created() {
      this.isLoading = true
      setTimeout(() => {
         this.isLoading = false
      }, 1500)        
    },

    methods: {
       register(){
          axios.post('api/register', this.formData).then( (response) => {
             this.formData.name = this.formData.email = this.formData.password = ''
             this.errors = {}
             this.$router.push('/login')
          }).catch((errors) => {
             
             this.errors = errors.response.data.errors
         
             console.log(this.errors)
          })
       }
    },

    components: { Loading }
}
</script>


