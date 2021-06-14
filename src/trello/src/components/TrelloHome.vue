<template>
  <div id="app">
    <div id="trello-header" class="text-start p-3 mt-3">
      <h1>Trello風タスク管理</h1>
    </div>
    <div id="trello-content" class="d-flex flex-wrap">
      <div
        v-for="(category, index) in displayCategories"
        :key="index"
        style="min-width:400px"
        @dragover="dragOverCategory(category)"
      >
        <div class="bg-primary rounded-3 text-white m-2 p-2">
          <div class="text-start fw-bold">{{ category.name }}</div>
          <div
            v-for="(task, index) in category.tasks"
            :key="index"
            class="bg-white text-start text-dark m-2 p-2"
            draggable="true"
            @dragstart="dragTask(task)"
            @dragover="dragOverTask(task)"
          >
            {{ task.name }}
          </div>
          <addTask @task-added="taskAdd" :category_id="category.id"></addTask>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import addTask from "./addTask.vue";
import { defineComponent, reactive, computed } from "vue";
export default defineComponent({
  name: "TrelloHome",
  components: { addTask },
  setup() {
    // datas
    const state = reactive({
      categories: [
        {
          id: 1,
          name: "Do",
          collapsed: false,
        },
        {
          id: 2,
          name: "Doing",
          collapsed: false,
        },
        {
          id: 3,
          name: "Done",
          collapsed: false,
        },
      ],
      tasks: [
        {
          id: 1,
          category_id: 1,
          name: "味ポン食べ食べ委員会会議資料作成",
          start_date: "2020-12-18",
          end_date: "2020-12-20",
          incharge_user: "鈴木",
          percentage: 100,
        },
        {
          id: 2,
          category_id: 1,
          name: "洗濯",
          start_date: "2020-12-19",
          end_date: "2020-12-23",
          incharge_user: "佐藤",
          percentage: 90,
        },
        {
          id: 3,
          category_id: 3,
          name: "原神デイリー",
          start_date: "2020-12-19",
          end_date: "2020-12-21",
          incharge_user: "鈴木",
          percentage: 40,
        },
        {
          id: 4,
          category_id: 2,
          name: "Vue3 Composition API調査",
          start_date: "2020-12-21",
          end_date: "2020-12-30",
          incharge_user: "山下",
          percentage: 60,
        },
        {
          id: 5,
          category_id: 2,
          name: "味ポン食べ食べ委員会用買い出し",
          start_date: "2020-12-20",
          end_date: "2020-12-22",
          incharge_user: "佐藤",
          percentage: 5,
        },
        {
          id: 6,
          category_id: 1,
          name: "体温測定",
          start_date: "2020-12-28",
          end_date: "2020-12-08",
          incharge_user: "佐藤",
          percentage: 0,
        },
      ],
      task: "",
    });

    // computeds
    const displayCategories = computed(() => {
      let categories = [];
      let tasks = "";
      state.categories.map((category) => {
        tasks = state.tasks.filter((task) => task.category_id === category.id);
        categories.push({
          id: category.id,
          name: category.name,
          tasks,
        });
      });
      return categories;
    });

    // methods
    const dragOverCategory = (overCategory) => {
      if (state.task.category_id !== overCategory.id) {
        let tasks = state.tasks.filter(
          (task) => task.category_id === overCategory.id
        );
        if (tasks.length === 0) state.task.category_id = overCategory.id;
      }
    };

    const dragTask = (task) => {
      state.task = task;
    };

    const dragOverTask = (overTask) => {
      if (overTask.id !== state.task.id) {
        let deleteIndex;
        let addIndex;
        state.tasks.map((task, index) => {
          if (task.id === state.task.id) deleteIndex = index;
        });
        state.tasks.map((task, index) => {
          if (task.id === overTask.id) addIndex = index;
        });
        state.tasks.splice(deleteIndex, 1);
        state.task.category_id = overTask.category_id;
        state.tasks.splice(addIndex, 0, state.task);
      }
    };

    const taskAdd = (task_name, category_id) => {
      console.log(task_name, category_id);
      state.tasks.push({
        id: Date.now(),
        category_id,
        name: task_name,
      });
    };

    return {
      displayCategories,
      dragTask,
      dragOverTask,
      dragOverCategory,
      taskAdd,
    };
  },
});
</script>

<style></style>
