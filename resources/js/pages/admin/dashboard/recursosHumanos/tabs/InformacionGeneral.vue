<template>
    <div class="p-6 bg-gray-100">
        <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-600">Fecha:</label>
                    <div class="flex space-x-2">
                        <div class="w-1/3">
                            <input
                                v-model="formData.dia"
                                type="number"
                                placeholder="Día"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.dia.required">
                                Ingrese el día
                            </p>
                        </div>
                        <div class="w-1/3">
                            <input
                                v-model="formData.mes"
                                type="number"
                                placeholder="Mes"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.mes.required">
                                Ingrese el mes
                            </p>
                        </div>
                        <div class="w-1/3">
                            <input
                                v-model="formData.anio"
                                type="number"
                                placeholder="Año"
                                class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                            />
                            <p class="text-red-500 text-sm mt-1" v-if="submited && !$v.formData.anio.required">
                                Ingrese el año
                            </p>
                        </div>
                    </div>


                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Empleo o cargo:</label>
                    <input
                        v-model="formData.empleo"
                        type="text"
                        placeholder="Cargo interesado"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.empleo.required">
                        Ingrese el empleo o cargo
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Código cargo:</label>
                    <input
                        v-model="formData.codigoCargo"
                        type="text"
                        placeholder="Código"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.codigoCargo.required">
                        Ingrese el código del cargo
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Apellido(s):</label>
                    <input
                        v-model="formData.apellido"
                        type="text"
                        placeholder="Apellidos"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.apellido.required">
                        Ingrese su apellido
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nombre(s):</label>
                    <input
                        v-model="formData.nombre"
                        type="text"
                        placeholder="Nombres"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombre.required">
                        Ingrese su nombre
                    </p>
                </div>
                <div class="lg:row-span-3 flex justify-center items-center lg:col-start-3">
                    <div>
                        <label class="w-32 h-40 border rounded-lg bg-gray-100 flex flex-col justify-center items-center cursor-pointer relative">
                            <span v-if="!formData.fotoPreview" class="text-sm text-gray-500">Cargar Foto</span>
                            <img v-if="formData.fotoPreview" :src="formData.fotoPreview" class="absolute w-full h-full object-cover rounded-lg" />
                            <input type="file" accept="image/*" @change="handleFileUpload" class="hidden" />
                        </label>
                        <p class="text-red-500 text-sm" v-if="submited && !$v.formData.foto.required">
                            Carge una foto
                        </p>
                    </div>                 
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Dirección:</label>
                    <input
                        v-model="formData.direccion"
                        type="text"
                        placeholder="Dirección y barrio"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.direccion.required">
                        Ingrese la dirección
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Ciudad:</label>
                    <input
                        v-model="formData.ciudad"
                        type="text"
                        placeholder="Ciudad"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.ciudad.required">
                        Ingrese la ciudad
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Teléfono:</label>
                    <input
                        v-model="formData.telefono"
                        type="text"
                        placeholder="Teléfono"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.telefono.required">
                        Ingrese un número de teléfono
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Celular:</label>
                    <input
                        v-model="formData.celular"
                        type="number"
                        placeholder="Celular"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.celular.required">
                        Ingrese un número de celular
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Correo Electrónico:</label>
                    <input
                        v-model="formData.correo"
                        type="text"
                        placeholder="ejemplo@ejemplo.com"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.correo.required">
                        Ingrese su correo electrónico
                    </p>
                    <p class="text-red-500 text-sm" v-else-if="submited && !$v.formData.correo.email">
                        El correo electrónico no es válido.
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Profesión:</label>
                    <input
                        v-model="formData.profesion"
                        type="text"
                        placeholder="Profesión, ocupación u oficio"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.profesion.required">
                        Ingrese su profesión
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Nacionalidad:</label>
                    <input
                        v-model="formData.nacionalidad"
                        type="text"
                        placeholder="Nacionalidad"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nacionalidad.required">
                        Ingrese su nacionalidad
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Estado Civil:</label>
                    <select v-model="formData.estadoCivil" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                        <option value="">Seleccione...</option>
                        <option value="soltero">Soltero/a</option>
                        <option value="casado">Casado/a</option>
                        <option value="divorciado">Divorciado/a</option>
                        <option value="viudo">Viudo/a</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Años de experiencia laboral:</label>
                    <input
                        v-model="formData.experiencia"
                        type="number"
                        placeholder="Años de experiencia"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.experiencia.required">
                        Ingrese los años de experiencia laboral
                    </p>
                </div>
            </div>

            <h2 class="text-lg font-semibold text-gray-800 mt-8 mb-4">Documentación</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-600">Tipo de cédula:</label>
                    <div class="flex items-center space-x-4">
                        <label>
                            <input
                                v-model="formData.tipoCedula"
                                type="radio"
                                value="Ciudadanía"
                                class="form-radio text-blue-600"
                            />
                            Ciudadanía
                        </label>
                        <label>
                            <input
                                v-model="formData.tipoCedula"
                                type="radio"
                                value="Extranjera"
                                class="form-radio text-blue-600"
                            />
                            Extranjería
                        </label>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipoCedula.required">
                        Seleccione el tipo de documento
                    </p>                    
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Número de documento:</label>
                    <input
                        v-model="formData.cedula"
                        type="number"
                        placeholder="Número de cédula"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cedula.required">
                        Ingrese el número de su documento
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Expedida en:</label>
                    <input
                        v-model="formData.expedidaEn"
                        type="text"
                        placeholder="Lugar de expedición"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.expedidaEn.required">
                        Ingrese el lugar de expedición
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Libreta militar Nº:</label>
                    <input
                        v-model="formData.libreta"
                        type="number"
                        placeholder="Número"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Distrito Nº:</label>
                    <input
                        v-model="formData.distrito"
                        type="number"
                        placeholder="Distrito de libreta"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Clase de libreta:</label>
                    <div class="flex items-center space-x-4">
                        <label>
                            <input
                                v-model="formData.claseLibreta"
                                type="radio"
                                value="Primera"
                                class="form-radio text-blue-600"
                            />
                            Primera
                        </label>
                        <label>
                            <input
                                v-model="formData.claseLibreta"
                                type="radio"
                                value="Segunda"
                                class="form-radio text-blue-600"
                            />
                            Segunda
                        </label>
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">Tarjeta profesional:</label>
                    <input
                        v-model="formData.tarjetaProfesional"
                        type="text"
                        placeholder="Número de tarjeta"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tarjetaProfesional.required">
                        Ingrese el número de tarjeta profesional
                    </p>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-600">¿Tiene vehículo?:</label>
                    <div class="flex items-center space-x-4">
                        <label>
                            <input
                                v-model="formData.vehiculo"
                                type="radio"
                                value="Si"
                                class="form-radio text-blue-600"
                            />
                            Sí
                        </label>
                        <label>
                            <input
                                v-model="formData.vehiculo"
                                type="radio"
                                value="No"
                                class="form-radio text-blue-600"
                            />
                            No
                        </label>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.vehiculo.required">
                        Seleccione una opción
                    </p>
                </div>
                <div v-if="formData.vehiculo === 'Si'">
                    <label class="block text-sm font-medium text-gray-600">Licencia de conducción Nº:</label>
                    <input
                        v-model="formData.licencia"
                        type="number"
                        placeholder="Número de licencia"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.licencia.required">
                        Ingrese el número de licencia
                    </p>                 
                </div>

                <div v-if="formData.vehiculo === 'Si'">
                    <label class="block text-sm font-medium text-gray-600">Categoría de licencia:</label>
                    <input
                        v-model="formData.categoriaLicencia"
                        type="text"
                        placeholder="Categoría"
                        class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none"
                    />
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.categoriaLicencia.required">
                        Ingrese la categoría de la licencia
                    </p> 
                </div>
            </div>
            <div class="flex mb-4 mt-5">
                <button
                    class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                    type="submit"
                >
                    <p v-if="!spiner && !isUpdating">Guardar</p>
                    <p v-else-if="!spiner && isUpdating">Actualizar</p>
                    <p v-else-if="spiner && !isUpdating"><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
                    <p v-else><em class="fas fa-spinner fa-pulse"></em> Actualizando...</p>
                </button>
            </div>
        </form>
    </div>
