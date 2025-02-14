<template>
    <div v-if="show">
        <div class="flex flex-wrap items-center">
            <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold">
                <i class="fas fa-paperclip"></i> Hoja de vida: {{ currentUser.name }} -
                {{ currentUser.numero_documento }}
            </h1>
        </div>
        <br>
        <div class="flex flex-wrap">
            <div class="w-full">
                <!-- Tabs Navigation -->
                <ul class="flex mb-0 list-none flex-wrap pt-3 pb-4 flex-row">
                    <li v-for="(tab, index) in tabs" :key="index"
                        class="m-2 last:mr-0 flex-auto text-center cursor-pointer max-w-xs">
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
                                <component :is="tab.component" v-bind="tab.data" :userId="userId" :hasHv="hasHv" />
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
                { label: 'Información General', icon: 'fas fa-user-shield', component: 'InformacionGeneral', data: {}, key: 'informacion_general' },
                { label: 'Información Personal', icon: 'fas fa-user-shield', component: 'InformacionPersonal', data: {}, key: 'informacion_personal' },
                { label: 'Información Familiar', icon: 'fas fa-user-shield', component: 'InformacionFamiliar', data: {}, key: 'informacion_familiar' },
                { label: 'Educación y Aptitudes', icon: 'fas fa-caravan', component: 'EducacionAptitudes', data: {}, key: 'educacion_aptitudes' },
                { label: 'Trayectoria Empresas', icon: 'fas fa-building', component: 'TrayectoriaEmpresas', data: {}, key: 'trayectoria_empresas' },
                { label: 'Experiencia Laboral', icon: 'fas fa-building', component: 'ExperienciaLaboral', data: {}, key: 'experiencia_laboral' },
                { label: 'Referencias Personales', icon: 'fas fa-user-shield', component: 'ReferenciasPersonales', data: {}, key: 'referencias_personales' },
                { label: 'Administración Proceso de Selección', icon: 'fas fa-pen-fancy', component: 'AdministracionProcesoSeleccion', data: {}, key: 'administracion_proceso_seleccion' },
            ],
            userId: null,
            hasHv: false,
            currentUser: {},
            userObject: localStorage.getItem("user"),
        };
    },
    async mounted() {
        const userIdByParam = this.$route.params.id;
        const rol = localStorage.getItem('rol');
        if (rol === 'GUARDA DE SEGURIDAD') {
            this.$router.push('/dashboard');
        }

        if (this.userObject) {
            const user = JSON.parse(this.userObject);
            this.userId = Number(userIdByParam) || user.id;
        }
        await this.loadData();
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
        async loadData() {
            try {
                const responseUser = await axios.get('/api/getUser/' + this.userId);
                if (responseUser && Object.keys(responseUser.data).length > 0) {
                    this.currentUser = responseUser.data;
                } else {
                    this.currentUser = JSON.parse(this.userObject);
                }
                const response = await axios.get(`/api/getHv`, {
                    params: {
                        user_id: this.userId,
                    },
                });
                const savedHv = response.data;
                if (savedHv.length > 0) {
                    const hv = savedHv[0];
                    this.hasHv = true;
                    this.tabs.forEach(tab => {
                        tab.data[tab.key] = JSON.parse(hv[tab.key]);
                        tab.data.foto = hv.foto;
                        tab.data.soportes = hv.soportes;
                        tab.data.firma = hv.firma;
                        tab.data.firma_autorizador = hv.firma_autorizador;
                    });
                }
            } catch (error) {
                console.error(error);
                this.$toaster.error("Hubo un problema al cargar los datos.");
            }
        }
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