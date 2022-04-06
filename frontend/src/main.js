import Vue from "vue";
import { ToastPlugin, ModalPlugin } from "bootstrap-vue";
import VueCompositionAPI from "@vue/composition-api";
import router from "./router";
import store from "./store";
import App from "./App.vue";
import "./global-components";
import "@/libs/portal-vue";
import "@/libs/toastification";
import axios from "axios";
import VueAxios from "vue-axios";

Vue.use(VueAxios, axios);
Vue.use(ToastPlugin);
Vue.use(ModalPlugin);
Vue.use(VueCompositionAPI);

require("@core/scss/core.scss");
require("@/assets/scss/style.scss");

Vue.config.productionTip = false;

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount("#app");
