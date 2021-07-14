<template>
  <b-breadcrumb v-if="activePage">
    <b-breadcrumb-item :to="{ name: 'Home' }">
      <b-icon
        icon="house-fill"
        scale="1.25"
        shift-v="1.25"
        aria-hidden="true"
      />
      Кабинет
    </b-breadcrumb-item>
    <b-breadcrumb-item active>{{ activePage }}</b-breadcrumb-item>
  </b-breadcrumb>
</template>

<script>
export default {
  name: 'Breadcrumb',
  computed: {
    activePage() { return this.$route.meta.breadcrumb }
  }
}
</script>