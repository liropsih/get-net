<template>
  <b-container v-if="!loading">
    <b-row class="mb-5">
      <b-col sm="12" md="12" lg="8" offset-lg="2">
        <b-card header="История платежей">
          <b-list-group id="history" flush>
            <b-list-group-item v-for="pay in pays.rows" :key="pay.id">
              <b-row>
                <b-col cols="auto" class="mr-auto">
                  <b-card-title
                    :class="pay.value > 0 ? 'text-success' : 'text-danger'"
                  >
                    {{ `${pay.value}₽` }}
                  </b-card-title>
                  <b-card-text>
                    {{
                      pay.value > 0
                        ? "Пополнение баланса"
                        : "Списание абонентской платы"
                    }}
                  </b-card-text>
                </b-col>
                <b-col cols="auto align-self-center">
                  <b-card-text>{{ pay.date }}</b-card-text>
                </b-col>
              </b-row>
            </b-list-group-item>
          </b-list-group>
        </b-card>
      </b-col>
    </b-row>
    <b-pagination
    variant="secondary"
      v-if="pays.count > perPage"
      v-model="currentPage"
      :total-rows="pays.count"
      :per-page="perPage"
      aria-controls="history"
      align="center"
    />
  </b-container>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'History',
  data: () => ({
    loading: true,
    perPage: 8,
    currentPage: 1
  }),
  computed: {
    ...mapGetters(['pays'])
  },
  watch: {
    async currentPage(page) {
      await this.getPays({ limit: this.perPage, page })
      window.scroll({
        top: 0,
        behavior: 'smooth'
      })
    }
  },
  async mounted() {
    await this.getPays({ limit: this.perPage, page: this.currentPage })
    this.loading = false
  },
  methods: {
    ...mapActions(['getPays'])
  }
}
</script>