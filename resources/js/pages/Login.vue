<template>
   <div>
      <div v-if="!isLoading">
         <div class="container mx-auto my-10 px-4 h-full">
            <div class="flex content-center items-center justify-center h-full">
               <div class="w-full md:w-3/4 lg:w-6/12 xl:w-4/12  px-4">
                  <div
                     class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-gray-700 md:bg-gray-700 border-1"
                  >
                     <div class="rounded-t mb-0 px-6 py-6">
                        <div class="flex justify-center items-center overflow-hidden">
                           <img class="rounded-md h-32" :src="'./img/logo3.png'" alt="">
                        </div>
                        <div class="btn-wrapper text-center mt-4">
                           <h1 class="text-2xl uppercase text-blue-400 font-bold">SEGURIDAD JBS</h1>
                        </div>
                        <hr class="mt-6 border-b-1 border-gray-300" />
                     </div>
                     <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
                        <div class="text-white text-center mb-3 font-bold">
                        <p>Ingrese sus credenciales</p>
                        <p class="text-red-500 text-sm" v-if="error">Datos incorrectos</p>
                        </div>
                        <form>
                        <div class="relative w-full mb-3">
                           <label
                              class="block text-white text-sm font-bold mb-2"
                              htmlFor="grid-password"
                           >
                              Correo electrónico
                           </label>
                           <input
                              type="email"
                              class="border-0  px-3 py-3 placeholder-gray-400 text-gray-600 bg-white rounded text-sm shadow border-green-700 focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                              placeholder="ejemplo@ejemplo.com"
                              v-model="formData.email"
                              @keyup.enter="login"
                              autofocus
                           />
                           <p class="text-red-500 text-sm" v-if="submited && !$v.formData.email.required">Ingrese su correo electrónico</p>
                           <p class="text-red-500 text-sm" v-if="submited && !$v.formData.email.email">El correo electrónico no es valido</p>
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
                              @keyup.enter="login"
                           />
                           <p class="text-red-500 text-sm" v-if="submited && !$v.formData.password.required">Ingrese su contraseña</p>
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

                        <div class="text-center my-4">
                           <button
                              id="btnLogin"
                              class="bg-blue-500 hover:bg-blue-600 text-white active:bg-gray-600 text-sm font-bold px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
                              type="button" @click="login"
                           >
                              <p v-if="!spiner">Ingresar</p>
                              <p v-else><i class="fas fa-spinner fa-pulse"></i> Validando...</p>
                           </button>
                        </div>
                        </form>
                        <div class="flex justify-center items-center overflow-hidden">
                           <img class="rounded-md h-28" :src="'./img/Supervigilancia.png'" alt="">
                        </div>

                        <!-- <div class="flex flex-wrap mt-6 relative">
                           <div class="w-1/2">
                              <a href="javascript:void(0)" class="text-blueGray-200">
                              <small>¿Olvido su contraseña?</small>
                              </a>
                           </div>
                        </div> -->
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
import { required, email } from 'vuelidate/lib/validators';
export default {
   data() {
      return{
         isLoading: false,
         formData: {
            email: '',
            password: '',
            device_name: 'browser'
         },
         errors: {},
         submited: false,
         spiner: false,
         error: false,
         sedes: []
      }
   },

   created() {
      this.isLoading = true
      setTimeout(() => {
         this.isLoading = false
      }, 1500)        
    },

    methods: {
       login(){
          this.error = false;
          this.spiner = true;
          this.validarDatos()
       },

       async verificarLogin() {
         try {
            const response = await axios.post('api/login', this.formData);
            const { user, datosUser, status } = response.data;

            if (status === 423) {
                  this.error = true;
                  this.spiner = false;
                  return;
            } else if (datosUser.estado === '1') {
                  localStorage.setItem('token', user);
                  localStorage.setItem('rol', datosUser.rol);
                  localStorage.setItem('user', JSON.stringify(datosUser));

                  await this.getSedesAndClientesByUser({ user_id: datosUser.id });

                  if(this.sedes.length > 1) {
                     const sedes = this.sedes.slice();
                     const clientes = sedes.reduce((acc, sede) => {
                        const clienteIndex = acc.findIndex(c => c.id === sede.cliente.id);
                        if (clienteIndex === -1) {
                           acc.push({
                                 ...sede.cliente,
                                 sedes: [{
                                    sede_id: sede.sede_id,
                                    sede_nombre: sede.sede_nombre
                                 }]
                           });
                        } else {
                           acc[clienteIndex].sedes.push({
                                 sede_id: sede.sede_id,
                                 sede_nombre: sede.sede_nombre
                           });
                        }
                        return acc;
                     }, []);

                     localStorage.setItem('puestos', JSON.stringify(clientes));
                     this.$router.push('/login/config_page');
                  } else {
                     localStorage.setItem('puesto', JSON.stringify(this.sedes[0].cliente.id));
                     localStorage.setItem('sede', this.sedes[0].sede_id);
                     localStorage.setItem('permisosFormulario', JSON.stringify(this.sedes[0].cliente.permisos_formulario));
                     localStorage.setItem('permisosMenu', JSON.stringify(this.sedes[0].cliente.permisos_menu));
                     this.$router.push('/dashboard');
                  }
                  this.spiner = false;
            } else {
                  this.error = true;
                  this.spiner = false;
                  this.errors = errors.response.data.errors;
            }
         } catch (errors) {
            this.error = true;
            this.spiner = false;
            this.errors = errors.response.data.errors;
         }
      },

      validarDatos(){
         this.submited = true;
         this.$v.$touch();
         if(this.$v.$invalid){
            this.spiner = false;
            return false;
         }   
         this.verificarLogin();          
      },
      async getSedesAndClientesByUser(params) {
         try {
            const response = await axios.get('/api/getSedesAndClientesByUser', { params });
            this.sedes = response.data.sedes;
         } catch (errors) {
            console.log(errors.response.data.errors);
         }
      },
    },

   validations: {
      formData: {
         email: { required, email },
         password: { required },            
      }
      
   },

    components: { Loading }
}
</script>


<style scoped>
   .fondo-img {
      width: 100%;
      height: calc(100% - 98px);      
      background-repeat: no-repeat;
      background-size: cover;      
      background-position: center;
      position: absolute;
   }
</style>