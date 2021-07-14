<template>
  <b-navbar type="dark" variant="info">
    <b-navbar-brand :to="{ name: 'Home' }">Кабинет</b-navbar-brand>
    <b-navbar-nav class="ml-auto">
      <b-nav-item-dropdown right>
        <template #button-content>
          <em>{{ user.name }}</em>
        </template>
        <b-dropdown-item :to="{ name: 'Profile' }">
          Настройка профиля
        </b-dropdown-item>
        <b-dropdown-item href="#" @click.prevent="exit">
          Выйти
        </b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>
  </b-navbar>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'Navbar',
  computed: {
    ...mapGetters(['user'])
  },
  methods: {
    ...mapActions(['logout']),
    exit() {
      this.logout()
      this.$router.push({ name: 'Login', query: { message: 'logout' } })
    }
  }
}
</script>