<template>
  <b-container>
    <b-row align-v="center">
      <b-col sm="12" md="6" offset-md="3" lg="4" offset-lg="4">
        <b-card header="Авторизация">
          <b-form @submit.prevent="submit">
            <b-form-group
              label="Логин"
              label-for="login"
              invalid-feedback="Логин не должен быть пустым"
              :state="$v.form.login.$dirty ? $v.form.login.required : null"
            >
              <b-form-input
                id="login"
                v-model.trim="form.login"
                @blur="$v.form.login.$touch"
                :state="$v.form.login.$dirty ? $v.form.login.required : null"
              />
            </b-form-group>
            <b-form-group
              label="Пароль"
              label-for="password"
              invalid-feedback="Пароль не должен быть пустым"
              :state="
                $v.form.password.$dirty ? $v.form.password.required : null
              "
            >
              <b-form-input
                id="password"
                type="password"
                v-model.trim="form.password"
                @blur="$v.form.password.$touch"
                :state="
                  $v.form.password.$dirty ? $v.form.password.required : null
                "
              />
            </b-form-group>
            <b-button type="submit" :disabled="$v.$invalid" block>
              Войти
            </b-button>
          </b-form>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { required } from 'vuelidate/lib/validators'
import { mapActions } from 'vuex'

export default {
  name: 'Login',
  data: () => ({
    form: {
      login: '',
      password: ''
    }
  }),
  validations: {
    form: {
      login: { required },
      password: { required }
    }
  },
  methods: {
    ...mapActions(['login']),
    async submit() {
      if (!this.$v.$invalid) {
        try {
          await this.login(this.form)
          this.$router.push({ name: 'Home' })
        } catch (e) { }
      }
    }
  }
}
</script>