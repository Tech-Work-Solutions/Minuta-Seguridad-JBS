<template>
  
  <div class="p-6 bg-gray-100">
    <div class="flex flex-wrap items-center">
      <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold">
        <em class="fas fa-calendar-check"></em> Gestión de Turnos
      </h1>
    </div>
    <form v-if="verFiltros">
      <div class="flex flex-wrap mx-2 mt-10 items-center w-full">
        <div class="w-full lg:w-3/12 px-4 mb-3">
          <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="userSelect">
            Buscar por usuario:
          </label>
          <t-rich-select
            v-model="formData.user_id"
            :options="usersFiltros"
            placeholder="Seleccione una opción"
            class="w-full"
          ></t-rich-select>
        </div>

        <div class="w-full lg:w-3/12 px-4 mb-3">
          <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="startDate">
            Desde:
          </label>
          <input
            type="date"
            v-model="formData.fecha_inicial"
            class="w-full px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline"
          />
          <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fecha_inicial.required">
            Ingrese una fecha inicial
          </p>
        </div>

        <div class="w-full lg:w-3/12 px-4 mb-3">
          <label class="block text-gray-600 text-sm font-semibold mb-2" htmlFor="endDate">
            Hasta:
          </label>
          <input
            type="date"
            v-model="formData.fecha_final"
            class="w-full px-3 py-3 placeholder-gray-300 uppercase text-gray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:shadow-outline"
          />
          <p class="text-red-500 text-sm" v-if="submited && !$v.formData.fecha_final.required">
            Ingrese una fecha final
          </p>
        </div>

        <div class="w-full lg:w-3/12 px-4">
          <button
            class="w-full bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none ease-linear transition-all duration-150"
            type="button"
            @click="validarDatos"
          >
            <p v-if="!spiner"><em class="fas fa-search"></em> Buscar</p>
            <p v-else><em class="fas fa-spinner fa-pulse"></em> Buscando...</p>
          </button>
        </div>
      </div>
    </form>

    <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
      <v-app>
        <v-row class="fill-height">
          <v-col>
            <v-sheet height="64">
              <v-toolbar flat>
                <div class="flex overflow-x-auto space-x-2">
                  <v-btn outlined class="mr-4" color="grey darken-2" @click="openDialog" v-if="verTodo">
                    Agregar Turno
                  </v-btn>
                  <v-btn outlined class="mr-4" color="grey darken-2" @click="setToday">
                    Hoy
                  </v-btn>
                  <v-btn fab text small color="grey darken-2" @click="prev">
                    <v-icon small>mdi-chevron-left</v-icon>
                  </v-btn>
                  <v-btn fab text small color="grey darken-2" @click="next">
                    <v-icon small>mdi-chevron-right</v-icon>
                  </v-btn>
                  <v-toolbar-title v-if="$refs.calendar">{{ $refs.calendar.title }}</v-toolbar-title>
                  <v-spacer></v-spacer>
                  <v-menu bottom right>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn outlined color="grey darken-2" v-bind="attrs" v-on="on">
                        <span>{{ typeToLabel[type] }}</span>
                        <v-icon right>mdi-menu-down</v-icon>
                      </v-btn>
                    </template>
                    <v-list>
                      <v-list-item @click="type = 'day'">
                        <v-list-item-title>Día</v-list-item-title>
                      </v-list-item>
                      <v-list-item @click="type = 'week'">
                        <v-list-item-title>Semana</v-list-item-title>
                      </v-list-item>
                      <v-list-item @click="type = 'month'">
                        <v-list-item-title>Mes</v-list-item-title>
                      </v-list-item>
                      <v-list-item @click="type = '4day'">
                        <v-list-item-title>4 Días</v-list-item-title>
                      </v-list-item>
                    </v-list>
                  </v-menu>
                </div>
              </v-toolbar>
            </v-sheet>

            <v-sheet height="800">
              <v-calendar
                ref="calendar"
                v-model="focus"
                color="primary"
                :events="events"
                :event-color="getEventColor"
                :type="type"
                @click:event="showEvent"
                @click:more="viewDay"
                @click:date="viewDay"
              ></v-calendar>

              <v-dialog v-model="dialog" max-width="500px" @click:outside="resetForm">
                <v-card>
                  <v-card-title>
                    <span class="headline">{{ isEditing ? 'Editar turno' : 'Asignación de turno' }}</span>
                  </v-card-title>
                  <v-card-text>
                    <v-text-field
                      v-model="newEvent.name"
                      label="Nombre del turno"
                      :error-messages="!$v.newEvent.name.$pending && !$v.newEvent.name.$model && $v.newEvent.name.$dirty ? ['El nombre es obligatorio'] : []"
                    >    
                    </v-text-field>
                    <v-select
                      v-model="newEvent.user_id"
                      :items="users"
                      item-value="id"
                      item-text="name"
                      label="Seleccionar usuario"
                      @change="handleUserSelection"
                      :error-messages="!$v.newEvent.user_id.$pending && !$v.newEvent.user_id.$model && $v.newEvent.user_id.$dirty ? ['Seleccione el usuario'] : []"
                    ></v-select>

                    <v-select
                      v-model="newEvent.sede_id"
                      :items="sedesByUser"
                      item-value="id"
                      item-text="name"
                      label="Seleccionar sede"
                      :disabled="!newEvent.user_id"
                      :error-messages="!$v.newEvent.sede_id.$pending && !$v.newEvent.sede_id.$model && $v.newEvent.sede_id.$dirty && newEvent.user_id? ['Seleccione la sede'] : []"                    
                    ></v-select>

                    <v-menu v-model="dateMenu" :close-on-content-click="false" transition="slide-x-reverse-transition" min-width="auto">
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-bind="attrs"
                          v-on="on"
                          label="Fecha de inicio"
                          :value="newEvent.startDate ? newEvent.startDate.toLocaleString() : ''"
                          readonly
                          :error-messages="!$v.newEvent.startDate.$pending && !$v.newEvent.startDate.$model && $v.newEvent.startDate.$dirty ? ['La fecha de inicio es obligatoria'] : []"
                        ></v-text-field>
                      </template>

                      <v-date-picker v-model="newEvent.startDate" @input="setDate" :min="today" />
                    </v-menu>

                    <v-menu v-model="dateMenuEnd" :close-on-content-click="false" transition="slide-x-reverse-transition" min-width="auto">
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-bind="attrs"
                          v-on="on"
                          label="Fecha de fin"
                          :value="newEvent.endDate ? newEvent.endDate.toLocaleString() : ''"
                          readonly
                          :error-messages="!$v.newEvent.endDate.$pending && !$v.newEvent.endDate.$model && $v.newEvent.endDate.$dirty ? ['La fecha de fin es obligatoria'] : []"
                        ></v-text-field>
                      </template>

                      <v-date-picker v-model="newEvent.endDate" @input="setEndDate" :min="today" />
                    </v-menu>

                    <v-menu v-model="timeMenuStart" :close-on-content-click="false" transition="slide-x-reverse-transition" min-width="auto">
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-bind="attrs"
                          v-on="on"
                          label="Hora de inicio"
                          :value="newEvent.startTime ? newEvent.startTime.toLocaleString() : ''"
                          readonly
                          :error-messages="!$v.newEvent.startTime.$pending && !$v.newEvent.startTime.$model && $v.newEvent.startTime.$dirty ? ['La hora de inicio es obligatoria'] : []"
                        ></v-text-field>
                      </template>

                      <v-time-picker v-model="newEvent.startTime" format="24hr" />
                    </v-menu>

                    <v-menu v-model="timeMenuEnd" :close-on-content-click="false" transition="slide-x-reverse-transition" min-width="auto">
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-bind="attrs"
                          v-on="on"
                          label="Hora de fin"
                          :value="newEvent.endTime ? newEvent.endTime.toLocaleString() : ''"
                          readonly
                          :error-messages="!$v.newEvent.endTime.$pending && !$v.newEvent.endTime.$model && $v.newEvent.endTime.$dirty ? ['La hora de fin es obligatoria'] : []"
                        ></v-text-field>
                      </template>

                      <v-time-picker v-model="newEvent.endTime" format="24hr" />
                    </v-menu>
                  </v-card-text>

                  <v-card-actions>
                    <v-btn text @click="resetForm">Cancelar</v-btn>
                    <v-btn color="primary" @click="submitForm">
                      {{ isEditing ? 'Actualizar' : 'Agregar' }}
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <v-menu
                v-model="selectedOpen"
                :close-on-content-click="false"
                :activator="selectedElement"
                offset-y
                max-width="-webkit-fill-available"
                left
              >
                <v-card color="grey lighten-4" min-width="300px" flat max-width="-webkit-fill-available">
                  <v-toolbar 
                  :color="selectedEvent.color" 
                  dark
                  >
                    <v-btn icon @click="editEvent" v-if="verTodo">
                      <v-icon>mdi-pencil</v-icon>
                    </v-btn>
                    <v-toolbar-title v-html="selectedEvent.name"></v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn icon @click="deleteEvent" v-if="verTodo">
                      <v-icon>mdi-delete</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-text>
                    <div v-html="`Persona asignada: ${getUserName(selectedEvent.user_id)}`"></div>
                    <div v-html="`Sede: ${getNameSede(selectedEvent.sede_id)}`"></div>
                  </v-card-text>
                  <v-card-actions>
                    <v-btn text color="secondary" @click="selectedOpen = false">
                      Cerrar
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-menu>
            </v-sheet>
          </v-col>
        </v-row>
      </v-app>
      <div class="flex mb-2 mt-1" v-if="verTodo">
          <button
              class="bg-blue-500 text-white hover:bg-blue-700 font-bold text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
              type="submit">
              <p v-if="!spiner">Confirmar información</p>
              <p v-else="spiner"><em class="fas fa-spinner fa-pulse"></em> Guardando...</p>
          </button>
      </div>
    </form>
    <Modal :modal="modal" @closeModal="closeModal" @closeModalSuccess="closeModalSuccess" :datos="datos" />
  </div>
