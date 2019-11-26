<template>
  <div class="task-proto">
    <div class="task-element">id: {{ task.id }}</div>
    <div class="task-element">
      <label
        >title:
        <input v-model="task.title" class="input-title" placeholder="title" />
      </label>
    </div>
    <div class="task-element">
      <label
        >description:
        <textarea
          v-model="task.description"
          class="input-description"
          placeholder="description"
        />
      </label>
    </div>
    <button class="update-task-button task-button task-element" @click="1 + 1">
      保存
    </button>
    <button class="delete-task-button task-button task-element" @click="1 + 1">
      削除
    </button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { FetchTaskResponse } from '../plugins/proto/task_pb'

export default Vue.extend({
  // components: {},
  data() {
    return {
      task: { id: 0, title: '', description: '' }
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
        this.task = task.toObject()
      }
    }
  }
})
</script>

<style scoped>
.task-proto {
  margin: 10px;
  width: 615px;
}
.task-element {
  margin: 15px;
}
.input-title {
  display: block;
  margin-top: 5px;
  width: 300px;
  height: 30px;
}
.input-description {
  display: block;
  margin-top: 5px;
  width: 600px;
  height: 300px;
}
label {
  display: block;
}
.task-button {
  display: inline-block;
  border-radius: 4px;
  text-decoration: none;
  padding: 10px 30px;
  font-size: 14px;
  color: black;
}
.update-task-button {
  background: paleturquoise;
}
.delete-task-button {
  background: pink;
  float: right;
  margin-right: 0;
}
</style>
