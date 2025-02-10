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
                  <label class="block text-sm font-medium text-gray-600">{{ nivel.name }}</label>
                  <select 
                    v-model="formData[`${nivel.key}Select`]" 
                    class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" 
                    v-if="nivel.elemento && nivel.elemento === 'select'">
                    <option value="">Seleccione...</option>
                    <option v-for="value in nivel.values" :key="value" :value="value">
                      {{ value }}
                    </option>
                  </select>
                </td>
                <td class="border border-gray-300 p-2">
                  <input 
                    v-model="formData[`${nivel.key}Titulo`]" 
                    type="text" 
                    :name="`${nivel.key}Titulo`"
                    class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                  />
                </td>
                <td class="border border-gray-300 p-2">
                  <input 
                    v-model="formData[`${nivel.key}AnoFinalizacion`]" 
                    type="number" 
                    :name="`${nivel.key}AnoFinalizacion`"
                    class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                  />
                </td>
                <td class="border border-gray-300 p-2">
                  <input 
                    v-model="formData[`${nivel.key}AnosCursados`]" 
                    type="number" 
                    :name="`${nivel.key}AnosCursados`"
                    class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                  />
                </td>
                <td class="border border-gray-300 p-2">
                  <input 
                    v-model="formData[`${nivel.key}Institucion`]" 
                    type="text" 
                    :name="`${nivel.key}Institucion`"
                    class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                  />
                </td>
                <td class="border border-gray-300 p-2">
                  <input 
                    v-model="formData[`${nivel.key}Ciudad`]" 
                    type="text" 
                    :name="`${nivel.key}Ciudad`"
                    class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                  />
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
                v-model="formData.intesidadHoraria"
                :disabled="!formData.nombreDelPrograma"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.intesidadHoraria.required">
                Ingrese la intensidad horaria.
              </p>
            </div>
            <div class="col-span-3">
              <label class="block text-sm font-medium text-gray-600">Nombre del programa</label>
              <input
                type="text"
                placeholder="Nombre del programa"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.nombreDelPrograma"
              />
            </div>
            <div class="col-span-1">
              <label class="block text-sm font-medium text-gray-600">Institución</label>
              <input
                type="text"
                placeholder="Nombre"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.institucion"
                :disabled="!formData.nombreDelPrograma"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.institucion.required">
                Ingrese la intensidad horaria.
              </p>
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
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.cursaEstudios.required">
                Elija una opción.
              </p>
            </div>
            <div class="col-span-1 sm:col-span-3">
              <label class="block text-sm font-medium text-gray-600">¿Qué tipo de<br class="hidden sm:inline"> estudios? </label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.tipoEstudios"
                :disabled="formData.cursaEstudios === 'No'||!formData.cursaEstudios"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.tipoEstudios.required">
                Ingrese el tipo de estudios.
              </p>
            </div>
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">Duración<br class="hidden sm:inline"> (años, semestres, meses)</label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.duracionEstudios"
                :disabled="formData.cursaEstudios === 'No'||!formData.cursaEstudios"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.duracionEstudios.required">
                Ingrese la duración de los estudios.
              </p>
            </div>
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">Año / semestre que<br class="hidden sm:inline"> cursa</label>
              <input
                type="number"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.semestreCursa"
                :disabled="formData.cursaEstudios === 'No'||!formData.cursaEstudios"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.semestreCursa.required">
                Ingrese el año o semestre que cursa.
              </p>
            </div>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mt-2">
            <div class="col-span-1 sm:col-span-2">
              <label class="block text-sm font-medium text-gray-600">Nombre de la institución </label>
              <input
                type="text"
                class="w-full p-1 border border-gray-300 rounded mt-1"
                v-model="formData.nombreInstitucion"
                :disabled="formData.cursaEstudios === 'No'||!formData.cursaEstudios"
              />
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nombreInstitucion.required">
                Ingrese el nombre de la institución.
              </p>
            </div>
            <div class="col-span-1 sm:col-span-1">
              <label class="block text-sm font-medium text-gray-600">Horario</label>
              <select 
              v-model="formData.horario"
              class="w-full px-3 py-2 border rounded-lg text-gray-700 focus:outline-none" 
              :disabled="formData.cursaEstudios === 'No'||!formData.cursaEstudios"
              >
                <option value="">Seleccione...</option>
                <option value="Diurno">Diurno</option>
                <option value="Nocturno">Nocturno</option>
                <option value="Fin de semana">Fin de semana</option>
                <option value="A distancia">A distancia</option>
              </select>
              <p class="text-red-500 text-sm" v-if="submited && !$v.formData.horario.required">
                Seleccione una opción.
              </p>
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
                        <input type="radio" v-model="formData.sistemas" value="Si" class="mr-2" /> Si
                      </label>
                      <label class="ml-4">
                        <input type="radio" v-model="formData.sistemas" value="No" class="mr-2" /> No
                      </label>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.sistemas.required">
                      Seleccione una opción.
                    </p>
                    <label class="block text-sm font-medium text-gray-600">¿Programa(s) que maneja?</label>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input 
                      type="text" 
                      class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                      placeholder="Programa 1"
                      v-model="formData.programa1"
                      :disabled="formData.sistemas === 'No'||!formData.sistemas"
                      />
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.programa1.required">
                      Ingrese el nombre del programa.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.nivelP1" value="R" class="mr-2" :disabled="!formData.programa1"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.nivelP1" value="B" class="mr-2" :disabled="!formData.programa1"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.nivelP1" value="MB" :disabled="!formData.programa1"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nivelP1.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input 
                      type="text" 
                      class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                      placeholder="Programa 3" 
                      v-model="formData.programa3"
                      :disabled="formData.sistemas === 'No'||!formData.sistemas"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.nivelP3" value="R" class="mr-2" :disabled="!formData.programa3"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.nivelP3" value="B" class="mr-2" :disabled="!formData.programa3"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.nivelP3" value="MB" :disabled="!formData.programa3"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nivelP3.required">
                      Seleccione una opción.
                    </p>
                  </td>
                </tr>
                <tr>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input 
                      type="text" 
                      class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                      placeholder="Programa 2" 
                      v-model="formData.programa2"
                      :disabled="formData.sistemas === 'No'||!formData.sistemas"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.nivelP2" value="R" class="mr-2" :disabled="!formData.programa2"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.nivelP2" value="B" class="mr-2" :disabled="!formData.programa2"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.nivelP2" value="MB" :disabled="!formData.programa2"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nivelP2.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input 
                      type="text" 
                      class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none" 
                      placeholder="Programa 4" 
                      v-model="formData.programa4"
                      :disabled="formData.sistemas === 'No'||!formData.sistemas"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.nivelP4" value="R" class="mr-2" :disabled="!formData.programa4"/>
                      <label class="mr-2">B</label>
                      <input type="radio"v-model="formData.nivelP4" value="B" class="mr-2" :disabled="!formData.programa4"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.nivelP4" value="MB" :disabled="!formData.programa4"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.nivelP4.required">
                      Seleccione una opción.
                    </p>
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
                          v-model="formData.idiomas"
                          value="Si"
                          class="mr-2"
                        />
                        Sí
                      </label>
                      <label class="ml-4">
                        <input
                          type="radio"
                          v-model="formData.idiomas"
                          value="No"
                          class="mr-2"
                        />
                        No
                      </label>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.idiomas.required">
                      Seleccione una opción.
                    </p>
                    <label class="block text-sm font-medium text-gray-600">¿Qué idioma(s) conoce?</label>
                  </td>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input
                        type="text"
                        class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none"
                        placeholder="Idioma 1"
                        v-model="formData.idioma1"
                        :disabled="formData.idiomas === 'No'||!formData.idiomas"
                      />
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.idioma1.required">
                      Ingrese el nombre del idioma.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Lectura</label>
                    <div class="flex space-x-2 text-center">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.lecturaI1" value="R" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.lecturaI1" value="B" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.lecturaI1" value="MB" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.lecturaI1.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Escritura</label>
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.escrituraI1" value="R" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.escrituraI1" value="B" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.escrituraI1" value="MB" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.escrituraI1.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <label class="block text-sm font-medium text-gray-600">Hablado</label>
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.habladoI1" value="R" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.habladoI1" value="B" class="mr-2" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.habladoI1" value="MB" :disabled="formData.idiomas === 'No'||!formData.idiomas"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.habladoI1.required">
                      Seleccione una opción.
                    </p>
                  </td>
                </tr>
                <tr>
                  <td class="border border-gray-300 p-2">
                    <div class="flex items-center space-x-2">
                      <input
                        type="text"
                        class="w-full px-3 py-2 border-none rounded-lg text-gray-700 focus:outline-none"
                        placeholder="Idioma 2"
                        v-model="formData.idioma2"
                        :disabled="formData.idiomas === 'No'||!formData.idiomas"
                      />
                    </div>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.lecturaI2" value="R" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.lecturaI2" value="B" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.lecturaI2" value="MB" :disabled="!formData.idioma2"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.lecturaI2.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.escrituraI2" value="R" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.escrituraI2" value="B" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.escrituraI2" value="MB" :disabled="!formData.idioma2"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.escrituraI2.required">
                      Seleccione una opción.
                    </p>
                  </td>
                  <td class="border border-gray-300 p-2 text-center">
                    <div class="flex space-x-2">
                      <label class="mr-2">R</label>
                      <input type="radio" v-model="formData.habladoI2" value="R" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">B</label>
                      <input type="radio" v-model="formData.habladoI2" value="B" class="mr-2" :disabled="!formData.idioma2"/>
                      <label class="mr-2">MB</label>
                      <input type="radio" v-model="formData.habladoI2" value="MB" :disabled="!formData.idioma2"/>
                    </div>
                    <p class="text-red-500 text-sm" v-if="submited && !$v.formData.habladoI2.required">
                      Seleccione una opción.
                    </p>
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
import { NIVELES_ESTUDIO } from '../../../../../../constants';
import { required } from 'vuelidate/lib/validators';
import { EventBus } from '../../../../../../utils/util.js';

