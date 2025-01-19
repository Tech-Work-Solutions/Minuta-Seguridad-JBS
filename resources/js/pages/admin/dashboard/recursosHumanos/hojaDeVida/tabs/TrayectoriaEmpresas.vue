<template>
    <div class="bg-gray-100 p-6">
        <div class="max-w-5xl mx-auto bg-white shadow-md rounded-lg p-6">
            <p class="text-center mb-6 text-sm">
                Seleccione en qué clase de empresas ha trabajado y en qué área(s) de estas empresas se ha
                desempeñado.
            </p>

            <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
                <div class="grid grid-cols-1 gap-2">
                    <div>
                        <h2 class="text-lg font-semibold text-blue-600 mb-4">
                            Empresas por Actividades Económicas (*)
                        </h2>
                        <div class="grid md:grid-cols-1 lg:grid-cols-3 gap-2">
                            <!-- Column 1 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesActividades.firstColumn"
                                    :class="getClassForTab(tab)" :key="tab.label">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas[tab.key]" />
                                    {{ tab.label }}
                                </label>

                            </div>
                            <!-- Column 2 -->
                            <div>

                                <label class="flex items-center"
                                    v-for="(tab, index) in opcionesActividades.secondColumn"
                                    :class="getClassForTab(tab)" :key="tab.label">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas[tab.key]" />
                                    {{ tab.label }}
                                </label>

                                <label class="flex items-center">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas.otrasEmpresas" />
                                    OTRAS EMPRESAS (¿Cuáles?)
                                </label>
                                <label class="flex items-center">
                                    <input type="text" :disabled="!formData.actividadesEconomicas.otrasEmpresas"
                                        class="ml-2 w-full py-2 px-3 border rounded-lg text-gray-700 focus:outline-none"
                                        v-model="formData.actividadesEconomicas.empresasOpcionales" />
                                </label>
                                <p class="text-red-500 text-sm" v-if="submited && hasErrorOtrasEmpresas">
                                    Ingrese en empresa trabajó
                                </p>
                            </div>

                            <div>

                                <label class="flex items-center" v-for="(tab, index) in opcionesActividades.thirdColumn"
                                    :class="getClassForTab(tab)" :key="tab.label">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas[tab.key]" />
                                    {{ tab.label }}
                                </label>

                                <label class="flex items-center">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas.otrosSectores" />
                                    OTROS SECTORES
                                </label>
                                <label class="flex items-center">
                                    <input type="text" :disabled="!formData.actividadesEconomicas.otrosSectores"
                                        class="ml-2 w-full py-2 px-3 border rounded-lg text-gray-700 focus:outline-none"
                                        v-model="formData.actividadesEconomicas.sectoresOpcionales" />
                                </label>
                                <p class="text-red-500 text-sm" v-if="submited && hasErrorOtrosSectores">
                                    Ingrese en qué sector trabajó
                                </p>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h2 class="text-lg font-semibold text-blue-600 mb-4">
                            Área de la Empresa
                        </h2>
                        <div class="grid md:grid-cols-1 lg:grid-cols-2 gap-2">
                            <!-- Column 1 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesAreas.firstColumn"
                                    :class="getClassForTab(tab)" :key="tab.label">
                                    <input type="checkbox" class="mr-2" v-model="formData.areasEmpresa[tab.key]" />
                                    {{ tab.label }}
                                </label>
                            </div>
                            <!-- Column 2 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesAreas.secondColumn"
                                    :class="getClassForTab(tab)" :key="tab.label">
                                    <input type="checkbox" class="mr-2" v-model="formData.areasEmpresa[tab.key]" />
                                    {{ tab.label }}
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" class="mr-2" v-model="formData.areasEmpresa.otrasAreas" />
                                    OTRAS (¿Cuáles?)
                                </label>
                                <label class="flex items-center">
                                    <input type="text" :disabled="!formData.areasEmpresa.otrasAreas"
                                        class="ml-2 w-full py-2 px-3 border rounded-lg text-gray-700 focus:outline-none"
                                        v-model="formData.areasEmpresa.areasOpcionales" />
                                </label>
                                <p class="text-red-500 text-sm" v-if="submited && hasErrorOtrasAreas">
                                    Ingrese en qué área trabajó
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flex mb-4 mt-5">
                    <button
                        class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                        type="submit">
                        <p v-if="!spiner && !isUpdating">Guardar</p>
                        <p v-else-if="!spiner && isUpdating">Actualizar</p>
                        <p v-else-if="spiner && !isUpdating"><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                        <p v-else><em class="fas fa-spinner fa-pulse"></em> Actualizando...</p>
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';
import { ACTIVIDADES_ECONOMICAS, AREAS_EMPRESA } from '../../../../../../constants';

