import state from "./contacts_state";
import mutations from "./contacts_mutations.js";
import actions from "./contacts_actions.js";
import getters from "./contacts_getters.js";

export default {
    namespaced: true,
    state: state,
    mutations: mutations,
    actions: actions,
    getters: getters
};
