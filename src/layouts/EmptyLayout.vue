<template>
  <div class="empty-layout bg-secondary">
    <transition name="component-fade" mode="out-in">
      <router-view />
    </transition>
  </div>
</template>

<script>
export default {
  name: "empty-layout"
}
</script>

