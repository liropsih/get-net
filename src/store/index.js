import Vue from 'vue'
import Vuex from 'vuex'
import user from './user'
import service from './service'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    error: null,
    message: null
  },
  mutations: {
    setError(state, error) {
      state.error = error
    },
    clearError(state) {
      state.error = null
    },
    setMessage(state, message) {
      state.message = message
    },
    clearMessage(state) {
      state.message = null
    },
  },
  actions: {
    setError({ commit }, error) {
      const e = error?.response?.data?.message ? error.response.data.message : 'Что-то пошло не так'
      commit('setError', e)
      setTimeout(() => commit('clearError'), 200)
    },
    setMessage({ commit }, message) {
      const m = message?.message ? message.message : message
      commit('setMessage', m)
      setTimeout(() => commit('clearMessage'), 200)
    }
  },
  getters: {
    error: s => s.error,
    message: s => s.message
  },
  modules: {
    user,
    service
  }
})
