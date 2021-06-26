
<template>
    <ul class="menu">
        <li class="menu-item">
        <div class="menu-link">
            <p class="title is-2">Filmes, séries e muito mais!</p>
        </div>
        </li>
        <hr>
        <li class="menu-item">
        <a class="menu-link" @click="showPeoples">
            <p class="title is-2"><i class="far fa-user"></i> Pessoas</p>
        </a>
        </li>
        <li class="menu-item">
        <a class="menu-link" @click="showMovies">
            <p class="title is-2">Filmes    <i class="fas fa-film"></i></p>
        </a>
        </li>
        <li class="menu-item">
        <a class="menu-link" @click="showSeries">
            <p class="title is-2">Series    <i class="fas fa-tv"></i></p>
        </a>
        </li>
        <li class="menu-item">
        <a class="menu-link" @click="showFavorites">
            <p class="title is-2">Minha lista   <i class="fas fa-list-ul"></i></p>
        </a>
        </li>
    </ul>
</template>

<script>
export default {
  name: 'MenuLinks',
  methods: {
        showPeoples: function (event){
            window.location = '/peoples'
        },
        showMovies: function (event){
            window.location = '/'
        },
        showSeries: function (event){
            window.location = '/series'
        },
        showFavorites: function (event){
            window.location = '/favorites'
        },    
  }
}
</script>
<style>
.menu li p{
    color: rgb(255, 255, 255);
}
.menu-link{
    margin-top: 10px;
}
</style>