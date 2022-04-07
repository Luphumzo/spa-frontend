const actions = {
    setUser({ commit }, user) {
        commit("SET_USER", user);
    },
    setUserLogoutToken({ commit }, token) {
        commit("SET_USER_LOGOUT_TOKEN", token);
    },
    setIsAuthenticated({ commit }, data) {
        commit("SET_IS_USER_AUTHENTICATED", data);
    }
};

export default actions;
