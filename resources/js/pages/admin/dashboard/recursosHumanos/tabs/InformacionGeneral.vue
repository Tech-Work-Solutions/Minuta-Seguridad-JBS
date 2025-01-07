<template>
    <div>
        <div class="flex flex-wrap items-center">
            <h1 class="text-xl text-gray-500 pl-5 mr-5 font-bold"><em class="fas fa-file-signature"></em> Registro de
                Informacion</h1>
        </div>
    </div>
</template>

<script>
import { TRichSelect } from 'vue-tailwind/dist/components';

export default {
    data() {
        return {
            formData: {
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