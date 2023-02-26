<template lang="pug">
header
  nuxt-link.logo(to="/")
    img(src="@/assets/images/logo.png")
</template>

<style lang="sass" scoped>
header
  width: 100%
  background-color: $white
  border-bottom: 1px solid $grey
  border-top: 5px solid $main
  padding: $block-padding
  display: flex
  align-items: center
  justify-content: flex-start
  .logo
    img
      height: 40px
      width: auto
</style>
