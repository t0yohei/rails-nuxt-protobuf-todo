<template>
  <div>
    {{ tasks.getId() }}
    {{ tasks.getTitle() }}
    <!-- <edit-tasks-form
      :tasks="tasks"
      @delete-task-clicked="deleteTask"
    ></edit-tasks-form>
    <new-task-form @add-task-clicked="addTask"></new-task-form> -->
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Task } from '../plugins/proto/task_pb'
// import EditTasksForm from './tasks/EditTasksForm.vue'
// import NewTaskForm from './tasks/NewTaskForm.vue'

export default Vue.extend({
  components: {
    // EditTasksForm,
    // NewTaskForm
  },

  data() {
    return {
      tasks: new Task()
    }
  },

  created(): void {
    this.fetchTasks()
  },

  methods: {
    async fetchTasks() {
      const res = await this.$axios.$get('proto/tasks', {
        responseType: 'arraybuffer'
      })
      const task = Task.deserializeBinary(res)
      this.tasks = task
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
