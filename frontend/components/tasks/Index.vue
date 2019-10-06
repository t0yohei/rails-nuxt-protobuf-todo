<template>
  <div>
    <edit-tasks-form :tasks="tasks"></edit-tasks-form>
    <input
      v-model="newTaskTitle"
      placeholder="新規タスク"
      class="newTaskTitleInput"
    />
    <button @click="addTask()">追加</button>
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
      tasks: [{ id: 0, title: '' }],
      newTaskTitle: ''
    }
  },

  created(): void {
    this.fetchTasks()
  },

  methods: {
    async fetchTasks() {
      const tasks = await this.$axios.$get('tasks')
      this.tasks = tasks
    },
    async addTask() {
      if (this.newTaskTitle === '') {
        return
      }
      await this.$axios.$post('tasks', {
        title: this.newTaskTitle
      })
      this.newTaskTitle = ''
      this.fetchTasks()
    }
  }
})
</script>

<style scoped>
.newTaskTitleInput {
  margin: 10px;
  padding: 10px;
}
</style>
