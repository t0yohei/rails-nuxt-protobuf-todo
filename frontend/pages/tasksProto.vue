<template>
  <div>
    <TasksProto />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import TasksProto from '../components/TasksProto.vue'

export default Vue.extend({
  components: {
    TasksProto
  }
})
</script>

<style scoped></style>
