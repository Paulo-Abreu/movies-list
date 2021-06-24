
<template>
    <ul class="menu">
        <li class="menu-item">
        <a class="menu-link">
            <p class="title is-2">Filmes, séries e muito mais!</p>
        </a>
        </li>
        <hr>
        <li class="menu-item">
        <a class="menu-link" @click="showPeoples">
            <p class="title is-2">Pessoas</p>
        </a>
        </li>
        <li class="menu-item">
        <a class="menu-link" @click="showMovies">
            <p class="title is-2">Filmes</p>
        </a>
        </li>
    </ul>
</template>

<script>
export default {
  name: 'MenuLinks',
  methods: {
      showPeoples: function (envent){
          window.location = '/peoples'
      },
      showMovies: function (envent){
          window.location = '/'
      }
  }
}
</script>
<style>
.menu li p{
    color: rgb(255, 255, 255);
}

</style>