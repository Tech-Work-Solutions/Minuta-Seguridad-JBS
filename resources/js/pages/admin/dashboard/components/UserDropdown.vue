<template>
  <div>
    <a class="text-blueGray-500 block" href="#pablo" ref="btnDropdownRef" v-on:click="toggleDropdown($event)">
      <div class="items-center flex">
        <p v-if="puesto.nombre && puesto.nombre.toLocaleLowerCase() !== 'master'"
          class="mx-2 text-white md:text-gray-600 text-sm uppercase">
          <b>Puesto:</b> {{ puesto.nombre }}
        </p>
        <p v-if="sede.nombre && sede.nombre.toLocaleLowerCase() !== 'sede master'"
          class="mx-2 text-white md:text-gray-600 text-sm uppercase">
          <b>Sede:</b> {{ sede.nombre }}
        </p>
        <p class="mx-2 text-white md:text-gray-600 text-sm uppercase">{{ currentUser.name }}</p>
        <span class="w-12 h-12 text-sm text-white bg-blueGray-200 inline-flex items-center justify-center rounded-full">

          <img alt="..." class="h-8 w-8 rounded-full align-middle border-none shadow-lg" :src="'./img/logo.png'" />
        </span>
      </div>
    </a>
    <div ref="popoverDropdownRef"
      class="bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg min-w-48" v-bind:class="{
        hidden: !dropdownPopoverShow,
        block: dropdownPopoverShow,
      }">
      <a href="#" @click.prevent="logout"
        class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700">
        Cerrar sesión
      </a>
      <a
      href="#"
        @click.prevent="changePuestoSede" 
        class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
        v-if="puestos.length > 1 || (puestos[0] && puestos[0].sedes && puestos[0].sedes.length > 1)"
      >
        Cambiar de puesto
      </a>

    </div>
  </div>
</template>

<script>
import { createPopper } from "@popperjs/core";

//import image from "@/assets/img/team-1-800x800.jpg";

export default {
  data() {
    return {
      dropdownPopoverShow: false,
      image: '',
      token: localStorage.getItem('token'),
      currentUser: {},
      sede: JSON.parse(localStorage.getItem('sede')) || {},
      puesto: JSON.parse(localStorage.getItem('puesto')) || {},
      puestos: JSON.parse(localStorage.getItem("puestos")|| '[]')
    };
  },
  methods: {
    toggleDropdown: function (event) {
      event.preventDefault();
      if (this.dropdownPopoverShow) {
        this.dropdownPopoverShow = false;
      } else {
        this.dropdownPopoverShow = true;
        createPopper(this.$refs.btnDropdownRef, this.$refs.popoverDropdownRef, {
          placement: "bottom-end",
        });
      }
    },

    logout() {
      window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
      axios.post('api/logout').then((response) => {
        const itemsToRemove = [
          'token',
          'rol',
          'user',
          'puesto',
          'sede',
          'permisosMenu',
          'permisosFormulario',
          'puestos'
        ];

        itemsToRemove.forEach(item => localStorage.removeItem(item));
        this.$router.push('/')
      }).catch((errors) => {
        console.log(errors)
      });
      window.axios.defaults.headers.common['Authorization'] = null;
    },

    changePuestoSede(){
      const itemsToRemove = [    
            'puesto',
            'sede',
            'permisosMenu',
            'permisosFormulario'
        ];
        itemsToRemove.forEach(item => localStorage.removeItem(item));
        this.$router.push('/login/config_page')
    }
  },

  mounted() {
    if (this.token != null) {
      window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
      axios.get('api/user').then((response) => {
        this.currentUser = response.data
      }).catch((errors) => {
        console.log(errors.response.data.errors)
      });
      window.axios.defaults.headers.common['Authorization'] = null;
    }

  }
};
</script>