<template lang="pug">
section
  img.hero(src="@/assets/images/hero.jpg" alt="トップ画像" width="100%" height="60%")
  .container
    .content.t-center
      h1.logo.mb-2
        img.mb-1(src="@/assets/images/logo.png" alt="彩園なかや" width="120" height="96")
        .f-24 彩園なかや
      .concept.mb-3
        p 愛され農業
      PartsButton(to="/owner") 代表/中屋 智博について
      a.note-btn(href="https://note.com/majigachisaien/" target="_blank" rel="noopener")
        | 中屋が綴るnoteはコチラから
</template>

<style lang="sass" scoped>
.hero
  width: 100%
  height: 340px
  object-fit: cover
  object-position: center center
  background-color: $grey
  @include pc
    height: 540px
.content
  padding: 30px 0
  .logo img
    height: 96px
    width: auto
    margin: 0 auto 10px
  .note-btn
    margin-top: 20px
    display: block
    padding: 10px 20px
    border: 1px solid $grey
    border-radius: 5px
    color: inherit
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2)
    &:hover
      background-color: $grey
      color: $white
</style>
