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
    <button
      class="update-task-button task-button task-element"
      @click="updateTask"
    >
      保存
    </button>
    <button
      class="delete-task-button task-button task-element"
      @click="deleteTask"
    >
      削除
    </button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import {
  FetchTaskResponse,
  UpdateTaskRequest,
  UpdateTaskResponse
} from '../plugins/proto/task_pb'

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
    },
    async updateTask(): Promise<void> {
      const updateTaskRequest = new UpdateTaskRequest()
      updateTaskRequest.setTitle(this.task.title)
      updateTaskRequest.setDescription(this.task.description)
      const updateTaskRequestEncoded = updateTaskRequest.serializeBinary()
      try {
        const res = await this.$axios.$patch(
          `proto/tasks/${this.task.id}`,
          updateTaskRequestEncoded,
          this.protoAxiosConfig
        )
        const updateTaskResponse = UpdateTaskResponse.deserializeBinary(res)
        this.showMessage(updateTaskResponse)
        this.$router.push('/tasksProto')
      } catch (error) {
        const res = error.response.data
        const updateTaskResponse = UpdateTaskResponse.deserializeBinary(res)
        this.showMessage(updateTaskResponse)
      }
    },
    async deleteTask(): Promise<void> {
      await this.$axios.$delete(`proto/tasks/${this.task.id}`)
      this.$router.push('/tasksProto')
    },
    showMessage(updateTaskResponse: UpdateTaskResponse): void {
      const status = updateTaskResponse.getStatus()
      if (status !== undefined) {
        console.log(status.getMessage())
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
