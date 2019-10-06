<template>
  <div>
    <edit-tasks-form :tasks="tasks"></edit-tasks-form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import EditTasksForm from './EditTasksForm.vue'

export default Vue.extend({
  components: {
    EditTasksForm
  },

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

<style scoped></style>
