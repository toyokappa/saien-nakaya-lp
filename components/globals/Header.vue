<template lang="pug">
header
  .container
    .header-nav
      nuxt-link.logo(to="/")
        img(src="@/assets/images/logo.png" alt="彩園なかや" width="50" height="40")
      a.instaicon(href="https://www.instagram.com/saiennakaya/" target="_blank" rel="noopener")
        img(src="@/assets/images/instaicon.svg" alt="彩園なかやインスタグラム" width="30" height="30")
</template>

<style lang="sass" scoped>
header
  width: 100%
  background-color: $white
  border-bottom: 1px solid $grey
  border-top: 5px solid $main
  padding: 13px 0
  .header-nav
    display: flex
    align-items: center
    justify-content: space-between
  .logo
    img
      height: 40px
      width: auto
  .instaicon
    img
      height: 30px
      width: auto
</style>
