<template>
  <div>
    {{ task.toObject() }}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Task, FetchTaskResponse } from '../plugins/proto/task_pb'

export default Vue.extend({
  // components: {},
  data() {
    return {
      task: new Task()
    }
  },

  computed: {
    protoAxiosConfig(): Object {
      return {
        responseType: 'arraybuffer'
      }
    }
  },
  created(): void {
    this.fetchTask()
  },
  methods: {
    async fetchTask(): Promise<void> {
      const res = await this.$axios.$get(
        `proto/tasks/${this.$route.params.id}`,
        this.protoAxiosConfig
      )
      const fetchTaskResponse = FetchTaskResponse.deserializeBinary(res)
      const task = fetchTaskResponse.getTask()
      if (task !== undefined) {
        this.task = task
      }
    }
  }
})
</script>

<style scoped></style>
