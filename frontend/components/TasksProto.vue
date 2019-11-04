<template>
  <div>
    <edit-tasks-form
      :tasks="tasks.toObject().taskList"
      @delete-task-clicked="deleteTask"
    ></edit-tasks-form>
    <new-task-form @add-task-clicked="addTask"></new-task-form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Tasks } from '../plugins/proto/task_pb'
import EditTasksForm from './tasks/EditTasksForm.vue'
import NewTaskForm from './tasks/NewTaskForm.vue'

export default Vue.extend({
  components: {
    EditTasksForm,
    NewTaskForm
  },

  data() {
    return {
      tasks: new Tasks()
    }
  },

  created(): void {
    this.fetchTasks()
  },

  methods: {
    async fetchTasks(): Promise<void> {
      const res = await this.$axios.$get('proto/tasks', {
        responseType: 'arraybuffer'
      })
      const tasks = Tasks.deserializeBinary(res)
      this.tasks = tasks
    },
    async addTask(newTaskTitle: string): Promise<void> {
      await this.$axios.$post('proto/tasks', {
        title: newTaskTitle
      })
      this.fetchTasks()
    },
    async deleteTask(targetTaskId: string): Promise<void> {
      await this.$axios.$delete(`proto/tasks/${targetTaskId}`)
      this.fetchTasks()
    }
  }
})
</script>

<style scoped></style>
