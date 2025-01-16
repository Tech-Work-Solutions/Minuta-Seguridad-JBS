<template>
    <div class="p-8 bg-gray-100">
      <form @submit.prevent="handleSubmit" class="bg-white rounded-lg shadow p-6">
        <div class="overflow-x-auto mt-4">
          <table class="table-auto w-full text-sm border-collapse border border-gray-300">
            <thead>
              <tr>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Estudios</label>
                </th>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Título</label>
                </th>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Año Finalización</label>
                </th>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Años Cursados</label>
                </th>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Nombre Institución</label>
                </th>
                <th class="border border-gray-300 p-2">
                  <label class="block text-sm font-medium text-gray-600">Ciudad</label>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="nivel in nivelesEstudio" :key="nivel.id">
                <td class="border border-gray-300 p-2" style="width: 150px;">
                  <label class="block text-sm font-medium text-gray-600">{{nivel.name}}</label>
                  <select v-model="formData[nivel.key]" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" v-if="nivel.elemento && nivel.elemento==='select'">
                    <option value="">Seleccione...</option>
                    <option v-for="value in nivel.values" :key="value" :value="value">
                      {{ value }}
                    </option>
                  </select>
                </td>
                <td class="border border-gray-300 p-2">
                  <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" />
                </td>
                <td class="border border-gray-300 p-2">
                  <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" />
                </td>
                <td class="border border-gray-300 p-2">
                  <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" />
                </td>
                <td class="border border-gray-300 p-2">
                  <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" />
                </td>
                <td class="border border-gray-300 p-2">
                  <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" />
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="p-4 border-t border-gray-300">
          <label class="block text-sm font-medium text-gray-600">Otros: cursos, diplomados, seminarios</label>
          <div class="grid grid-cols-1 sm:grid-cols-5 gap-4 mt-2">
            <div class="col-span-1">
              <label class="block text-sm font-medium text-gray-600">Intensidad horaria</label>
              <input
                type="number"
                placeholder="Horas"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
            <div class="col-span-3">
              <label class="block text-sm font-medium text-gray-600">Nombre del programa</label>
              <input
                type="text"
                placeholder="Nombre del programa"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
            <div class="col-span-1">
              <label class="block text-sm font-medium text-gray-600">Institución</label>
              <input
                type="text"
                placeholder="Nombre"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
          </div>
        </div>

        <div class="p-4 border-t border-gray-300">
          <div class="grid grid-cols-1 sm:grid-cols-9 gap-4 mt-2">
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">¿Cursa estudios <span class="hidden sm:inline"> <br> </span> actualmente? </label>
              <div class="flex items-center space-x-4">
                <label>
                  <input
                    v-model="formData.cursaEstudios"
                    type="radio"
                    value="Si"
                    class="form-radio text-blue-600"
                  />
                  Si
                </label>
                <label>
                  <input
                    v-model="formData.cursaEstudios"
                    type="radio"
                    value="No"
                    class="form-radio text-blue-600"
                  />
                  No
                </label>
              </div>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipoCedula.required">
                Elija una opción.
              </p>
            </div>
            <div class="col-span-1 sm:col-span-3">
              <label class="block text-sm font-medium text-gray-600">¿Qué tipo de<br class="hidden sm:inline"> estudios? </label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">Duración (años, semestres, meses)</label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">Año / semestre que<br class="hidden sm:inline"> cursa</label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mt-2">
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">¿Qué tipo de estudios? </label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
              />
            </div>
            <div class="col-span-1 sm:col-span-1">
              <label class="block text-sm font-medium text-gray-600">Horario</label>
              <select v-model="formData.estadoCivil" class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none">
                <option value="">Seleccione...</option>
                <option value="soltero">Diurno</option>
                <option value="casado">Nocturno</option>
                <option value="divorciado">Fin de semana</option>
                <option value="viudo">A distancia</option>
              </select>
            </div>
          </div>
        </div>

  
        <div class="p-4 border-t border-gray-300">
          <label class="block text-sm font-medium text-gray-600">OTROS CONOCIMIENTOS: Indique el grado de dominio R - Regular, B - Bien, MB - Muy Bien</label>
          <div class="overflow-x-auto mt-4">
            <table class="table-auto w-full text-sm border-collapse border border-gray-300">
              <tbody>
                <tr>
                  <td rowspan="2" class="border border-gray-300 p-2">
                    <label class="block text-sm font-medium text-gray-600">Sistemas</label>
                    <div class="flex space-x-2">
                      <label>
                        <input type="radio" name="sistemas" value="si" class="mr-2" /> Sí
                      </label>
                      <label class="ml-4">
                        <input type="radio" name="sistemas" value="no" class="mr-2" /> No
                      </label>
                    </div>
                    <label class="block text-sm font-medium text-gray-600">¿Programa(s) que maneja?</label>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" placeholder="Programa 1" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="nivel1" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="nivel1" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="nivel1" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" placeholder="Programa 3" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="nivel3" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="nivel3" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="nivel3" value="MB" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" placeholder="Programa 2" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="nivel2" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="nivel2" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="nivel2" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input type="text" class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" placeholder="Programa 4" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="nivel4" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="nivel4" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="nivel4" value="MB" />
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="p-4 ">
          <div class="overflow-x-auto mt-4">
            <table class="table-auto w-full text-sm border-collapse border-gray-300">
              <tbody>                
                <tr>                 
                  <td rowspan="2" class="border border-gray-300 p-2 ">
                    <label class="block text-sm font-medium text-gray-600">Idiomas</label>
                    <div class="flex space-x-2">
                      <label>
                        <input
                          type="radio"
                          name="idiomas"
                          value="si"
                          class="mr-2"
                        />
                        Sí
                      </label>
                      <label class="ml-4">
                        <input
                          type="radio"
                          name="idiomas"
                          value="no"
                          class="mr-2"
                        />
                        No
                      </label>
                    </div>
                    <label class="block text-sm font-medium text-gray-600">¿Qué idioma(s) conoce?</label>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input
                        type="text"
                        class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none"
                        placeholder="Idioma 1"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Lectura</label>
                    <div class="flex space-x-2 text-center">
                      <label class="mr-2">R</label>
                      <input type="radio" name="lectura1" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="lectura1" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="lectura1" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Escritura</label>
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="escritura1" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="escritura1" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="escritura1" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Hablado</label>
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="hablado1" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="hablado1" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="hablado1" value="MB" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input
                        type="text"
                        class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none"
                        placeholder="Idioma 2"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="lectura2" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="lectura2" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="lectura2" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="escritura2" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="escritura2" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="escritura2" value="MB" />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" name="hablado2" value="R" class="mr-2" />
                      <label class="mr-2">B</label>
                      <input type="radio" name="hablado2" value="B" class="mr-2" />
                      <label class="mr-2">MB</label>
                      <input type="radio" name="hablado2" value="MB" />
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="text-center">
          <div class="p-4 text-sm text-gray-700 ">
            Nota: En caso de ser contratado(a) favor preparar toda la
            documentación.
          </div>
        </div>
      </form>
    </div>
  </template>
  

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';

export default {
    data() {
        return {
            formData: {
                primaria: "",
                bachillerato: "",
                educacionSuperior: "",
                postgrados: "",
            },
            nivelesEstudio: [
                { id: 1, name: "Primaria", key: "primaria"},
                { id: 2, name: "Bachillerato", elemento: "select", values: ["Clasico", "Técnico", "Comercial", "Otro"], key: "bachillerato" },
                { id: 3, name: "Educación Superior",  elemento: "select", values: ["Técnico", "Tecnológico", "profesional"], key: "educacionSuperior" },
                { id: 4, name: "Postgrados", key: "postgrados" },
            ],
            submited: false,
        };
    },

    async mounted() {
    },

    methods: {
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

<style scoped>
  @media (max-width: 768px) {
    .w-full {
      width: 100% !important;
    }

    .table-auto {
      table-layout: auto;
    }

    .table-auto input[type="text"] {
      width: 98px !important;
      padding: 0.75rem;
    }
  }
</style>