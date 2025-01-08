<template>
    <div v-if="show">
        <div class="flex flex-wrap items-center">
            <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold">
                <i class="fas fa-cogs"></i> Hoja de vida
            </h1>
        </div>
        <br>
        <div class="flex flex-wrap">
            <div class="w-full">
                <!-- Tabs Navigation -->
                <ul class="flex mb-0 list-none flex-wrap pt-3 pb-4 flex-row">
                    <li v-for="(tab, index) in tabs" :key="index"
                        class="m-2 last:mr-0 flex-auto text-center cursor-pointer">
                        <a class="text-sm font-bold px-5 py-3 shadow-lg rounded block leading-normal"
                            :class="tabClasses(index + 1)" @click="toggleTabs(index + 1)">
                            <em :class="tab.icon"></em> {{ tab.label }}
                        </a>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded">
                    <div class="flex-auto">
                        <div class="tab-content tab-space">
                            <div v-for="(tab, index) in tabs" :key="index"
                                :class="{ 'hidden': openTab !== index + 1, 'block': openTab === index + 1 }">
                                <component :is="tab.component" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import InformacionGeneral from './tabs/InformacionGeneral.vue';
import InformacionPersonal from './tabs/InformacionPersonal.vue';
import InformacionFamiliar from './tabs/InformacionFamiliar.vue';
import EducacionAptitudes from './tabs/EducacionAptitudes.vue';
import TrayectoriaEmpresas from './tabs/TrayectoriaEmpresas.vue';
import ExperienciaLaboral from './tabs/ExperienciaLaboral.vue';
import ReferenciasPersonales from './tabs/ReferenciasPersonales.vue';
import AdministracionProcesoSeleccion from './tabs/AdministracionProcesoSeleccion.vue';

export default {
    name: "tabs",
    data() {
        return {
            openTab: 1,
            show: false,
            tabs: [
                { label: 'Información General', icon: 'fas fa-user-shield', component: 'InformacionGeneral' },
                { label: 'Información Personal', icon: 'fas fa-user-shield', component: 'InformacionPersonal' },
                { label: 'Información Familiar', icon: 'fas fa-user-shield', component: 'InformacionFamiliar' },
                { label: 'Educación y Aptitudes', icon: 'fas fa-caravan', component: 'EducacionAptitudes' },
                { label: 'Trayectoria Empresas', icon: 'fas fa-building', component: 'TrayectoriaEmpresas' },
                { label: 'Experiencia Laboral', icon: 'fas fa-building', component: 'ExperienciaLaboral' },
                { label: 'Referencias Personales', icon: 'fas fa-user-shield', component: 'ReferenciasPersonales' },
                { label: 'Administración Proceso de Selección', icon: 'fas fa-pen-fancy', component: 'AdministracionProcesoSeleccion' },
            ],
        };
    },
    mounted() {
        const rol = localStorage.getItem('rol');
        if (rol === 'GUARDA DE SEGURIDAD') {
            this.$router.push('/dashboard');
        }
        this.show = true;
    },
    methods: {
        toggleTabs(tabNumber) {
            this.openTab = tabNumber;
        },
        tabClasses(tabNumber) {
            return this.openTab === tabNumber
                ? 'text-white bg-blue-500'
                : 'text-gray-600 bg-white';
        },
    },
    components: {
        InformacionGeneral,
        InformacionPersonal,
        InformacionFamiliar,
        EducacionAptitudes,
        TrayectoriaEmpresas,
        ExperienciaLaboral,
        ReferenciasPersonales,
        AdministracionProcesoSeleccion,
    },
};
</script>