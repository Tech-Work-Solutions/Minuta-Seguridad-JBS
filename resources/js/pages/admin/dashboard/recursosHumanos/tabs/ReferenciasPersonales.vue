<template>
    <div class="bg-gray-100 p-6">
        <div id="app" class="max-w-4xl mx-auto bg-white shadow-md rounded-lg p-6">
            <h1 class="text-center text-xl font-bold text-blue-600 mb-4">VII. REFERENCIAS PERSONALES</h1>

            <!-- Personal References Section -->
            <div class="mb-6">
                <p class="font-semibold mb-2">Relacione dos nombres de personas distintas a familiares o empleadores:
                </p>
                <div class="grid grid-cols-12 gap-2 text-sm" v-for="(reference, index) in formData.references"
                    :key="index">
                    <div class="col-span-3 font-medium">Nombre</div>
                    <div class="col-span-3 font-medium">Ocupación</div>
                    <div class="col-span-3 font-medium">Dirección</div>
                    <div class="col-span-3 font-medium">Teléfono</div>

                    <input type="text" class="col-span-3 border p-2" v-model="reference.name" placeholder="Nombre">
                    <input type="text" class="col-span-3 border p-2" v-model="reference.occupation"
                        placeholder="Ocupación">
                    <input type="text" class="col-span-3 border p-2" v-model="reference.address"
                        placeholder="Dirección">
                    <input type="text" class="col-span-3 border p-2" v-model="reference.phone" placeholder="Teléfono">
                </div>
            </div>

            <!-- Emergency Contact Section -->
            <div class="mb-6">
                <p class="font-semibold mb-2">Nombre de un familiar que podamos contactar en caso de no localizarlo a
                    usted directamente:</p>
                <div class="grid grid-cols-12 gap-2 text-sm">
                    <div class="col-span-3 font-medium">Nombre</div>
                    <div class="col-span-3 font-medium">Ocupación</div>
                    <div class="col-span-3 font-medium">Dirección</div>
                    <div class="col-span-3 font-medium">Teléfono</div>

                    <input type="text" class="col-span-3 border p-2" v-model="formData.emergencyContact.name"
                        placeholder="Nombre">
                    <input type="text" class="col-span-3 border p-2" v-model="formData.emergencyContact.occupation"
                        placeholder="Ocupación">
                    <input type="text" class="col-span-3 border p-2" v-model="formData.emergencyContact.address"
                        placeholder="Dirección">
                    <input type="text" class="col-span-3 border p-2" v-model="formData.emergencyContact.phone"
                        placeholder="Teléfono">
                </div>
            </div>

            <!-- Verification Section -->
            <div class="mb-6">
                <p class="font-semibold mb-2">Verificación (Espacio exclusivo para el entrevistador):</p>
                <textarea class="w-full border p-2 h-24" v-model="formData.verification"></textarea>
            </div>

            <!-- Footer Section -->
            <div class="text-sm border-t pt-4">
                <div class="grid grid-cols-12 gap-4">
                    <div class="col-span-6">
                        <div class="flex items-center space-x-2 mb-2">
                            <input type="checkbox" id="authorize" class="w-4 h-4" v-model="formData.authorize">
                            <label for="authorize">Autorizo pedir información de mi Hoja de Vida sin ninguna
                                restricción.</label>
                        </div>
                        <p class="font-semibold text-blue-600">¡Importante!</p>
                        <p>Este es un formato de distribución GRATUITA, puede buscarlo en la Web, puede imprimir o
                            enviar este formato por correo electrónico sin restricciones.</p>
                    </div>
                    <div class="col-span-6">
                        <p class="mb-2">Nota importante:</p>
                        <p class="text-gray-600 text-sm">Favor no llamar por teléfono, ni concurrir a preguntar por el
                            resultado de esta solicitud. Nosotros le avisaremos, gracias.</p>
                        <p class="mt-4 font-semibold">Certificación:</p>
                        <p class="text-gray-600 text-sm">Para todos los efectos legales, certifico que todas las
                            respuestas informaciones anotadas por mí, en el presente formato son veraces.</p>
                    </div>
                </div>
                <div class="mt-6">
                    <label for="signature" class="font-semibold">Firma del solicitante:</label>
                    <input type="text" id="signature" class="border p-2 w-full" v-model="formData.signature"
                        placeholder="Nombre del solicitante">
                    <label for="id" class="font-semibold mt-2 block">C.C.:</label>
                    <input type="text" id="id" class="border p-2 w-full" v-model="formData.cc" placeholder="C.C.">
                </div>
            </div>

            <button class="mt-6 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Submit</button>
        </div>
    </div>
</template>

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';

export default {
    data() {
        return {
            formData: {
                references: [
                    { name: '', occupation: '', address: '', phone: '' },
                    { name: '', occupation: '', address: '', phone: '' },
                ],
                emergencyContact: {
                    name: '',
                    occupation: '',
                    address: '',
                    phone: '',
                },
                signature: '',
                cc: '',
                authorize: false,

            },

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