export default {
    props: {
        trayectoria_empresas: {
            type: Object,
            default: () => ({})
        },
        userId: {
            type: Number,
            default: 0,
        },
        hasHv: {
            type: Boolean,
            default: false,
        }
    },
    data() {
        return {
            formData: {
                actividadesEconomicas: {
                    'agricultura': false,
                    'ganaderia': false,
                    'mineria': false,
                    'hidrocarburos': false,
                    'industria': false,
                    'alimentos': false,
                    'tabaco': false,
                    'textiles': false,
                    'cuero': false,
                    'papel': false,
                    'editorial': false,
                    'quimico': false,
                    'caucho': false,
                    'vidrio': false,
                    'metalurgia': false,
                    'maquinaria': false,
                    'automotores': false,
                    'muebles': false,
                    'reciclaje': false,
                    'electricidad': false,
                    'construcción': false,
                    'comercio': false,
                    'hoteles': false,
                    'transporte': false,
                    'comunicaciones': false,
                    'financiero': false,
                    'inmobiliario': false,
                    'informatico': false,
                    'salud': false,
                    'educacion': false,
                    'seguros': false,
                    'turismo': false,
                    'otrosServicios': false,
                    'asesorias': false,
                    'servicios': false,
                    'seguridad': false,
                    'otrosSectores': false,
                    'otrasEmpresas': false,
                    'empresasOpcionales': '',
                    'sectoresOpcionales': '',
                },
                areasEmpresa: {
                    'administracion': false,
                    'auditoria': false,
                    'bodega': false,
                    'compras': false,
                    'contabilidad': false,
                    'costos': false,
                    'credito': false,
                    'diseño': false,
                    'finanzas': false,
                    'gerencia': false,
                    'impuestos': false,
                    'mercadeo': false,
                    'produccion': false,
                    'publicidad': false,
                    'personal': false,
                    'sistemas': false,
                    'tesoreria': false,
                    'otrasAreas': false,
                    'areasOpcionales': '',
                }
            },
            opcionesActividades: {
                firstColumn: ACTIVIDADES_ECONOMICAS.slice(0, 14),
                secondColumn: ACTIVIDADES_ECONOMICAS.slice(14, 25),
                thirdColumn: ACTIVIDADES_ECONOMICAS.slice(25),
            },
            opcionesAreas: {
                firstColumn: AREAS_EMPRESA.slice(0, 14),
                secondColumn: AREAS_EMPRESA.slice(14),
            },
            submited: false,
            isUpdating: false,
            spiner: false,
            hasErrorOtrosSectores: false,
            hasErrorOtrasEmpresas: false,
            hasErrorOtrasAreas: false,
        }
    },
    watch: {
        "formData.actividadesEconomicas.otrosSectores"(newValue) {
            if (newValue === false) {
                this.formData.actividadesEconomicas.sectoresOpcionales = "";
            }
            if (newValue === false && this.hasErrorOtrosSectores) {
                this.hasErrorOtrosSectores = false;
            }
        },
        "formData.actividadesEconomicas.otrasEmpresas"(newValue) {
            if (newValue === false) {
                this.formData.actividadesEconomicas.empresasOpcionales = "";
            }

            if (newValue === false && this.hasErrorOtrasEmpresas) {
                this.hasErrorOtrasEmpresas = false;
            }
        },
        "formData.areasEmpresa.otrasAreas"(newValue) {
            if (newValue === false) {
                this.formData.areasEmpresa.areasOpcionales = "";
            }

            if (newValue === false && this.hasErrorOtrasAreas) {
                this.hasErrorOtrasAreas = false;
            }
        },
    },

    async mounted() {
        this.spiner = false;
        await this.loadData();
    },

    methods: {
        async handleSubmit() {
            try {
                if (!this.validarDatos()) {
                    return;
                }
                this.spiner = true;
                const formData = new FormData();

                formData.append("user_id", this.userId);
                formData.append("trayectoria_empresas", JSON.stringify({
                    actividadesEconomicas: this.formData.actividadesEconomicas,
                    areasEmpresa: this.formData.areasEmpresa,
                }));

                if (this.isUpdating) {
                    await axios.post("/api/updateHv", formData);
                    this.spiner = false;
                    this.submited = false;
                    this.$toaster.success("Datos actualizados con éxito.");
                } else {
                    await axios.post("/api/registerHv", formData);
                    this.isUpdating = true;
                    this.spiner = false;
                    this.submited = false;
                    this.$toaster.success("Datos registrados con éxito.");
                }

            } catch (error) {
                this.spiner = false;
                console.error(error);
                this.$toaster.error("Hubo un problema al guardar los datos.");
            }
        },
        async loadData() {
            if (this.trayectoria_empresas && Object.keys(this.trayectoria_empresas).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.trayectoria_empresas);
            }
        },
        hasAtLeastOneTrue() {
            const minCheckActividadEconomica = Object.values(this.formData.actividadesEconomicas).some(value => value === true);
            const minCheckAreasEmpresa = Object.values(this.formData.areasEmpresa).some(value => value === true);
            return minCheckActividadEconomica && minCheckAreasEmpresa;
        },
        checkRequiredOtherOptions() {
            const { otrosSectores, sectoresOpcionales, otrasEmpresas, empresasOpcionales } = this.formData.actividadesEconomicas;
            const { otrasAreas, areasOpcionales, } = this.formData.areasEmpresa;
            this.hasErrorOtrosSectores = otrosSectores && sectoresOpcionales === "" ? true : false;
            this.hasErrorOtrasAreas = otrasAreas && areasOpcionales === "" ? true : false;
            this.hasErrorOtrasEmpresas = otrasEmpresas && empresasOpcionales === "" ? true : false;
            return this.hasErrorOtrosSectores || this.hasErrorOtrasAreas || this.hasErrorOtrasEmpresas
        },
        hasSubchecksEmpty(formData) {
            const { industria, otrosServicios, ...rest } = formData.actividadesEconomicas;
            const subActividades = [
                'alimentos', 'tabaco', 'textiles', 'cuerocalzado',
                'papel', 'editorial', 'quimico', 'caucho',
                'vidrio', 'metalurgia', 'maquinaria', 'automotores',
                'muebles', 'reciclaje'
            ];

            const subServicios = [
                'asesorias', 'servicios', 'seguridad'
            ];
            const hasAtLeastOneTrueSubActividad = subActividades.some(key => rest[key]);
            const hasAtLeastOneTrueSubServicio = subServicios.some(key => rest[key]);

            if (industria && !hasAtLeastOneTrueSubActividad || !industria && hasAtLeastOneTrueSubActividad) {
                return true
            }

            if (otrosServicios && !hasAtLeastOneTrueSubServicio || !otrosServicios && hasAtLeastOneTrueSubServicio) {
                return true
            }
            return false;
        },
        getClassForTab(tab) {
            return {
                'pl-5': tab.tipo === 'sub'
            };
        },
        validarDatos() {
            this.submited = true;
            this.$v.$touch();

            if (this.checkRequiredOtherOptions()) {
                this.$toaster.error("Hay errores en el formulario other, Por favor, corrígelos.");
                return false;
            }

            if (this.hasSubchecksEmpty(this.formData)) {
                this.$toaster.error("Ha dejado incompleto Industria o un subServicio, favor completar.");
                return false;
            }

            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
                return false;
            }

            if (!this.hasAtLeastOneTrue()) {
                this.$toaster.error("Debes seleccionar al menos una actividad y un área. Por favor, corrígelos.");
                return false;
            }


            return true;
        },
    },

    validations: {
        formData: {
        }
    },

    computed: {

    },

    components: { TRichSelect }

}
</script>