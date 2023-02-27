<template lang="pug">
.loading-page(v-if="loading")
  .spinner
    .bounce1
    .bounce2
    .bounce3
</template>

<script setup>
const { loading } = useLoad();
</script>

<style lang="sass" scoped>
.loading-page
  display: flex
  justify-content: center
  align-items: center
  width: 100%
  height: 100%
  background: rgba(255, 255, 255, 0.5)
  font-family: sans-serif
  position: fixed
  top: 0
  left: 0
  z-index: 1000
  &.fadeout
    animation: loading-fadeout 0.5s
    animation-fill-mode: both
  .spinner
    margin: 0 auto
    text-align: center
    div
      display: inline-block
      width: 24px
      height: 24px
      background-color: $main
      border-radius: 50%
      margin: 0 5px
      animation: sk-bounce-delay 1.4s infinite ease-in-out both
    .bounce1
      animation-delay: -0.32s
    .bounce2
      animation-delay: -0.16s
@keyframes loading-fadeout
  0%
    opacity: 1
  100%
    opacity: 0
@keyframes sk-bounce-delay
  0%, 80%, 100%
    transform: scale(0)
  40%
    transform: scale(1)
</style>
