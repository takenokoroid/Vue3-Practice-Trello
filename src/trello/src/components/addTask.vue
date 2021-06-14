<template>
  <div
    class="d-flex mx-2 rounded-3 hover"
    v-if="!state.show"
    @click="showInput"
  >
    <span class="p-2">タスクを追加</span>
  </div>
  <div class="mx-2" v-else>
    <div>
      <input
        type="text"
        class="p-2 form-control form-control-sm"
        placeholder="新しいタスク名を入力してください"
        v-model="state.task_name"
        ref="input"
      />
    </div>
    <div class="d-flex m-2">
      <button
        class="px-4 py-2 text-white me-2 fw-bold btn btn-success btn-sm"
        @click="addTask"
      >
        追加
      </button>
      <button
        class="px-4 py-2 text-white  fw-bold btn btn-danger btn-sm"
        @click="closeInput"
      >
        キャンセル
      </button>
    </div>
  </div>
</template>

<script>
import { defineComponent, reactive } from "vue";
export default defineComponent({
  name: "addTask",
  props: {
    category_id: {
      type: Number,
      default: 0,
    },
  },
  setup(props, context) {
    // datas
    const state = reactive({
      show: false,
      task_name: "",
    });

    //methods
    const showInput = () => {
      state.show = true;
    };

    const closeInput = () => {
      state.show = false;
      state.task_name = "";
    };

    const addTask = () => {
      if (state.task_name != "") {
        context.emit("TaskAdded", state.task_name, props.category_id);
        state.show = false;
        state.task_name = "";
      }
    };

    return { state, showInput, closeInput, addTask };
  },
});
</script>

<style>
.hover:hover {
  background-color: #308fe2;
}
</style>
