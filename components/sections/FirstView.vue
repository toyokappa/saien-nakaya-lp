<template lang="pug">
section
  img.hero(src="@/assets/images/hero.jpg")
  .container
    .content.t-center
      h1.logo.mb-2
        img.mb-1(src="@/assets/images/logo.png")
        .f-24 彩園なかや
      .concept.mb-3
        p 畑を拓き、人を育てる。
      PartsButton(to="/owner") 代表/中屋 智博について
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
</style>
