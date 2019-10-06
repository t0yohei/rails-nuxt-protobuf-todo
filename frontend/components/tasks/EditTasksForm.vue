<template>
  <div>
    <table class="simple-table">
      <tr>
        <th>id</th>
        <th>title</th>
      </tr>
      <tr v-for="task in tasks" :key="task.id">
        <td>{{ task.id }}</td>
        <td class="task-title">{{ task.title }}</td>
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
</style>
