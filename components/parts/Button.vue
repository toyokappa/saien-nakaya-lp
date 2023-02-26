<template lang="pug">
a.button(v-if="outside" :style="buttonStyles" target="_blank" rel="noopener")
  slot
  img(src="@/assets/images/vector-right.svg")
nuxt-link.button(v-else :style="buttonStyles")
  slot
  img(src="@/assets/images/vector-right.svg")
</template>

<script setup lang="ts">
interface Props {
  color?: string;
  outside?: boolean;
}

const props = withDefaults(defineProps<Props>(), {
  color: "black",
  inside: false,
});

const buttonStyles = computed(() => {
  let styles;
  switch (props.color) {
    case "black":
      styles = { color: "white", backgroundColor: "#272727" };
      break;
    case "white":
      styles = {
        color: "black",
        backgroundColor: "white",
        border: "1px solid black",
      };
      break;
    default:
      styles = { color: "white", backgroundColor: "#272727" };
  }
  return styles;
});
</script>

<style lang="sass" scoped>
.button
  display: flex
  justify-content: space-between
  align-items: center
  font-family: $accent-family
  font-weight: bold
  text-align: center
  text-decoration: none
  width: 100%
  padding: 10px 20px
  img
    height: 24px
    width: auto
</style>
