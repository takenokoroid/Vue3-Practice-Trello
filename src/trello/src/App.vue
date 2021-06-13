<template>
  <div>
    <TrelloHome></TrelloHome>
  </div>
</template>

<script>
import TrelloHome from "./components/TrelloHome.vue";

export default {
  name: "App",
  components: {
    TrelloHome,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
