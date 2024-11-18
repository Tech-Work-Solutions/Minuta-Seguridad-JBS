require('./bootstrap');

import VueTailwind from 'vue-tailwind'

window.Vue = require('vue').default;

import router from './routes';

import "@fortawesome/fontawesome-free/css/all.min.css"; 

import Vuelidate from 'vuelidate';
Vue.use(Vuelidate);

const components = {
//...
}

Vue.use(VueTailwind, components);

//Libreria de v-toaster
import Toaster from 'v-toaster' 
import 'v-toaster/dist/v-toaster.css' 
Vue.use(Toaster, {timeout: 5000})


//Componente principal
Vue.component('my-app', require('./App.vue').default);


const app = new Vue({ 
    el: '#app',
    router,
});
 