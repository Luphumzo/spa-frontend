const actions = {
    setUser({ commit }, user) {
        commit("SET_USER", user);
    },
    setUserLogoutToken({ commit }, token) {
        commit("SET_USER_LOGOUT_TOKEN", token);
    }
};

export default actions;
