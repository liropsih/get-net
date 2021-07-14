export default {
  install (Vue) {
    Vue.prototype.$message = function (text) {
      this.$bvToast.toast(text, {
        title: 'Сообщение системы',
        toaster: 'b-toaster-bottom-right',
        solid: true,
        appendToast: true
      })
    }
    Vue.prototype.$error = function (text) {
      this.$bvToast.toast(text, {
        title: 'Ошибка',
        toaster: 'b-toaster-bottom-right',
        variant: 'danger',
        solid: true,
        appendToast: true
      })
    }
  }
}
