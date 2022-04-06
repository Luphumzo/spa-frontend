<template>
    <div>
        <div class="mb-3">
            <b-row>
                <b-col md="3">
                    <b-form-input
                        v-model="form.name"
                        name="name"
                        placeholder="John Doe"
                    />
                </b-col>
                <b-col md="3">
                    <b-form-input
                        v-model="form.email"
                        name="email"
                        placeholder="mygoogle@gmail.com"
                    />
                </b-col>
                <b-col md="3">
                    <b-form-select
                        v-model="form.gender"
                        :options="selectOptions"
                    ></b-form-select>
                </b-col>
                <b-col md="3">
                    <b-button type="submit" variant="primary" @click="submit()">
                        search
                    </b-button>
                </b-col>
            </b-row>
        </div>
        <b-table :items="tableData" :fields="fields" striped responsive />
    </div>
</template>

<script>
import ToastificationContent from "@core/components/toastification/ToastificationContent.vue";
import {
    BTable,
    BCard,
    BFormCheckbox,
    BButton,
    BRow,
    BCol,
    BAvatar,
    BBadge,
    BFormDatepicker,
    BFormSelect,
    BSpinner,
    BFormInput
} from "bootstrap-vue";
export default {
    components: {
        BTable,
        BButton,
        BFormCheckbox,
        BCard,
        BRow,
        BCol,
        BBadge,
        BAvatar,
        BFormDatepicker,
        BFormSelect,
        BSpinner,
        ToastificationContent,
        BFormInput
    },
    data() {
        return {
            form: {
                name: "",
                email: "",
                gender: ""
            },
            deleteLoading: false,
            loading: false,
            fields: ["name", "email", "gender", "content"],
            selectOptions: [
                { value: "Male", text: "Male" },
                { value: "Female", text: "Female" },
                { value: "Other", text: "Other" }
            ],
            getUrl: "http://127.0.0.1:8000/api/getSearchList"
        };
    },
    computed: {
        tableData() {
            return this.$store.getters["contacts/contacts"];
        }
    },
    methods: {
        submit() {
            this.loading = true;
            this.axios
                .post(this.getUrl, this.form)
                .then(response => {
                    this.$store.dispatch("contacts/setContacts", response.data);
                    this.$emit("searched");
                    this.$toast({
                        component: ToastificationContent,
                        props: {
                            title: "Success",
                            icon: "EditIcon",
                            variant: "success",
                            text: "Updated Leave Details"
                        }
                    });
                })
                .catch(error => {
                    this.$toast({
                        component: ToastificationContent,
                        props: {
                            title: "Failed",
                            icon: "EditIcon",
                            variant: "danger",
                            text: "Oops Something went wrong"
                        }
                    });
                    this.loading = false;
                    console.log(error);
                });
        }
    }
};
</script>
