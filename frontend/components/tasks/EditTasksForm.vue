<template>
  <div>
    <table class="simple-table">
      <tr>
        <th>id</th>
        <th>title</th>
        <th>delete</th>
      </tr>
      <tr v-for="task in tasks" :key="task.id">
        <td>{{ task.id }}</td>
        <td class="task-title">{{ task.title }}</td>
        <td class="delete-task-button-td">
          <button class="delete-task-button" @click="deleteTask(task.id)">
            削除
          </button>
        </td>
      </tr>
    </table>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    tasks: {
      type: Array,
      required: true
    }
  },

  methods: {
    deleteTask(taskId: number): void {
      this.$emit('delete-task-clicked', taskId)
    }
  }
})
</script>

<style scoped>
.simple-table {
  border: 1px solid gray;
  margin: 10px;
}
.simple-table th,
.simple-table td {
  border: 1px solid gray;
}
.task-title {
  width: 200px;
}
.delete-task-button-td {
  text-align: center;
}
.delete-task-button {
  margin: 2px;
}
</style>
