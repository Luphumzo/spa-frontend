<template>
    <div>
        <b-card title="Apply for leave here!">
            <b-card-text
                >You have {{ form.user_leave_days }} days left</b-card-text
            >
            <b-row>
                <b-col md="4">
                    <b-form-datepicker
                        local="en"
                        placeholder="Leave Start Day"
                        class="mb-1"
                        selected-variant="primary"
                        v-model="form.start_date"
                    />
                </b-col>
                <b-col md="4">
                    <b-form-datepicker
                        local="en"
                        placeholder="Leave End Day"
                        class="mb-1"
                        selected-variant="secondary"
                        v-model="form.end_date"
                    />
                </b-col>
                <b-col md="4">
                    <b-button type="submit" variant="primary" @click="submit()">
                        Submit
                    </b-button>
                </b-col>
            </b-row>
        </b-card>

        <table-component></table-component>
    </div>
</template>

<script>
import tableComponent from "./components/table.vue";
import ToastificationContent from "@core/components/toastification/ToastificationContent.vue";
import moment from "moment";
import {
    BCard,
    BCardText,
    BLink,
    BFormDatepicker,
    BButton,
    BRow,
    BCol
} from "bootstrap-vue";

export default {
    components: {
        BCard,
        BCardText,
        BLink,
        BFormDatepicker,
        BButton,
        BRow,
        BCol,
        tableComponent,
        ToastificationContent
    },
    data() {
        return {
            url: "http://127.0.0.1:8000/api/createLeave",
            getUrl:
                "http://127.0.0.1:8000/api/getLeaves/" +
                this.$store.getters["auth/user"]["id"],
            form: {
                user_id: this.$store.getters["auth/user"]["id"],
                start_date: "",
                end_date: "",
                user_leave_days: this.$store.getters["auth/user"][
                    "leave_days_left"
                ]
            }
        };
    },
    computed: {
        role() {
            return this.$store.getters["auth/user"]["role"];
        }
    },
    mounted() {
        this.getLeavesByUserId();
    },
    methods: {
        submit() {
            let num = this.dateDiff(this.form.start_date, this.form.end_date);

            if (this.form.user_leave_days >= num) {
                this.axios
                    .post(this.url, this.form)
                    .then(response => {
                        this.$toast({
                            component: ToastificationContent,
                            props: {
                                title: "Success",
                                icon: "EditIcon",
                                variant: "success",
                                text: response.data.message
                            }
                        });
                        this.getLeavesByUserId();
                    })
                    .catch(error => {
                        console.log(error);
                    });
            } else {
                this.$toast({
                    component: ToastificationContent,
                    props: {
                        title: "Falied",
                        icon: "EditIcon",
                        variant: "danger",
                        text: "You do not have enough leave days"
                    }
                });
            }
        },
        getLeavesByUserId() {
            this.axios
                .get(this.getUrl, {
                    params: this.role
                })
                .then(response => {
                    this.$store.dispatch("contacts/setContacts", response.data);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        dateDiff(startDateString, endDateString) {
            let start = moment(startDateString);
            let end = moment(endDateString);
            let duration = moment.duration(end.diff(start));
            let days = duration.asDays();
            return Math.round(days);
        }
    }
};
</script>

<style></style>