</template>
  
<script>
  import '@mdi/font/css/materialdesignicons.css';
  import { required } from 'vuelidate/lib/validators';
  import { TRichSelect } from 'vue-tailwind/dist/components';
  import Modal from '../components/ModalDelete.vue';

  export default {
    data() {
      return {
        isEditing: false,
        type: 'month',
        focus: '',
        selectedEvent: {},
        selectedElement: null,
        selectedOpen: false,
        events: [],
        newEvent: {
          name: '',
          startDate: null,
          endDate: null,
          startTime: null,
          endTime: null,
          color: '',
          user_id: null,
          sede_id: null,
          descripcion: '',
        },
        formData: {
          user_id: 'TODOS',
          fecha_inicial: '',
          fecha_final: ''
        },
        dialog: false, 
        dateMenu: false, 
        dateMenuEnd: false,
        timeMenuStart: false, 
        timeMenuEnd: false,
        typeToLabel: {
          month: 'Mes',
          week: 'Semana',
          day: 'Día',
          '4day': '4 Dias',
        },
        userId: null,
        isUpdating: false,
        spiner: false,
        users: [],
        usersFiltros: [],
        sedesByUser: [],
        newEvents: [],
        updatedEvents: [],
        deletedEvents: [],
        originalEvents: [],
        dataLoaded: false,
        today: new Date().toISOString().substr(0, 10),
        colorMenu: false,
        submited: false,
        verTodo: true,
        verFiltros: true,
        sedes: [],
        modal: false,
        datos: {},
      };
    },
    async mounted() {
        this.spiner = false;
        const rol = localStorage.getItem('rol');
        this.sede = JSON.parse(localStorage.getItem('sede'));
        if (rol === 'GUARDA DE SEGURIDAD' || rol === 'ADMINISTRATIVO') {
            this.verTodo = false;
        }
        const userObject = localStorage.getItem("user");
        if (userObject) {
            const user = JSON.parse(userObject);
            this.userId = user.id;
        }
        if(rol === 'GUARDA DE SEGURIDAD') {
          this.verFiltros= false;
          await this.loadData(this.userId);
        }else {
          await this.loadData();
          await this.getUsers();
          await this.getSedes();
        }        
    },
    methods: {
      submitForm() {
        this.$v.$touch();
        if (this.$v.newEvent.$invalid) {
          this.$toaster.error('Hay errores en el formulario. Por favor, corrígelos.');
          return;
        }
        if (this.isEditing) {
          this.updateEvent();
        } else {
          this.addEvent();
        }
      },

      async handleSubmit() {
        try {
          if (!this.dataLoaded) {
            this.newEvents = [...this.events];
            this.updatedEvents = [];
            this.deletedEvents = [];
          }
          this.spiner = true;
          const eventosAInsertar = this.newEvents.map(evento => ({
            user_id: evento.user_id,
            sede_id: evento.sede_id,
            hora_inicio: evento.start.split(" ")[1],
            hora_fin: evento.end.split(" ")[1],
            fecha_inicio: evento.start.split(" ")[0],
            fecha_fin: evento.end.split(" ")[0],
            estado: 'APROBADO',
            tipo: 'TURNO',
            color: evento.color,
            titulo: evento.name,
            descripcion: evento.descripcion
          }));

          const eventosAActualizar = this.updatedEvents.map(evento => ({
            id: evento.id,
            user_id: evento.user_id,
            sede_id: evento.sede_id,
            hora_inicio: evento.start.split(" ")[1],
            hora_fin: evento.end.split(" ")[1],
            fecha_inicio: evento.start.split(" ")[0],
            fecha_fin: evento.end.split(" ")[0],
            estado: 'APROBADO',
            tipo: 'TURNO',
            color: evento.color,
            descripcion: evento.descripcion,
            titulo: evento.name,
          }));
          const eventosAEliminar = this.deletedEvents.map(evento => evento.id);
          if (eventosAInsertar.length > 0) {
            const responseInsert = await axios.post('/api/registerCalendario', {
              calendarios: eventosAInsertar,
            });
            this.spiner = false;
            if (responseInsert.data.errores.length > 0) {
              console.warn('Errores al insertar:', responseInsert.data.errores);
            }
          }

          if (eventosAActualizar.length > 0) {
            const responseUpdate = await axios.post('/api/updateCalendario', {
              calendarios: eventosAActualizar,
            });
            this.spiner = false;
            if (responseUpdate.data.errores.length > 0) {
              console.warn('Errores al actualizar:', responseUpdate.data.errores);
            }
          }

          if (eventosAEliminar.length > 0) {
            const responseDelete = await axios.delete('/api/deleteCalendario', {
              data: {
                  calendarioIds: eventosAEliminar,
              },
            });
            this.spiner = false;
            if (responseDelete.data.no_encontrados.length > 0) {
              console.warn('Errores al eliminar:', responseDelete.data.no_encontrados);
            }
          }
          this.newEvents = [];
          this.updatedEvents = [];
          this.deletedEvents = [];
          this.dataLoaded = true;

          if (
            eventosAInsertar.length === 0 &&
            eventosAActualizar.length === 0 &&
            eventosAEliminar.length === 0
          ) {
            this.$toaster.error('No hay cambios para guardar');
            this.spiner = false;
            return;
          }
          this.$toaster.success('Datos guardados correctamente');

        } catch (error) {
          this.spiner = false;
          console.error('Ocurrio un error al guardar los datos:', error.response?.data || error.message);
          this.$toaster.error('Ocurrio un error al guardar los datos.');
          
        }
      },

      async validarDatos() {
        this.submited = true;
        if (this.$v.formData.$invalid) {
          this.$toaster.error("Hay errores en los filtros. Por favor, corrígelos.");
          return false;
        }
        await this.loadData(this.formData.user_id, this.formData.fecha_inicial, this.formData.fecha_final);
      },

      async getUsers() {
          try {
              const url = `/api/getUsers${this.sede.nombre.toUpperCase() !== 'SEDE MASTER' && this.sede.nombre.toUpperCase() !== 'SEDE TALENTO HUMANO' ? `?sede_id=${this.sede.id}` : ''}`;
              const responseUsers = await axios.get(url);
              this.users = responseUsers.data;
              this.usersFiltros = [...responseUsers.data];
              this.usersFiltros.forEach(item => item.text = item.name.toUpperCase());
              this.usersFiltros.unshift({ id: 'TODOS', text: 'TODOS' });
          } catch (errors) {
              console.log(errors.response.data.errors)
          }
      },
      async getSedesByUser(userId) {        
          try {
              const response = await axios.get('/api/getSedesAndClientesByUser', {
                  params: {
                      user_id: userId,
                  },
              });
              this.sedesByUser =  response.data.sedes;
              this.sedesByUser = response.data.sedes.map(sede => ({
                id: sede.sede_id,
                name: sede.sede_nombre,
              }));
          } catch (error) {
              console.error('Error al obtener sedes:', error.response?.data?.errors || error.message);
              this.$toaster.error('Hubo un error al obtener sedes.');
          }
      },

      async handleUserSelection(userId) {
        await this.getSedesByUser(userId);
      },

      getUserName(userId) {
          const user = this.users.find(user => user.id === userId);
          return user ? user.name : 'Desconocido';
      },

      getNameSede(sedeId) {
        const sede = this.sedes.find(sede => {
          return sede.id === sedeId
        })
          return sede ? sede.nombre : 'Desconocido';
      },

      async getSedes(id= null) { 
        try {
          const response = await axios.get('/api/getSedes', {
              params: id ? { id } : {},
          });

          this.sedes = response.data.sedes.filter((item) => item.estado === 'ACTIVO');
        } catch (error) {
            console.error('Error al obtener la sede:', error);
        }
      },

      viewDay({ date }) {
        const selectedDate = new Date(date + 'T00:00:00');
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        selectedDate.setHours(0, 0, 0, 0);
        if (selectedDate < today) {
          return;
        }
        this.focus = date;
        this.type = 'day';
        this.newEvent.startDate = date;
        this.newEvent.endDate = date;
      },
  
      setDate() {
        this.dateMenu = false; 
      },
  
      setEndDate() {
        this.dateMenuEnd = false;
      },
  
      addEvent() {
        const start = this.formatDateTime(this.newEvent.startDate, this.newEvent.startTime);
        const end = this.formatDateTime(this.newEvent.endDate, this.newEvent.endTime);
        if (new Date(start) >= new Date(end)) {
          this.$toaster.error('La fecha de inicio debe ser mayor a la fecha de fin.');
          return;
        }

        const newEvent = {
          name: this.newEvent.name,
          descripcion: this.newEvent.descripcion,
          start,
          end,
          color: this.getRandomColor(),
          user_id: this.newEvent.user_id,
          sede_id: this.newEvent.sede_id,
        };
        this.events.push(newEvent);
        this.newEvents.push(newEvent);
        this.resetForm();
      },

      getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
      },

      resetForm() {
        this.dialog = false;
        this.isEditing = false;
        this.$v.$reset();
        this.newEvent = { name: '', descripcion: '', startDate: null, endDate: null, startTime: null, endTime: null, color: '', user_id: null, sede_id: null };
      },

      deleteEvent() {        
        const event = this.events.find(event => event.id === this.selectedEvent.id);        
        this.openModal(event);       
      },
      closeModal(value) {
          this.modal = value
      },
      closeModalSuccess(value) {
        const index = this.events.findIndex(event => event.id === this.selectedEvent.id);
        if (index !== -1) {
            const [deletedEvent] = this.events.splice(index, 1);
            
            if (this.originalEvents.find(event => event.id === deletedEvent.id)) {
                this.deletedEvents.push(deletedEvent);
            }
            this.selectedOpen = false;
        }
        this.modal = value;
        this.$toaster.success('Se elimino correctamente el turno seleccionado');
      },
      openModal(user) {
          this.datos = {
              requestType: 'info',              
              title: 'Eliminar turno',
              message: '¿Está seguro de elminar el turno: ' + user.name + '?'
          }
          this.modal = true;
      },

      async editEvent() {
        this.newEvent = {
          ...this.selectedEvent,
          startDate: this.formatDateWithoutTime(this.selectedEvent.start),
          endDate: this.formatDateWithoutTime(this.selectedEvent.end),
          startTime: new Date(this.selectedEvent.start).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false }),
          endTime: new Date(this.selectedEvent.end).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false }),
        };
        await this.handleUserSelection(this.newEvent.user_id);
        this.isEditing = true;
        this.dialog = true; 
      },

      updateEvent() {        
        const index = this.events.findIndex(event => event.start === this.selectedEvent.start);
        const start = this.formatDateTime(this.newEvent.startDate, this.newEvent.startTime);
        const end = this.formatDateTime(this.newEvent.endDate, this.newEvent.endTime);
        if (new Date(start) >= new Date(end)) {
          this.$toaster.error('La fecha de inicio debe ser mayor a la fecha de fin.');
          return;
        }
        if (index !== -1) {
          const updatedEvent = {
            ...this.events[index],
            name: this.newEvent.name,
            descripcion: this.newEvent.descripcion,
            start,
            end,
            color: this.getRandomColor(),
          };

          this.events.splice(index, 1, updatedEvent);

          if (!this.newEvents.includes(updatedEvent) && !this.updatedEvents.includes(updatedEvent)) {
            this.updatedEvents.push(updatedEvent);
          }
        }
        this.resetForm();
      },
      async loadData(user_id = null, fecha_inicio = null, fecha_fin = null) {
        try {
          this.spiner = true;
          let url = `/api/getCalendarios`;
          let params = {};

          if (user_id && user_id !== "TODOS") params.user_id = user_id;
          if (fecha_inicio) params.fecha_inicio = fecha_inicio;
          if (fecha_fin) params.fecha_fin = fecha_fin;
          if(this.sede.nombre.toUpperCase() !== 'SEDE MASTER' && this.sede.nombre.toUpperCase() !== 'SEDE TALENTO HUMANO') params.sede_id = this.sede.id; 

          const response = await axios.get(url, { params });
          const turnos = response.data.filter((item) => item.tipo === 'TURNO');

          if (turnos.length > 0) {
            this.events = turnos.map(turno => ({
              name: turno.titulo,
              descripcion: turno.descripcion,
              start: `${turno.fecha_inicio}T${turno.hora_inicio}`,
              end: `${turno.fecha_fin}T${turno.hora_fin}`,
              color: turno.color,
              user_id: turno.user_id,
              sede_id: turno.sede_id,
              id: turno.id
            }));
            this.originalEvents = JSON.parse(JSON.stringify(this.events));
            this.dataLoaded = true;
          } else {
            this.events = [];
            this.originalEvents = [];
            this.newEvents = [];
            this.updatedEvents = [];
            this.deletedEvents = [];
            this.dataLoaded = false;
          }
          this.spiner = false;
          this.resetForm();
        } catch (error) {
          this.spiner = false;
          console.error(error);
          console.error("Hubo un problema al cargar los datos.");
        }
      },

      formatDateTime (date, time) {
            return `${date} ${time}`;
      },
      openDialog() {
        this.newEvent = { name: '', descripcion: '', startDate: null, endDate: null, startTime: null, endTime: null, color: '',user_id: null, sede_id: null  };
        this.dialog = true;
        this.isEditing = false;
      },
  
      getEventColor(event) {
        return event.color;
      },
  
      setToday() {
        this.focus = '';
      },

      prev() {
        this.$refs.calendar.prev();
      },
  
      next() {
        this.$refs.calendar.next();
      },
  
      showEvent({ nativeEvent, event }) {
        const open = () => {
          this.selectedEvent = event
          this.selectedElement = nativeEvent.target
          requestAnimationFrame(() => requestAnimationFrame(() => this.selectedOpen = true))
        }

        if (this.selectedOpen) {
          this.selectedOpen = false
          requestAnimationFrame(() => requestAnimationFrame(() => open()))
        } else {
          open() 
        }

        nativeEvent.stopPropagation()
      },      

      formatDateWithoutTime(date) {
        const d = new Date(date);
        return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
      },      
    },
    validations() {
      return {
        newEvent: {
          name: { required },
          startDate: { required },
          endDate: {
            required,            
          },
          startTime: { required },
          endTime: { required },
          user_id: { required },
          sede_id: { required },
        },
        formData: {
          fecha_inicial: { required },
          fecha_final: { required },
        }
      };
    },
    components: { TRichSelect, Modal }
  };
</script>
  
<style scoped>
.fill-height {
  min-height: 100vh;
}
</style>
  