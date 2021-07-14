import $axios from '@/http'
const token = localStorage.getItem('token')

export default {
  state: {
    token: token || null,
    user: null
  },
  mutations: {
    login(state, data) {
      state.token = data
    },
    logout(state) {
      state.token = null
      state.user = null
      localStorage.removeItem('token')
    },
    setUser(state, data) {
      state.user = data
    }
  },
  actions: {
    async login({ commit, dispatch }, body) {
      try {
        const { data } = await $axios.post('/user', body)
        localStorage.setItem('token', data)
        commit('login', data)
      } catch (e) {
        dispatch('setError', e)
      }
    },
    logout({ commit }) {
      commit('logout')
    },
    async authCheck({ commit, dispatch }) {
      try {
        const { data } = await $axios.get('/user')
        localStorage.setItem('token', data.token)
        commit('login', data.token)
        commit('setUser', data.user)
      } catch (e) {
        dispatch('setError', e)
        commit('logout')
      }
    },
    async updateProfile({ dispatch }, body) {
      try {
        const { data } = await $axios.put('/user', body)
        dispatch('authCheck')
        dispatch('setMessage', data)
      } catch (e) {
        dispatch('setError', e)
      }
    }
  },
  getters: {
    user: s => s.user,
    isLoggedIn: s => !!s.token
  }
}
