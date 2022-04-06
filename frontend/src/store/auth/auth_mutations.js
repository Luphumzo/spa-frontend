const mutations = {
    SET_USER(state, user) {
        state.user = user;
    },
    SET_USER_LOGOUT_TOKEN(state, token) {
        state.user_logout_token = token;
    }
};

export default mutations;
