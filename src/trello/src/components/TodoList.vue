<template>
  <div>
    <ul class="todoList">
      <li v-for="todo in state.todoList" :key="todo.todo">{{ todo.todo }}</li>
    </ul>
    <todo-input></todo-input>
  </div>
</template>

<script>
import { defineComponent, reactive } from "vue";
import TodoInput from "./TodoInput.vue";
export default defineComponent({
  name: "TodoList",
  components: { TodoInput },

  setup() {
    const state = reactive({
      todoList: [{ todo: "todo1" }, { todo: "todo2" }],
    });
    return { state };
  },
});
</script>

<style></style>
