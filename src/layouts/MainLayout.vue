<template>
  <div class="main-layout" v-if="!loading">
    <Navbar />
    <Breadcrumb />
    <main class="mt-5">
      <transition name="component-fade" mode="out-in">
        <router-view />
      </transition>
    </main>
  </div>
</template>

<script>
import Navbar from "@/components/app/Navbar"
import Breadcrumb from "@/components/app/Breadcrumb"
import { mapActions } from 'vuex'

export default {
  name: "main-layout",
  data: () => ({
    loading: true
  }),
  components: { Navbar, Breadcrumb },
  async mounted() {
    await this.authCheck()
    this.loading = false
  },
  methods: {
    ...mapActions(['authCheck'])
  }
}
</script>
