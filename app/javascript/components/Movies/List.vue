<template>
    <div>
        <div>
            <input type="search" class="input is-light" placeholder="Search by name" />                                
        </div>
        <br>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Filmes</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="">
                            
                        </div>
                        <div>
                            <ul class="list">
                                <li class="card" @click="showMovie(movie.id)" v-for="movie in movies" :key="movie.name">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + movie.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{movie.title}}</h3>
                                        </a> 
                                    </div>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{movie.vote_average}}</p>
                                    </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
    export default {
        name: 'List',
        data(){
            return{
                movies: [],
                img: '',
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            axios.get('https://api.themoviedb.org/3/movie/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1').then(response => {
                this.movies = response.data.results, 
                console.log(response.data.results) 
            }),
            this.img = "https://image.tmdb.org/t/p/w500"
            
        },
        methods:{
            showMovie: function (id) {
                window.location = '/movies/' + id
            }        
        }
    }
</script>
<style>
.list{
    cursor: pointer;
    margin-top: 20px;
    list-style: none;
}
.list li:hover{
    transition: 0.5s;
    transform: scale(1.03);
}
.img{
    width: 72px;
    height: auto;
}
.list li{
    list-style: none;
}
</style>