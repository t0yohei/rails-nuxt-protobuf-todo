<template>
  <div>
    <table class="simple-table">
      <tr>
        <th>id</th>
        <th>title</th>
      </tr>
      <tr v-for="task in tasks" :key="task.id">
        <td>{{ task.id }}</td>
        <td>{{ task.title }}</td>
      </tr>
    </table>

    {{ ip }}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      tasks: [{ id: 0, title: '' }],
      ip: ''
    }
  },

  created(): void {
    this.tasks = this.fetchTasks()
  },

  methods: {
    fetchTasks(): { id: number; title: string }[] {
      return [{ id: 1, title: 'test1' }, { id: 2, title: 'test2' }]
    },
    async fetchSomething() {
      const ip = await this.$axios.$get('http://icanhazip.com')
      this.ip = ip
    }
  }
})
</script>

<style scoped>
.simple-table {
  border: 1px solid gray;
}
.simple-table th,
.simple-table td {
  border: 1px solid gray;
}
</style>