export default {
  props: {
        educacion_aptitudes: {
            type: Object,
            default: () => ({}),
        },        
        userId: {
            type: Number,
            default: 0,
        },
        hasHv: {
            type: Boolean,
            default: false,
        },

    },
    data() {
        return {
            formData: {
                primariaTitulo: "",
                primariaAnoFinalizacion: "",
                primariaAnosCursados: "",
                primariaInstitucion: "",
                primariaCiudad: "",
                bachilleratoTitulo: "",
                bachilleratoAnoFinalizacion: "",
                bachilleratoAnosCursados: "",
                bachilleratoInstitucion: "",
                bachilleratoCiudad: "",                
                bachilleratoSelect: "",
                educacionSuperiorTitulo: "",
                educacionSuperiorAnoFinalizacion: "",
                educacionSuperiorAnosCursados: "",
                educacionSuperiorInstitucion: "",
                educacionSuperiorCiudad: "",                
                educacionSuperiorSelect: "",
                postgradosTitulo: "",
                postgradosAnoFinalizacion: "",
                postgradosAnosCursados: "",
                postgradosInstitucion: "",
                postgradosCiudad: "",
                intesidadHoraria: "",
                nombreDelPrograma: "",
                institucion: "",
                cursaEstudios: "",
                tipoEstudios: "",
                duracionEstudios: "",
                semestreCursa: "",
                nombreInstitucion: "",
                horario: "",
                sistemas: "",
                programa1: "",
                programa2: "",
                programa3: "",
                programa4: "",
                nivelP1: "",
                nivelP2: "",
                nivelP3: "",
                nivelP4: "",
                idiomas: "",
                idioma1: "",
                lecturaI1: "",
                escrituraI1: "",
                habladoI1: "",
                idioma2: "",
                lecturaI2: "",
                escrituraI2: "",
                habladoI2: "",                
            },
            nivelesEstudio: NIVELES_ESTUDIO,
            submited: false,
            isUpdating: false,
            spiner: false,
        };
    },
    watch: {
      "formData.cursaEstudios"(newValue) {
          if (newValue === "No") {
              this.$nextTick(() => {
                  this.formData.tipoEstudios = "";
                  this.formData.duracionEstudios = "";
                  this.formData.semestreCursa = "";
                  this.formData.nombreInstitucion = "";
                  this.formData.horario = "";
              });
          }
      },
      "formData.sistemas"(newValue) {
          if (newValue === "No") {
              this.$nextTick(() => {
                  this.formData.programa1 = "";
                  this.formData.programa2 = "";
                  this.formData.programa3 = "";
                  this.formData.programa4 = "";
                  this.formData.nivelP1 = "";
                  this.formData.nivelP2 = "";
                  this.formData.nivelP3 = "";
                  this.formData.nivelP4 = "";                  
              });
          }
      },
      "formData.idiomas"(newValue) {
          if (newValue === "No") {
              this.$nextTick(() => {
                  this.formData.idioma1 = "";
                  this.formData.lecturaI1 = "";
                  this.formData.escrituraI1 = "";
                  this.formData.habladoI1 = "";
                  this.formData.idioma2 = "";
                  this.formData.lecturaI2 = "";
                  this.formData.escrituraI2 = "";
                  this.formData.habladoI2 = "";                  
              });
          }
      },
      "formData.nombreDelPrograma"(newValue) {
          if (!newValue) {
              this.$nextTick(() => {
                  this.formData.intesidadHoraria = "";
                  this.formData.institucion = "";                                 
              });
          }
      }
    },
    created() {
        EventBus.$on('alreadyHasHv', (value) => {
            this.isUpdating = value || this.hasHv;
        });
    },
    beforeDestroy() {
        EventBus.$off('alreadyHasHv');
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
                formData.append("educacion_aptitudes", JSON.stringify({
                  primariaTitulo: this.formData.primariaTitulo,
                  primariaAnoFinalizacion: this.formData.primariaAnoFinalizacion,
                  primariaAnosCursados: this.formData.primariaAnosCursados,
                  primariaInstitucion: this.formData.primariaInstitucion,
                  primariaCiudad: this.formData.primariaCiudad,
                  bachilleratoTitulo: this.formData.bachilleratoTitulo,
                  bachilleratoAnoFinalizacion: this.formData.bachilleratoAnoFinalizacion,
                  bachilleratoAnosCursados: this.formData.bachilleratoAnosCursados,
                  bachilleratoInstitucion: this.formData.bachilleratoInstitucion,
                  bachilleratoCiudad: this.formData.bachilleratoCiudad,                
                  bachilleratoSelect: this.formData.bachilleratoSelect,
                  educacionSuperiorTitulo: this.formData.educacionSuperiorTitulo,
                  educacionSuperiorAnoFinalizacion: this.formData.educacionSuperiorAnoFinalizacion,
                  educacionSuperiorAnosCursados: this.formData.educacionSuperiorAnosCursados,
                  educacionSuperiorInstitucion: this.formData.educacionSuperiorInstitucion,
                  educacionSuperiorCiudad: this.formData.educacionSuperiorCiudad,                
                  educacionSuperiorSelect: this.formData.educacionSuperiorSelect,
                  postgradosTitulo: this.formData.postgradosTitulo,
                  postgradosAnoFinalizacion: this.formData.postgradosAnoFinalizacion,
                  postgradosAnosCursados: this.formData.postgradosAnosCursados,
                  postgradosInstitucion: this.formData.postgradosInstitucion,
                  postgradosCiudad: this.formData.postgradosCiudad,
                  intesidadHoraria: this.formData.intesidadHoraria,
                  nombreDelPrograma: this.formData.nombreDelPrograma,
                  institucion: this.formData.institucion,
                  cursaEstudios: this.formData.cursaEstudios,
                  tipoEstudios: this.formData.tipoEstudios,
                  duracionEstudios: this.formData.duracionEstudios,
                  semestreCursa: this.formData.semestreCursa,
                  nombreInstitucion: this.formData.nombreInstitucion,
                  horario: this.formData.horario,
                  sistemas: this.formData.sistemas,
                  programa1: this.formData.programa1,
                  programa2: this.formData.programa2,
                  programa3: this.formData.programa3,
                  programa4: this.formData.programa4,
                  nivelP1: this.formData.nivelP1,
                  nivelP2: this.formData.nivelP2,
                  nivelP3: this.formData.nivelP3,
                  nivelP4: this.formData.nivelP4,
                  idiomas: this.formData.idiomas,
                  idioma1: this.formData.idioma1,
                  lecturaI1: this.formData.lecturaI1,
                  escrituraI1: this.formData.escrituraI1,
                  habladoI1: this.formData.habladoI1,
                  idioma2: this.formData.idioma2,
                  lecturaI2: this.formData.lecturaI2,
                  escrituraI2: this.formData.escrituraI2,
                  habladoI2: this.formData.habladoI2,
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
                    this.sendEvent();
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
        sendEvent() {
            EventBus.$emit('alreadyHasHv', true);
        },
        async loadData() {
            if (this.educacion_aptitudes && Object.keys(this.educacion_aptitudes).length > 0 || this.hasHv) {              
                this.isUpdating = true;
                Object.assign(this.formData, this.educacion_aptitudes);
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
          cursaEstudios: { required },
          tipoEstudios: {
              required: (value, formData) => formData.cursaEstudios === 'Si' ? !!value : true,
          },
          duracionEstudios: {
              required: (value, formData) => formData.cursaEstudios === 'Si' ? !!value : true,
          },
          semestreCursa: {
              required: (value, formData) => formData.cursaEstudios === 'Si' ? !!value : true,
          },
          nombreInstitucion: {
              required: (value, formData) => formData.cursaEstudios === 'Si' ? !!value : true,
          },
          horario: {
              required: (value, formData) => formData.cursaEstudios === 'Si' ? !!value : true,
          },
          sistemas: { required },
          programa1: {
              required: (value, formData) => formData.sistemas === 'Si' ? !!value : true,
          },
          nivelP1: {
              required: (value, formData) => formData.sistemas === 'Si' ? !!value : true,
          },
          nivelP2: {
              required: (value, formData) => formData.programa2 !== '' ? !!value : true,
          },          
          nivelP3: {
              required: (value, formData) => formData.programa3 !== '' ? !!value : true,
          },         
          nivelP4: {
              required: (value, formData) => formData.programa4 !== '' ? !!value : true,
          },
          idiomas: { required },
          idioma1: {
              required: (value, formData) => formData.idiomas === 'Si' ? !!value : true,
          },
          lecturaI1: {
              required: (value, formData) => formData.idiomas === 'Si' ? !!value : true,
          },
          escrituraI1: {
              required: (value, formData) => formData.idiomas === 'Si' ? !!value : true,
          },
          habladoI1: {
              required: (value, formData) => formData.idiomas === 'Si' ? !!value : true,
          },   
          lecturaI2: {
              required: (value, formData) => formData.idioma2 !== '' ? !!value : true,
          },
          escrituraI2: {
              required: (value, formData) => formData.idioma2 !== '' ? !!value : true,
          },
          habladoI2: {
              required: (value, formData) => formData.idioma2 !== '' ? !!value : true,
          },
          intesidadHoraria: {
              required: (value, formData) => formData.nombreDelPrograma !== '' ? !!value : true,
          },         
          institucion: {
              required: (value, formData) => formData.nombreDelPrograma !== '' ? !!value : true,
          }
        }
    },
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

    .table-auto select {
      width: 123px !important;
      padding: 0.75rem;
    }
  }
  button, input, select, textarea {
    border-style: double;
  }
</style>