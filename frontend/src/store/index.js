import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

// Modules
import app from "./app";
import appConfig from "./app-config";
import verticalMenu from "./vertical-menu";

import moduleAuth from "./auth/auth.js";
import moduleContacts from "./contacts/contacts.js";

Vue.use(Vuex);

const dataState = createPersistedState({
    paths: app
});

export default new Vuex.Store({
    modules: {
        app,
        appConfig,
        verticalMenu,
        auth: moduleAuth,
        contacts: moduleContacts
    },
    strict: false,
    plugins: [dataState]
});
