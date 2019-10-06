<template>
  <div>
    <TasksIndex />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import TasksIndex from '../components/tasks/Index.vue'

export default Vue.extend({
  components: {
    TasksIndex
  }
})
</script>

<style scoped></style>
