<template>
  <div>
    {{ id }}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
// import { Task } from '../plugins/proto/task_pb'

export default Vue.extend({
  props: {
    id: {
      type: Number,
      required: true
    }
  }
  // components: {
  //   EditTasksForm,
  //   NewTaskForm
  // },
  // data() {
  //   return {
  //     tasks: new Tasks()
  //   }
  // },
  // computed: {
  //   protoAxiosConfig(): Object {
  //     return {
  //       responseType: 'arraybuffer'
  //     }
  //   }
  // },
  // created(): void {
  //   this.fetchTasks()
  // },
  // methods: {
  // }
})
</script>

<style scoped></style>
