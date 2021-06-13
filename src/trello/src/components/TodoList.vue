<template>
  <div>
    <ul class="todoList">
      <li v-for="todo in state.todoList" :key="todo.todo">{{ todo.todo }}</li>
    </ul>
    <todo-input @add-todo="addTodoAction"></todo-input>
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
      todoList: [],
    });

    const addTodoAction = (str) => {
      state.todoList.push({ todo: str });
    };
    return { state, addTodoAction };
  },
});
</script>

<style></style>
