<template>
  <div>
    <input
      v-model="newTaskTitle"
      placeholder="新規タスク"
      class="new-task-title-input"
    />
    <button class="add-task-button" @click="addTask()">追加</button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      newTaskTitle: ''
    }
  },

  methods: {
    addTask() {
      if (this.newTaskTitle === '') {
        return
      }
      this.$emit('add-task-clicked', this.newTaskTitle)
      this.newTaskTitle = ''
    }
  }
})
</script>

<style scoped>
.new-task-title-input,
.add-task-button {
  margin: 10px;
  padding: 10px;
}
</style>
