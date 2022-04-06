<template>
    <div class="auth-wrapper auth-v2">
        <b-row class="auth-inner m-0">
            <!-- Brand logo-->
            <b-link class="brand-logo">
                <vuexy-logo />

                <h2 class="brand-text text-primary ml-1">
                    Vuexy
                </h2>
            </b-link>
            <!-- /Brand logo-->

            <!-- Left Text-->
            <b-col lg="8" class="d-none d-lg-flex align-items-center p-5">
                <div
                    class="w-100 d-lg-flex align-items-center justify-content-center px-5"
                >
                    <b-img fluid :src="imgUrl" alt="Register V2" />
                </div>
            </b-col>
            <!-- /Left Text-->

            <!-- Register-->
            <b-col lg="4" class="d-flex align-items-center auth-bg px-2 p-lg-5">
                <b-col sm="8" md="6" lg="12" class="px-xl-2 mx-auto">
                    <b-card-title title-tag="h2" class="font-weight-bold mb-1">
                        Adventure starts here 🚀
                    </b-card-title>
                    <b-card-text class="mb-2">
                        Make your app management easy and fun!
                    </b-card-text>

                    <!-- form -->
                    <validation-observer ref="registerForm">
                        <b-form class="auth-register-form mt-2">
                            <!-- username -->
                            <b-form-group
                                label="Username"
                                label-for="register-username"
                            >
                                <validation-provider
                                    #default="{ errors }"
                                    name="Username"
                                    rules="required"
                                >
                                    <b-form-input
                                        id="register-username"
                                        v-model="form.username"
                                        name="register-username"
                                        :state="
                                            errors.length > 0 ? false : null
                                        "
                                        placeholder="johndoe"
                                    />
                                    <small class="text-danger">{{
                                        errors[0]
                                    }}</small>
                                </validation-provider>
                            </b-form-group>

                            <!-- email -->
                            <b-form-group
                                label="Email"
                                label-for="register-email"
                            >
                                <validation-provider
                                    #default="{ errors }"
                                    name="Email"
                                    rules="required|email"
                                >
                                    <b-form-input
                                        id="register-email"
                                        v-model="form.email"
                                        name="register-email"
                                        :state="
                                            errors.length > 0 ? false : null
                                        "
                                        placeholder="john@example.com"
                                    />
                                    <small class="text-danger">{{
                                        errors[0]
                                    }}</small>
                                </validation-provider>
                            </b-form-group>

                            <!-- Gender -->
                            <b-form-group
                                label="Gender"
                                label-for="contactUs-gender"
                            >
                                <validation-provider
                                    #default="{ errors }"
                                    name="Gender"
                                    rules="required"
                                >
                                    <b-form-input
                                        id="contactUs-gender"
                                        v-model="form.gender"
                                        name="contactUs-gender"
                                        :state="
                                            errors.length > 0 ? false : null
                                        "
                                        placeholder="Male, Female or Other"
                                    />
                                    <small class="text-danger">{{
                                        errors[0]
                                    }}</small>
                                </validation-provider>
                            </b-form-group>

                            <!-- Content -->
                            <b-form-group
                                label="Content"
                                label-for="contactUs-content"
                            >
                                <validation-provider
                                    #default="{ errors }"
                                    name="content"
                                    rules="required"
                                >
                                    <b-form-textarea
                                        id="contactUs-content"
                                        v-model="form.content"
                                        name="contactUs-content"
                                        :state="
                                            errors.length > 0 ? false : null
                                        "
                                        placeholder="Tell us about yourself"
                                    />
                                    <small class="text-danger">{{
                                        errors[0]
                                    }}</small>
                                </validation-provider>
                            </b-form-group>
                            <b-button
                                variant="primary"
                                block
                                type="submit"
                                @click.prevent="validationForm"
                            >
                                <b-spinner v-show="loading" small />

                                <span v-show="!loading">Submit</span>
                            </b-button>
                        </b-form>
                    </validation-observer>
                </b-col>
            </b-col>
            <!-- /Register-->
        </b-row>
    </div>
</template>

<script>
/* eslint-disable global-require */
import { ValidationProvider, ValidationObserver } from "vee-validate";
import VuexyLogo from "@core/layouts/components/Logo.vue";
import {
    BRow,
    BCol,
    BLink,
    BButton,
    BForm,
    BFormCheckbox,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BInputGroup,
    BInputGroupAppend,
    BImg,
    BCardTitle,
    BCardText,
    BSpinner
} from "bootstrap-vue";
import { required, email } from "@validations";
import { togglePasswordVisibility } from "@core/mixins/ui/forms";
import store from "@/store";
import ToastificationContent from "@core/components/toastification/ToastificationContent.vue";

export default {
    components: {
        VuexyLogo,
        BRow,
        BImg,
        BCol,
        BLink,
        BButton,
        BForm,
        BCardText,
        BCardTitle,
        BFormCheckbox,
        BFormGroup,
        BFormInput,
        BInputGroup,
        BInputGroupAppend,
        BFormTextarea,
        // validations
        ValidationProvider,
        ValidationObserver,
        BSpinner
    },
    mixins: [togglePasswordVisibility],
    data() {
        return {
            url: "http://127.0.0.1:8000/api/saveContactDetails",
            form: {
                username: "",
                email: "",
                status: false,
                gender: "",
                content: ""
            },
            status: "",
            loading: false,
            sideImg: require("@/assets/images/pages/register-v2.svg"),
            // validation
            required,
            email
        };
    },
    computed: {
        passwordToggleIcon() {
            return this.passwordFieldType === "password"
                ? "EyeIcon"
                : "EyeOffIcon";
        },
        imgUrl() {
            if (store.state.appConfig.layout.skin === "dark") {
                // eslint-disable-next-line vue/no-side-effects-in-computed-properties
                this.sideImg = require("@/assets/images/pages/register-v2-dark.svg");
                return this.sideImg;
            }
            return this.sideImg;
        }
    },
    methods: {
        validationForm() {
            this.loading = true;
            this.$refs.registerForm.validate().then(success => {
                if (success) {
                    this.submitContactUsForm();
                } else {
                    this.loading = false;
                }
            });
        },
        submitContactUsForm() {
            this.axios
                .post(this.url, this.form)
                .then(response => {
                    console.log(response);
                    this.$toast({
                        component: ToastificationContent,
                        props: {
                            title: "Form Submitted",
                            icon: "EditIcon",
                            variant: "success"
                        }
                    });
                    this.loading = false;
                    this.$router.push("/");
                })
                .catch(error => {
                    // console.log(error);
                    // this.$toast({
                    //     component: ToastificationContent,
                    //     props: {
                    //         title: "Failed",
                    //         icon: "EditIcon",
                    //         variant: "danger",
                    //         text: "Opps! something went wrong"
                    //     }
                    // });
                    this.$router.push("/");
                    this.loading = false;
                });
        }
    }
};
/* eslint-disable global-require */
</script>

<style lang="scss">
@import "@core/scss/vue/pages/page-auth.scss";
</style>
