const mutations = {
    SET_USER(state, user) {
        state.user = user;
    },
    SET_USER_LOGOUT_TOKEN(state, token) {
        state.user_logout_token = token;
    },
    SET_IS_USER_AUTHENTICATED(state, data) {
        state.isAuthenticated = data;
    }
};

export default mutations;