</template>

<script>
import { email, required } from 'vuelidate/lib/validators';

export default {
    props: {
        informacion_general: {
            type: Object,
            default: () => ({}),
        },
        foto: {
            type: String,
            default: '',
        },
        user_id: {
            type: Number,
            default: 0,
        },
    },
    data() {
        return {
            formData: {
                dia: "",
                mes: "",
                anio: "",
                empleo: "",
                codigoCargo: "",
                nombre: "",
                apellido: "",
                direccion: "",
                ciudad: "",
                telefono: "",
                celular: "",
                correo: "",
                profesion: "",
                nacionalidad: "",
                estadoCivil: "",
                experiencia: "",
                cedula: "",
                libreta: "",
                vehiculo: "",
                licencia: "",
                categoriaLicencia: "",
                expedidaEn: "",
                tarjetaProfesional: "",
                expedida_en: "",
                distrito: "",
                claseLibreta: "",
                foto: null,
                fotoPreview: null,
            },
            submited: false,
            isUpdating: false,
            spiner: false,
        };
    },

    async mounted() {
        this.spiner = false;
        this.setFechaSistema();
        await this.loadData();
    },
    methods: {
        setFechaSistema() {
            const fecha = new Date();
            this.formData.dia = fecha.getDate();
            this.formData.mes = fecha.getMonth() + 1;
            this.formData.anio = fecha.getFullYear();
        },

        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                this.formData.foto = file;
                this.formData.fotoPreview = URL.createObjectURL(file);
            }
        },

        async handleSubmit() {
            try {
                if (!this.validarDatos()) {
                    return;
                }
                this.spiner = true;
                const formData = new FormData();

                formData.append("user_id", this.user_id);
                formData.append("informacion_general", JSON.stringify({
                    dia: this.formData.dia,
                    mes: this.formData.mes,
                    anio: this.formData.anio,
                    empleo: this.formData.empleo,
                    codigoCargo: this.formData.codigoCargo,
                    nombre: this.formData.nombre,
                    apellido: this.formData.apellido,
                    direccion: this.formData.direccion,
                    ciudad: this.formData.ciudad,
                    telefono: this.formData.telefono,
                    celular: this.formData.celular,
                    correo: this.formData.correo,
                    profesion: this.formData.profesion,
                    nacionalidad: this.formData.nacionalidad,
                    estadoCivil: this.formData.estadoCivil,
                    experiencia: this.formData.experiencia,
                    cedula: this.formData.cedula,
                    tipoCedula: this.formData.tipoCedula,
                    libreta: this.formData.libreta,
                    claseLibreta: this.formData.claseLibreta,
                    vehiculo: this.formData.vehiculo,
                    licencia: this.formData.licencia,
                    categoriaLicencia: this.formData.categoriaLicencia,
                    expedidaEn: this.formData.expedidaEn,
                    tarjetaProfesional: this.formData.tarjetaProfesional,
                    distrito: this.formData.distrito,
                }));

                if (this.formData.foto) {
                    formData.append("foto", this.formData.foto);
                }

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
            if (this.informacion_general && Object.keys(this.informacion_general).length > 0) {
                this.isUpdating = true;
                Object.assign(this.formData, this.informacion_general);
            }
            if (this.foto) {
                this.formData.foto = this.foto;
                this.formData.fotoPreview = this.foto;
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
        dia: { required },
        mes: { required },
        anio: { required },
        cedula: { required },
        tipoCedula: { required },
        correo: {required, email },
        empleo: { required },
        codigoCargo: { required },
        nombre: { required },
        apellido: { required },
        direccion: { required },
        ciudad: { required },
        telefono: {
            required: (value, formData) => !!value || !!formData.celular,
        },
        celular: {
            required: (value, formData) => !!value || !!formData.telefono,
        },
        profesion: { required },
        nacionalidad: { required },
        experiencia: { required },        
        tarjetaProfesional: { required },
        vehiculo: { required },
        licencia: {
            required: (value, formData) => formData.vehiculo === 'Si' ? !!value : true,
        },
        categoriaLicencia: {
            required: (value, formData) => formData.vehiculo === 'Si' ? !!value : true,
        },
        expedidaEn: { required },
        foto: { required },
    },
},

};
</script>