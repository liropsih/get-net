import $axios from '@/http'
import moment from 'moment'

export default {
    state: {
        additional: null,
        tariffs: null,
        pays: null
    },
    mutations: {
        setAdditional(state, data) {
            state.additional = data
        },
        setTariffs(state, data) {
            state.tariffs = data
        },
        setPays(state, data) {
            state.pays = data
        }
    },
    actions: {
        async getAdditional({ commit, dispatch }) {
            try {
                const { data } = await $axios.get('/service/additional')
                commit('setAdditional', data)
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async addAdditional({ dispatch }, id) {
            try {
                const { data } = await $axios.post('/service/additional', { id })
                dispatch('getAdditional')
                dispatch('setMessage', data)
                dispatch('authCheck')
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async removeAdditional({ dispatch }, id) {
            try {
                const { data } = await $axios.delete('/service/additional', { data: { id } })
                dispatch('getAdditional')
                dispatch('setMessage', data)
                dispatch('authCheck')
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async getTariffs({ commit, dispatch }) {
            try {
                const { data } = await $axios.get('/service/tariff')
                commit('setTariffs', data)
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async updateTariff({ dispatch }, id) {
            try {
                const { data } = await $axios.put('/service/tariff', { id })
                dispatch('getTariffs')
                dispatch('setMessage', data)
                dispatch('authCheck')
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async getPays({ commit, dispatch }, params) {
            try {
                const { data } = await $axios.get('/service/pay', { params })
                data.rows.forEach(pay => pay.date = moment(pay.created_at).format('DD.MM.YYYY'))
                commit('setPays', data)
            } catch (e) {
                dispatch('setError', e)
            }
        },
        async addPay({ dispatch }, value) {
            try {
                const { data } = await $axios.post('/service/pay', { value })
                dispatch('getPays')
                dispatch('setMessage', data)
                dispatch('authCheck')
            } catch (e) {
                dispatch('setError', e)
            }
        }
    },
    getters: {
        additional: s => s.additional,
        tariffs: s => s.tariffs,
        pays: s => s.pays
    }
}
