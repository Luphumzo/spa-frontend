<template>
    <div>
        <b-card title="Keep track of your contact list">
            <table-component :key="key" @searched="searched"></table-component>
        </b-card>
    </div>
</template>
<script>
import tableComponent from "./components/table.vue";
import { BCard } from "bootstrap-vue";
import { VueGoodTable } from "vue-good-table";
import ToastificationContent from "@core/components/toastification/ToastificationContent.vue";
export default {
    components: {
        VueGoodTable,
        BCard,
        tableComponent,
        ToastificationContent
    },
    data() {
        return {
            key: 0,
            getUrl: "http://127.0.0.1:8000/api/getContactList"
        };
    },
    mounted() {
        this.getContactList();
    },
    methods: {
        getContactList() {
            this.axios
                .get(this.getUrl)
                .then(response => {
                    this.$store.dispatch("contacts/setContacts", response.data);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        searched() {
            this.key++;
        }
    }
};
</script>

<style></style>
