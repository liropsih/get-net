import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    meta: {
      is_auth: true,
      layout: 'main'
    },
    component: () => import('@/views/Home.vue')
  },
  {
    path: '/login',
    name: 'Login',
    meta: {
      is_guest: true
    },
    component: () => import('@/views/Login.vue')
  },
  {
    path: '/profile',
    name: 'Profile',
    meta: {
      is_auth: true,
      layout: 'main',
      breadcrumb: 'Профиль'
    },
    component: () => import('@/views/Profile.vue')
  },
  {
    path: '/history',
    name: 'History',
    meta: {
      is_auth: true,
      layout: 'main',
      breadcrumb: 'История'
    },
    component: () => import('@/views/History.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  const meta_auth = to.matched.some(record => record.meta.is_auth)
  const meta_guest = to.matched.some(record => record.meta.is_guest)
  const isLoggedIn = store.getters.isLoggedIn
  if (meta_auth && !isLoggedIn) {
    next({ name: 'Login', query: { message: 'login' } })
  } else if (meta_guest && isLoggedIn) {
    next({ name: 'Home' })
  } else {
    next()
  }
})

export default router
