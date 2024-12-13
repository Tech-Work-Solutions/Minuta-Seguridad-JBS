import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from './pages/Login.vue'
//import Register from './pages/Register.vue'
import Dashboard from './pages/Dashboard.vue'
import Minuta from './pages/admin/dashboard/records/Minuta.vue'
import Vehiculos from './pages/admin/dashboard/records/Vehiculos.vue'
import Visitantes from './pages/admin/dashboard/records/Visitantes.vue'
import Reportes from './pages/admin/dashboard/reportes/Index.vue'
import Settings from './pages/admin/dashboard/settings/Index.vue'
import Usuarios from './pages/admin/dashboard/users/Usuarios.vue'
import AddUser from './pages/admin/dashboard/users/AddUser.vue'
import EditUser from './pages/admin/dashboard/users/EditUser.vue'
import EditMinuta from './pages/admin/dashboard/records/EditMinuta.vue'
import EditRecordVehicle from './pages/admin/dashboard/records/EditVehicle.vue'
import EditRecordVisitante from './pages/admin/dashboard/records/EditVisitante.vue'
import ConfigPage from './pages/ConfigPage.vue'
import Recurso404 from './pages/Recurso404.vue'

Vue.use(VueRouter)
 

const routes = [
    {
        path: "/",
        name: "Login",
        component: Login,
        meta: { guest: true } //Si esta autenticado bloqueamos la vista login
    },

    /**{
        path: "/register",
        name: "Register",
        component: Register,
        meta: { guest: true } //Si esta autenticado bloqueamos la vista register
    }, */
    { 
      path: "/login/config_page",
      name: "ConfigPage",
      component: ConfigPage,
      meta: { requiresAuth: true }
    },
    {
        path: "/dashboard",
        name: "Dashboard",
        component: Dashboard,
        meta: { requiresAuth: true }, //Para proteger la vista y validar que el usuario este logueado
        children: [
            {
            path: "/usuarios",
            name: "Usuarios",
            meta: { requiresAuth :true },
            components: {
                  default: Dashboard,
                  MainView: Usuarios
               }
            },
            {
              path: "/add_user",
              name: "AddUser",
              meta: { requiresAuth :true },
              components: {
                    default: Dashboard,
                    MainView: AddUser
                 }
            },
            {
              path: "/edit_user/:id",
              name: "EditUser",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: EditUser
              }
            },
            {
              path: "/minuta",
              name: "Minuta",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: Minuta
              }
            },
            {
              path: "/edit_minuta/:id",
              name: "EditMinuta",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: EditMinuta
              }
            },
            {
              path: "/vehiculos",
              name: "Vehiculos",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: Vehiculos
              }
            },
            {
              path: "/edit_record_vehicle/:id",
              name: "EditRecordVehicle",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: EditRecordVehicle
              }
            },
            {
              path: "/visitantes",
              name: "Visitantes",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: Visitantes
              }
            },
            {
              path: "/edit_record_visitante/:id",
              name: "EditRecordVisitante",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: EditRecordVisitante
              }
            },
            {
              path: "/reportes",
              name: "Reportes",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: Reportes
              }
            },
            {
              path: "/configuraciones",
              name: "Settings",
              meta: { requiresAuth :true },
              components: {
                default: Dashboard,
                MainView: Settings
              }
            },
        ]
    },
    {
      path: "/*",
      name: "Recurso404",
      component: Recurso404
    },
    

]

const router = new  VueRouter({
   mode: "history",
   routes 
})

function loggedIn(){
   return localStorage.getItem('token');
}

function passedConfigPage() {
  return localStorage.getItem('puesto') && localStorage.getItem('sede');
}

router.beforeEach((to, from, next) => {
  if (to.path === '/login/config_page' && loggedIn() && passedConfigPage()) {
    next({
      path: '/dashboard'
    });
  }
  else if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!loggedIn()) {
      next({
        path: '/',
        query: { redirect: to.fullPath }
      });
    } else {
      next();
    }
  }
  else if (to.matched.some(record => record.meta.guest)) {
    if (loggedIn() && passedConfigPage()) {
      next({
        path: '/dashboard',
        query: { redirect: to.fullPath }
      });
    } else if (loggedIn() && !passedConfigPage()) {
      next({
        path: '/login/config_page',
        query: { redirect: to.fullPath }
      });
    } else {
      next();
    }
  }
  else {
    next();
  }
});


 export default router;