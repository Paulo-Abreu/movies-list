
<template>
    <ul class="menu">
        <li class="menu-item">
        <a class="menu-link">
            <p class="title is-2">Filmes, séries e muito mais!</p>
        </a>
        </li>
        <li class="menu-item">
        <a class="menu-link" @click="showSeries">
            <p class="title is-2">Séries</p>
        </a>
        </li>
    </ul>
</template>

<script>
export default {
  name: 'MenuLinks',
  methods: {
      showSeries: function (envent){
          window.location = '/series'
      }
  }
}
</script>
<style>
.menu li p{
    color: rgb(255, 255, 255);
}

</style>