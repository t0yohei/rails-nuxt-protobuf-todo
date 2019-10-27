<template>
  <div>
    {{ task }}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Task } from '../../plugins/proto/task_pb'

export default Vue.extend({
  data() {
    return {
      task: new Task()
    }
  },

  created() {
    const task = new Task()
    task.setId(1)
    task.setTitle('title')
    this.task = task
  }
})
</script>

<style scoped></style>
