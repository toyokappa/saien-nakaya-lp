<template lang="pug">
section
  .hero
  .content.t-center
    .px-2
      h1.logo.mb-2
        img.mb-1(src="@/assets/images/logo.png")
        .f-24 彩園なかや
      .concept.mb-3
        p 畑を拓き、人を育てる。
      PartsButton(to="/") 代表 中屋について
</template>

<style lang="sass" scoped>
.hero
  width: 100%
  height: 340px
  background-color: $grey
.content
  padding: 50px 0
  .logo img
    height: 96px
    width: auto
    margin: 0 auto 10px
</style>
