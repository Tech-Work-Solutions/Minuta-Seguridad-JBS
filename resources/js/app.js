require('./bootstrap');

import VueTailwind from 'vue-tailwind'

window.Vue = require('vue').default;

import router from './routes';

import "@fortawesome/fontawesome-free/css/all.min.css"; 

import Vuelidate from 'vuelidate';

import ToggleButton from 'vue-js-toggle-button';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';

Vue.use(Vuelidate);
Vue.use(VueTailwind, {});
Vue.use(ToggleButton);
Vue.use(Vuetify);

import Toaster from 'v-toaster' 
import 'v-toaster/dist/v-toaster.css' 
Vue.use(Toaster, {timeout: 5000})


Vue.component('my-app', require('./App.vue').default);
Vue.config.productionTip = false

Vue.use(ToggleButton)

const app = new Vue({ 
    el: '#app',
    router,
    vuetify: new Vuetify(),
});