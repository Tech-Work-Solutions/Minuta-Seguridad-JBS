<template>
    <div class="bg-gray-100 p-6">
        <div class="max-w-5xl mx-auto bg-white shadow-md rounded-lg p-6">
            <h1 class="text-xl font-bold text-center bg-blue-600 text-white p-2 rounded mb-4">
                V. Trayectoria por Empresas
            </h1>
            <p class="text-center mb-6 text-sm">
                Marque con una equis (X) en qué clase de empresas ha trabajado y en qué área(s) de estas empresas se ha
                desempeñado.
            </p>

            <!-- Form Container -->
            <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
                <div class="grid grid-cols-1 gap-2">
                    <!-- Empresas por Actividades Económicas -->
                    <div>
                        <h2 class="text-lg font-semibold text-blue-600 mb-4">
                            Empresas por Actividades Económicas (*)
                        </h2>
                        <div class="grid md:grid-cols-1 lg:grid-cols-2 gap-2">
                            <!-- Column 1 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesActividades.firstColumn"
                                    :key="tab.label">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas[tab.key]" />
                                    {{ tab.label }}
                                </label>

                            </div>
                            <!-- Column 2 -->
                            <div>

                                <label class="flex items-center"
                                    v-for="(tab, index) in opcionesActividades.secondColumn" :key="tab.label">
                                    <input type="checkbox" class="mr-2"
                                        v-model="formData.actividadesEconomicas[tab.key]" />
                                    {{ tab.label }}
                                </label>

                                <label class="flex items-center">
                                    Otros: <input type="text"
                                        class="ml-2 w-full py-2 px-3 border rounded-lg text-gray-700 focus:outline-none"
                                        v-model="formData.actividadesEconomicas.otros" />
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Área de la Empresa -->
                    <div>
                        <h2 class="text-lg font-semibold text-blue-600 mb-4">
                            Área de la Empresa
                        </h2>
                        <div class="grid md:grid-cols-1 lg:grid-cols-2 gap-2">
                            <!-- Column 1 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesAreas.firstColumn"
                                    :key="tab.label">
                                    <input type="checkbox" class="mr-2" v-model="formData.areasEmpresa[tab.key]" />
                                    {{ tab.label }}
                                </label>
                            </div>
                            <!-- Column 2 -->
                            <div>
                                <label class="flex items-center" v-for="(tab, index) in opcionesAreas.secondColumn"
                                    :key="tab.label">
                                    <input type="checkbox" class="mr-2" v-model="formData.areasEmpresa[tab.key]" />
                                    {{ tab.label }}
                                </label>
                                <label class="flex items-center">
                                    Otros: <input type="text"
                                        class="ml-2 w-full py-2 px-3 border rounded-lg text-gray-700 focus:outline-none"
                                        v-model="formData.areasEmpresa.otros" />
                                </label>
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
                    'otros': ''
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
                    'otros': ''
                }
            },
            opcionesActividades: {
                firstColumn: [
                    { label: 'AGRICULTURA', key: 'agricultura' },
                    { label: 'GANADERÍA / AVICULTURA', key: 'ganaderia' },
                    { label: 'MINERÍA', key: 'mineria' },
                    { label: 'HIDROCARBUROS', key: 'hidrocarburos' },
                    { label: 'INDUSTRIA', key: 'industria' },
                    { label: 'Alimentos y Bebidas', key: 'alimentos' },
                    { label: 'Tabaco', key: 'tabaco' },
                    { label: 'Textiles y Confecciones', key: 'textiles' },
                    { label: 'Cuero y Calzado', key: 'cuerocalzado' },
                    { label: 'Papel y Cartón', key: 'papel' },
                    { label: 'Editorial', key: 'editorial' },
                    { label: 'Químico y Farmacéutico', key: 'quimico' },
                    { label: 'Caucho y Plástico', key: 'caucho' },
                    { label: 'Vidrio, Cerámica y Cemento', key: 'vidrio' },
                ],
                secondColumn: [
                    { label: 'Metalurgia', key: 'metalurgia' },
                    { label: 'Maquinaria', key: 'maquinaria' },
                    { label: 'Automotores', key: 'automotores' },
                    { label: 'Muebles', key: 'muebles' },
                    { label: 'Reciclaje', key: 'reciclaje' },
                    { label: 'ELECTRICIDAD / Gas / Agua', key: 'electricidad' },
                    { label: 'CONSTRUCCIÓN', key: 'construccion' },
                    { label: 'COMERCIO', key: 'comercio' },
                    { label: 'HOTELES Y RESTAURANTES', key: 'hoteles' },
                    { label: 'TRANSPORTE Y ALMACENAMIENTO', key: 'transporte' },
                    { label: 'COMUNICACIONES', key: 'comunicaciones' },
                ],
            },
            opcionesAreas: {
                firstColumn: [
                    { label: 'Administración', key: 'administracion' },
                    { label: 'Auditoría', key: 'auditoria' },
                    { label: 'Bodega', key: 'bodega' },
                    { label: 'Compras', key: 'compras' },
                    { label: 'Contabilidad', key: 'contabilidad' },
                    { label: 'Costos', key: 'costos' },
                    { label: 'Crédito y Cobranza', key: 'credito' },
                    { label: 'Diseño', key: 'diseño' },
                    { label: 'Finanzas', key: 'finanzas' },
                    { label: 'Gerencia General', key: 'gerencia' },
                    { label: 'Impuestos', key: 'impuestos' },
                    { label: 'Mercadeo', key: 'mercadeo' },
                    { label: 'Producción', key: 'produccion' },
                    { label: 'Publicidad', key: 'publicidad' },
                ],
                secondColumn: [
                    { label: 'Personal', key: 'personal' },
                    { label: 'Sistemas', key: 'sistemas' },
                    { label: 'Tesorería', key: 'tesoreria' }
                ],
            },
            submited: false,
            isUpdating: false,
            spiner: false,
        }
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
                console.log(this.formData);
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
            console.log(this.trayectoria_empresas, this.hasHv)
            if (this.trayectoria_empresas && Object.keys(this.trayectoria_empresas).length > 0 || this.hasHv) {
                this.isUpdating = true;
                Object.assign(this.formData, this.trayectoria_empresas);
            }
        },
        validarDatos() {
            this.submited = true;
            this.$v.$touch();

            if (this.$v.$invalid) {
                this.$toaster.error("Hay errores en el formulario. Por favor, corrígelos.");
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