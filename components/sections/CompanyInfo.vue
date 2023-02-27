<template lang="pug">
section.section.bg-base
  h2.t-center.f-24.mb-3 事業所
  .container
    .content.mb-2
      .mb-2
        strong 住所
        p 〒371-0221
        p 群馬県前橋市樋越町245-2 A-103
  .map.eyecatch
    iframe(src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1220.9849598912358!2d139.17353334292463!3d36.41587026046461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x601ef0460b83e9b5%3A0xd8d9ba8387ea092e!2z44CSMzcxLTAyMjEg576k6aas55yM5YmN5qmL5biC5qiL6LaK55S6IOODouODquODj-OCpOODhOWkp-iDoSBB!5e0!3m2!1sja!2sjp!4v1677389703465!5m2!1sja!2sjp" width="100%" height="100%" title="map" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade")
</template>

<style lang="sass" scoped>
.map
  @include pc
    width: 100%
    max-width: 992px
    margin: 0 auto
</style>
