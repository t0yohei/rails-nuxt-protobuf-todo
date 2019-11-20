<template>
  <div>
    <input
      v-model="newTaskTitle"
      placeholder="新規タスク"
      class="new-task-title-input"
    />
    <input
      v-model="newTaskDescription"
      placeholder="詳細"
      class="new-task-description-input"
    />
    <button class="add-task-button" @click="addTask()">追加</button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      newTaskTitle: '',
      newTaskDescription: ''
    }
  },

  methods: {
    addTask(): void {
      if (this.newTaskTitle === '') {
        return
      }
      this.$emit('add-task-clicked', this.newTaskTitle, this.newTaskDescription)
      this.newTaskTitle = ''
      this.newTaskDescription = ''
    }
  }
})
</script>

<style scoped>
.new-task-title-input {
  margin: 10px;
  padding: 10px;
  width: 200px;
}
.new-task-description-input {
  margin: 10px;
  padding: 10px;
  width: 400px;
}
.add-task-button {
  margin: 10px;
  padding: 10px;
  width: 100px;
}
</style>
