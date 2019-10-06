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
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      tasks: [{ id: 0, title: '' }]
    }
  },

  created(): void {
    this.fetchTasks()
  },

  methods: {
    async fetchTasks() {
      const tasks = await this.$axios.$get('tasks')
      this.tasks = tasks
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
