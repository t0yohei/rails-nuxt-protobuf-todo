<template>
  <div>
    <table class="simple-table">
      <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>edit</th>
        <th>delete</th>
      </tr>
      <tr v-for="task in tasks.getTaskList()" :key="task.getId()">
        <td>{{ task.getId() }}</td>
        <td class="task-title">{{ task.getTitle() }}</td>
        <td class="task-description">{{ task.getDescription() }}</td>
        <td class="button-td">
          <nuxt-link
            :to="{ name: 'tasksProto-id', params: { id: task.getId() } }"
            >編集</nuxt-link
          >
          <button class="edit-task-button task-button">
            編集
          </button>
        </td>
        <td class="button-td">
          <button
            class="delete-task-button task-button"
            @click="deleteTask(task.getId())"
          >
            削除
          </button>
        </td>
      </tr>
    </table>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Tasks } from '../../plugins/proto/task_pb'

export default Vue.extend({
  props: {
    tasks: {
      type: Tasks,
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
.task-description {
  width: 500px;
}
.button-td {
  text-align: center;
}
.task-button {
  margin: 2px;
}
.edit-task-button {
  background: paleturquoise;
}
.delete-task-button {
  background: pink;
}
</style>
