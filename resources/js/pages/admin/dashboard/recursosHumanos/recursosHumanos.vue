<template>
    <div v-if="show">
        <div class="flex flex-wrap items-center">
            <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><i class="fas fa-users"></i> Usuarios</h1>
        </div>

        <div class="rounded-t mb-0 mt-5 px-4 py-3 border-0 bg-blue-500">
            <div class="flex flex-wrap items-center">
                <div class="relative w-full px-4 max-w-full flex-grow flex-1">
                    <h3 class="font-semibold text-lg text-white">
                        Usuarios registrados en el sistema
                    </h3>
                </div>
            </div>
        </div>
        <div class="block w-full overflow-x-auto mb-12">
            <!-- Projects table -->
            <table class="items-center w-full bg-gray-100 border-collapse">
                <thead>
                    <tr class="bg-gray-100 text-left">
                        <th
                            class="w-10 px-6 text-blue-400 border-blue-700 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                            #
                        </th>
                        <th
                            class="px-6 text-blue-500 border-blue-500 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                            Nombre
                        </th>
                        <th
                            class="px-6 text-blue-500 border-blue-500 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                            Correo electrónico
                        </th>
                        <th
                            class="px-6 text-blue-500 border-blue-500 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                            Rol
                        </th>
                        <th
                            class="px-6 text-blue-500 border-blue-500 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold ">
                            Estado
                        </th>
                        <th
                            class="px-6 text-blue-500 border-blue-500 border border-solid py-3 text-sm border-l-0 border-r-0 whitespace-nowrap font-semibold text-center">
                            Acciones
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(user, index) in users" :key="user.id">
                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            {{ index + 1 }}
                        </td>
                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle uppercase border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            {{ user.name }}
                        </td>
                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            {{ user.email }}
                        </td>
                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            {{ user.rol }}
                        </td>
                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            <i class="fas fa-circle text-green-500 mr-2"></i> Activo
                        </td>

                        <td
                            class="text-gray-700 border-t-0 px-6 align-middle border-l-0 border-r-0 text-sm whitespace-nowrap p-4">
                            <div class="flex flex-wrap justify-center">
                                <router-link :to="{ name: 'HojaDeVida', params: { id: user.id } }"
                                    title="Editar hoja de vida">
                                    <div
                                        class="text-center mr-2 inline-flex items-center justify-center w-10 h-10 shadow-lg rounded-full bg-blue-500 hover:bg-blue-600 ease-linear transition-all duration-150">
                                        <i class="fas fa-pen font-bold text-white"></i>
                                    </div>
                                </router-link>

                                <div @click="openModal(user)" title="Limpiar hoja de vida"
                                    class="text-center inline-flex cursor-pointer items-center justify-center w-10 h-10 shadow-lg rounded-full bg-red-500 hover:bg-red-600 ease-linear transition-all duration-150">
                                    <i class="fas fa-trash font-bold text-white"></i>
                                </div>

                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <Modal :modal="modal" @closeModal="closeModal" @closeModalSuccess="closeModalSuccess" :datos="datos" />
    </div>
</template>

<script>
import Modal from '../components/ModalDelete.vue';
export default {
    data() {
        return {
            users: [],
            modal: false,
            datos: {},
            show: false,
        }
    },

    mounted() {
        const rol = localStorage.getItem('rol');
        if (rol !== 'ADMINISTRADOR') {
            this.$router.push('/dashboard');
        }
        this.getUsers();
        this.show = true;
    },

    methods: {
        async getUsers() {
            try {
                const responseUsers = await axios.get('/api/getUsers');
                this.users = responseUsers.data;
            } catch (errors) {
                console.log(errors.response.data.errors)
            }
        },
        openModal(user) {
            this.datos = {
                id: user.id,
                requestType: 'delete',
                url: `/api/deleteHv/${user.id}`,
                title: 'Eliminar Hoja de vida',
                message: '¿Está seguro de limpiar la hoja de vida de ' + user.name + '?'
            }
            this.modal = true;
        },

        closeModal(value) {
            this.modal = value
        },
        closeModalSuccess(value) {
            this.getUsers();
            this.modal = value;
            this.$toaster.success('Se limpió correctamente la hoja de vida seleccionada');
        }
    },
    components: { Modal }
}
</script>