<template>
  <div>
    <edit-tasks-form
      :tasks="tasks"
      @delete-task-clicked="deleteTask"
    ></edit-tasks-form>
    <new-task-form @add-task-clicked="addTask"></new-task-form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import EditTasksForm from './EditTasksForm.vue'
import NewTaskForm from './NewTaskForm.vue'

export default Vue.extend({
  components: {
    EditTasksForm,
    NewTaskForm
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
    async fetchTasks(): Promise<void> {
      const tasks = await this.$axios.$get('api/tasks')
      this.tasks = tasks
    },
    async addTask(newTaskTitle: string): Promise<void> {
      await this.$axios.$post('api/tasks', {
        title: newTaskTitle
      })
      this.fetchTasks()
    },
    async deleteTask(targetTaskId: string): Promise<void> {
      await this.$axios.$delete(`api/tasks/${targetTaskId}`)
      this.fetchTasks()
    }
  }
})
</script>

<style scoped></style>
