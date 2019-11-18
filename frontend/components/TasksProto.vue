<template>
  <div>
    <edit-tasks-form
      :tasks="tasks"
      @delete-task-clicked="deleteTask"
    ></edit-tasks-form>
    <new-task-form @add-task-clicked="addTask"></new-task-form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import {
  Tasks,
  FetchTasksResponse,
  CreateTaskRequest,
  CreateTaskResponse
} from '../plugins/proto/task_pb'
import EditTasksForm from './tasks/EditTasksForm.vue'
import NewTaskForm from './tasks/NewTaskForm.vue'

export default Vue.extend({
  components: {
    EditTasksForm,
    NewTaskForm
  },

  data() {
    return {
      tasks: new Tasks()
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
    this.fetchTasks()
  },

  methods: {
    async fetchTasks(): Promise<void> {
      const res = await this.$axios.$get('proto/tasks', this.protoAxiosConfig)
      const fetchTasksResponse = FetchTasksResponse.deserializeBinary(res)
      const tasks = fetchTasksResponse.getTasks()
      if (tasks !== undefined) {
        this.tasks = tasks
      }
    },
    async addTask(newTaskTitle: string): Promise<void> {
      const createTaskReqest = new CreateTaskRequest()
      createTaskReqest.setTitle(newTaskTitle)
      const createTaskReqestEncoded = createTaskReqest.serializeBinary()
      try {
        const res = await this.$axios.$post(
          'proto/tasks',
          createTaskReqestEncoded,
          this.protoAxiosConfig
        )
        const createTaskResponse = CreateTaskResponse.deserializeBinary(res)
        this.showMessage(createTaskResponse)
        this.fetchTasks()
      } catch (error) {
        const createTaskResponse = CreateTaskResponse.deserializeBinary(
          error.response.data
        )
        this.showMessage(createTaskResponse)
      }
    },
    async deleteTask(targetTaskId: string): Promise<void> {
      await this.$axios.$delete(`proto/tasks/${targetTaskId}`)
      this.fetchTasks()
    },
    showMessage(createTaskResponse: CreateTaskResponse): void {
      const status = createTaskResponse.getStatus()
      if (status !== undefined) {
        console.log(status.getMessage())
      }
    }
  }
})
</script>

<style scoped></style>
