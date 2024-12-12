<template>
  <nav
    class="md:left-0 md:block md:fixed md:top-0 md:bottom-0 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-xl bg-gray-700  flex flex-wrap items-center justify-between relative md:w-64 z-50 py-4 px-6"
  >
    <div
      class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between w-full mx-auto"
    >
      <!-- Toggler -->
      <button
        class="cursor-pointer text-white font-bold  md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
        type="button"
        v-on:click="toggleCollapseShow('bg-gray-600 m-2 py-3 px-6')"
      >
        <i class="fas fa-bars"></i>
      </button>
      <!-- Brand -->
      <router-link
        class="md:block text-left md:pb-2 text-white mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-2 px-0"
        :to="{ name: 'Dashboard' }"
      >
        <div class="flex justify-center items-center overflow-hidden">
          <img class="rounded-md hidden md:block h-32 " :src="url_logo" alt="">
        </div>
        <h1 class="text-2xl text-blue-400 m-3 text-center hidden md:block">SEGURIDAD JBS</h1>
      </router-link>
      <!-- User -->
      <ul class="md:hidden items-center flex flex-wrap list-none">
        <li class="inline-block relative">
          <notification-dropdown />
        </li>
        <li class="inline-block relative">
          <user-dropdown />
        </li>
      </ul>
      <!-- Collapse -->
      <div
        class="md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded"
        v-bind:class="collapseShow"
      >
        <!-- Collapse header -->
        <div
          class="md:min-w-full md:hidden block pb-4 mb-4 border-b border-solid border-white"
        >
          <div class="flex flex-wrap">
            <div class="w-6/12">
              <router-link
                class="md:block text-left md:pb-2 text-white mr-0 inline-block whitespace-nowrap text-lg uppercase font-bold p-4 px-0"
                :to="{ name: 'Dashboard' }"
              >
                Seguridad JBS
              </router-link>
            </div>
            <div class="w-6/12 flex justify-end">
              <button
                type="button"
                class="cursor-pointer text-white opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                v-on:click="toggleCollapseShow('hidden')"
              >
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <!-- <form class="mt-6 mb-4 md:hidden">
          <div class="mb-3 pt-0">
            <input
              type="text"
              placeholder="Search"
              class="border-0 px-3 py-2 h-12 border border-solid border-green-300 placeholder-gray-300 text-gray-600 bg-white rounded text-base leading-snug shadow-none outline-none focus:outline-none w-full font-normal"
            />
          </div>
        </form> -->

        <!-- Heading -->
        <h6
          class="md:min-w-full text-white text-xs uppercase font-bold block pt-1 pb-4 no-underline"
        >
          Opciones de menú
        </h6>
        <!-- Navigation -->

        <ul class="md:flex-col md:min-w-full flex flex-col list-none">
          <li class="items-center" v-if="rol !== 'ADMINISTRATIVO'">
            <router-link
              :to="{ name: 'Minuta' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/minuta')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-file-signature mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Minuta
              </a>
            </router-link>
          </li>

          <li class="items-center" v-if="rol !== 'ADMINISTRATIVO'">
            <router-link
              :to="{ name: 'Vehiculos' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/vehiculos')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-car mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Vehiculos
              </a>
            </router-link>
          </li>

          <li class="items-center" v-if="rol !== 'ADMINISTRATIVO'">
            <router-link
              :to="{ name: 'Visitantes' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/visitantes')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-users mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Visitantes
              </a>
            </router-link>
          </li>   

          <li class="items-center" v-if="rol === 'ADMINISTRADOR' || rol === 'ADMINISTRATIVO'">
            <router-link
              :to="{ name: 'Reportes' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/reportes')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-chart-bar mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Reportes
              </a>
            </router-link>
          </li>  

          <li class="items-center" v-if="rol === 'ADMINISTRADOR'">
            <router-link
              :to="{ name: 'Settings' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/configuraciones')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-cogs mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Configuraciones
              </a>
            </router-link>
          </li>       

          <li class="items-center" v-if="rol === 'ADMINISTRADOR'">
            <router-link
              :to="{ name: 'Usuarios' }"
              v-slot="{ href, isActive }"
            >
              <a
                :href="href"
                @click.prevent="navegar('/usuarios')"
                class="text-xs uppercase py-3 font-bold block"
                :class="[
                  isActive
                    ? 'text-blue-400 hover:text-white'
                    : 'text-white hover:text-gray-300',
                ]"
              >
                <i
                  class="fas fa-users-cog mr-2 text-sm"
                  :class="[isActive ? 'opacity-75' : 'text-white']"
                ></i>
                Usuarios
              </a>
            </router-link>
          </li>

          
        </ul>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />
        
        <!-- Navigation -->

        <ul class="md:flex-col md:min-w-full flex flex-col list-none md:mb-4">
            <li class="items-center">
               <p
               class="text-white hover:text-gray-300 text-xs uppercase py-3 font-bold block cursor-pointer"   
               @click="logout"            
               >
               <i class="fas fa-sign-out-alt text-white mr-2 text-sm"></i>               
               Cerrar sesión
               </p>
            </li>          
        </ul>
      </div>
    </div>
  </nav>
</template>


<script>
import NotificationDropdown from "../components/NotificationDropdown.vue";
import UserDropdown from "../components/UserDropdown.vue";

export default {
   data() {
      return {
        url_logo: '',
        collapseShow: "hidden",
        token: localStorage.getItem('token'),
        rol: localStorage.getItem('rol'),
      };
   },
  mounted() {
    axios.get('/api/getUrlLogo').then((response) => {
      this.url_logo = response.data;
    });
  },
   methods: {
      toggleCollapseShow: function (classes) {
         this.collapseShow = classes;
      },

      navegar(ruta) {
        this.toggleCollapseShow('hidden');
        this.$router.push(ruta);
      },

      logout(){
         window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
         axios.post('api/logout').then((response) => {
            localStorage.removeItem('token');
            localStorage.removeItem('rol');
            localStorage.removeItem('user');
            localStorage.removeItem('puesto');
            localStorage.removeItem('puestos');
            localStorage.removeItem('sede');
            localStorage.removeItem('permisosMenu');
            localStorage.removeItem('permisosFormulario');
            this.$router.push('/')
         }).catch((errors) => {
            console.log(errors)
         })
         window.axios.defaults.headers.common['Authorization'] = null;
      }
   },
   components: {
      NotificationDropdown,
      UserDropdown,
   },
};
</script>
