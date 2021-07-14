<template>
  <b-container>
    <b-row align-v="center">
      <b-col sm="12" md="6" offset-md="3" lg="4" offset-lg="4">
        <b-card header="Авторизация">
          <b-form @submit.prevent="submit">
            <b-form-group
              label="Email"
              label-for="email"
              :invalid-feedback="
                !$v.form.email.required
                  ? 'Email не должен быть пустым'
                  : 'Некорректный Email'
              "
              :state="
                $v.form.email.$dirty ? $v.form.email.required && $v.form.email.email : null
              "
            >
              <b-form-input
                id="email"
                v-model.trim="form.email"
                @blur="$v.form.email.$touch"
                :state="
                  $v.form.email.$dirty ? $v.form.email.required && $v.form.email.email : null
                "
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
import { required, email } from 'vuelidate/lib/validators'
import { mapActions } from 'vuex'

export default {
  name: 'email',
  data: () => ({
    form: {
      email: '',
      password: ''
    }
  }),
  validations: {
    form: {
      email: { required, email },
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