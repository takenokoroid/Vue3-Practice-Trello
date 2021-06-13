<template>
  <div>
    <input type="text" v-model="todoRef" />
    <button @click="add">登録</button>
  </div>
</template>

<script>
import { defineComponent, ref } from "vue";
export default defineComponent({
  name: "TodoInput",
  setup(props, context) {
    const todoRef = ref("");

    const add = () => {
      context.emit("add-todo", todoRef.value);
      todoRef.value = "";
    };

    return { add, todoRef };
  },
});
</script>

<style></style>
