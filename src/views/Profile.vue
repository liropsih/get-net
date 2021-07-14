<template>
  <b-container>
    <b-row>
      <b-col sm="12" md="12" lg="8" offset-lg="2">
        <b-card header="Настройки профиля">
          <b-form @submit.prevent="submit">
            <b-form-group
              label="Имя"
              label-for="name"
              invalid-feedback="Имя не должно быть пустым"
              :state="$v.name.$dirty ? $v.name.required : null"
            >
              <b-form-input
                id="login"
                v-model.trim="name"
                @blur="$v.name.$touch"
                :state="$v.name.$dirty ? $v.name.required : null"
              />
            </b-form-group>
            <b-form-group
              label="Email"
              label-for="email"
              :invalid-feedback="
                !$v.email.required
                  ? 'Email не должен быть пустым'
                  : 'Некорректный Email'
              "
              :state="
                $v.email.$dirty ? $v.email.required && $v.email.email : null
              "
            >
              <b-form-input
                id="email"
                v-model.trim="email"
                @blur="$v.email.$touch"
                :state="
                  $v.email.$dirty ? $v.email.required && $v.email.email : null
                "
              />
            </b-form-group>
            <b-form-group
              label="Телефон"
              label-for="phone"
              :invalid-feedback="
                !$v.phone.required
                  ? 'Номер телефона не должен быть пустым'
                  : 'Некорректный номер телефона'
              "
              :state="
                $v.phone.$dirty
                  ? $v.phone.required &&
                    $v.phone.minLength &&
                    $v.phone.maxLength
                  : null
              "
            >
              <b-form-input
                id="phone"
                v-model.trim="phone"
                v-mask="'+7 (###) ###-##-##'"
                @blur="$v.phone.$touch"
                :state="
                  $v.phone.$dirty
                    ? $v.phone.required &&
                      $v.phone.minLength &&
                      $v.phone.maxLength
                    : null
                "
              />
            </b-form-group>
            <b-form-group
              label="Старый пароль"
              label-for="oldPassword"
              invalid-feedback="Пароль не должен быть пустым"
              :state="
                !oldPassword && !newPassword
                  ? null
                  : $v.oldPassword.$dirty || $v.newPassword.$dirty
                  ? $v.oldPassword.required
                  : null
              "
            >
              <b-form-input
                id="oldPassword"
                type="password"
                v-model.trim="oldPassword"
                @change="$v.oldPassword.$touch"
                :state="
                  !oldPassword && !newPassword
                    ? null
                    : $v.oldPassword.$dirty || $v.newPassword.$dirty
                    ? $v.oldPassword.required
                    : null
                "
              />
            </b-form-group>
            <b-form-group
              label="Новый пароль"
              label-for="newPassword"
              :invalid-feedback="
                !$v.newPassword.minLength
                  ? `Пароль должен содержать не менее ${$v.newPassword.$params.minLength.min} символов`
                  : !$v.newPassword.sameAs
                  ? 'Новый пароль должен отличаться от старого'
                  : 'Пароль не должен быть пустым'
              "
              :state="
                !oldPassword && !newPassword
                  ? null
                  : $v.oldPassword.$dirty || $v.newPassword.$dirty
                  ? $v.newPassword.required &&
                    $v.newPassword.minLength &&
                    $v.newPassword.sameAs
                  : null
              "
            >
              <b-form-input
                id="newPassword"
                type="password"
                v-model.trim="newPassword"
                @change="$v.newPassword.$touch"
                :state="
                  !oldPassword && !newPassword
                    ? null
                    : $v.oldPassword.$dirty || $v.newPassword.$dirty
                    ? $v.newPassword.required &&
                      $v.newPassword.minLength &&
                      $v.newPassword.sameAs
                    : null
                "
              />
            </b-form-group>
            <b-button type="submit" :disabled="$v.$invalid" block>
              Сохранить
            </b-button>
          </b-form>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { email, required, requiredUnless, minLength, maxLength, sameAs, not } from 'vuelidate/lib/validators'
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'Profile',
  data: () => ({
    name: '',
    email: '',
    phone: '',
    oldPassword: '',
    newPassword: ''
  }),
  computed: {
    ...mapGetters(['user'])
  },
  watch: {
    phone(number) {
      if (number) {
        let phone = number
        if (phone[0] === '8') {
          phone = phone.replace('8', '+7')
        }
        if ((phone.replace(/[^0-9]+/g, '') === '789') || (phone.replace(/[^0-9]+/g, '') === '779')) {
          phone = '+79'
        }
        this.phone = phone
      }
    }
  },
  mounted() {
    this.name = this.user.name
    this.email = this.user.email
    this.phone = this.user.phone
  },
  validations: {
    name: { required },
    email: { required, email },
    phone: { required, minLength: minLength(18), maxLength: maxLength(18) },
    oldPassword: {
      required: requiredUnless(function () { return (!!this.newPassword === !!this.oldPassword) })
    },
    newPassword: {
      required: requiredUnless(function () { return (!!this.newPassword === !!this.oldPassword) }),
      minLength: minLength(6),
      sameAs: not(sameAs(function () { return this.oldPassword }))
    }
  },
  methods: {
    ...mapActions(['updateProfile']),
    async submit() {
      if (!this.$v.$invalid) {
        const form = {
          name: this.name,
          email: this.email,
          phone: this.phone,
          oldPassword: this.oldPassword,
          newPassword: this.newPassword
        }
        await this.updateProfile(form)
        this.$v.$reset()
      }
    }
  }
}
</script>