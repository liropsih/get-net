<template>
  <b-container v-if="!loading">
    <b-row class="mb-5">
      <b-col sm="12" md="6" lg="4">
        <b-card header="Баланс">
          <b-card-title> {{ `${user.balance}₽` }} </b-card-title>
          <b-card-text>Актуально на сегодня в {{ time }}</b-card-text>
          <b-button class="mr-3" :to="{ name: 'History' }">История</b-button>
          <b-button @click="payModal = !payModal">Пополнить</b-button>
          <b-modal v-model="payModal" title="Пополнение баланса" hide-footer>
            <b-form-group label="Сумма (₽)" label-for="pay">
              <b-form-input id="pay" type="number" v-model.trim="pay" />
            </b-form-group>
            <b-button @click="addPay(pay)" :disabled="pay <= 0">
              Оплатить
            </b-button>
          </b-modal>
        </b-card>
      </b-col>
      <b-col sm="12" md="6" lg="8">
        <b-card header="Тарифный план">
          <b-card-title> {{ user.tariff.title }} </b-card-title>
          <b-card-text>{{
            `Скорость: ${user.tariff.speed} мбит/с, Стоимость: ${user.tariff.price} ₽/мес`
          }}</b-card-text>
          <b-button @click="tariffModal = !tariffModal">Сменить</b-button>
          <b-modal
            v-model="tariffModal"
            title="Смена тарифного плана"
            hide-footer
          >
            <b-form-group label="Выбор тарифного плана" label-for="tariffs">
              <b-form-select id="tariffs" v-model="user.tariffId">
                <b-form-select-option
                  v-for="tariff in tariffs"
                  :key="tariff.id"
                  :value="tariff.id"
                >
                  {{
                    `Скорость: ${tariff.speed} мбит/с, Стоимость: ${tariff.price} ₽`
                  }}
                </b-form-select-option>
              </b-form-select>
            </b-form-group>
            <b-button @click="updateTariff(user.tariffId)">Сменить</b-button>
          </b-modal>
        </b-card>
      </b-col>
    </b-row>
    <b-row class="mb-5">
      <b-col sm="12">
        <b-card class="card-list" header="Подключенные услуги">
          <b-list-group flush>
            <b-list-group-item v-if="!user.additionals.length">
              <b-card-text>Нет подключенных услуг</b-card-text>
            </b-list-group-item>
            <b-list-group-item
              v-for="service in user.additionals"
              :key="service.id"
            >
              <b-row>
                <b-col cols="auto" class="mr-auto">
                  <b-card-title>{{ service.title }}</b-card-title>
                  <b-card-sub-title>{{
                    `${service.price}₽/мес`
                  }}</b-card-sub-title>
                  <b-card-text>{{ service.description }}</b-card-text>
                </b-col>
                <b-col cols="auto align-self-center">
                  <b-button @click.prevent="removeAdditional(service.id)">
                    Отключить
                  </b-button>
                </b-col>
              </b-row>
            </b-list-group-item>
          </b-list-group>
        </b-card>
      </b-col>
    </b-row>
    <b-row class="mb-2">
      <b-col
        sm="12"
        md="6"
        lg="4"
        class="mb-3"
        v-for="service in additional"
        :key="service.id"
      >
        <b-card :header="service.title">
          <b-card-text>{{ service.description }}</b-card-text>
          <b-button
            @click.prevent="addAdditional(service.id)"
            :disabled="!!user.additionals.find((s) => s.id == service.id)"
          >
            {{
              !user.additionals.find((s) => s.id == service.id)
                ? `Подключить за ${service.price}₽/мес`
                : "Подключено"
            }}
          </b-button>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'Home',
  data: () => ({
    loading: true,
    payModal: false,
    tariffModal: false,
    pay: 0
  }),
  computed: {
    ...mapGetters(['user', 'additional', 'tariffs']),
    time: () => (new Date().toLocaleTimeString().slice(0, -3))
  },
  async mounted() {
    await this.getAdditional()
    await this.getTariffs()
    this.loading = false
  },
  methods: {
    ...mapActions([
      'addPay',
      'getAdditional',
      'addAdditional',
      'removeAdditional',
      'getTariffs',
      'updateTariff'
    ])
  }
}
</script>
