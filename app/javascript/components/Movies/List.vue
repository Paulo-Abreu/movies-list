<template>
    <div>
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Filmes</h4>
                                </div>
                                <div>
                                    <input type="search" class="input is-light" placeholder="Search by name" />                                
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="card">
                            <table class="table is-striped">
                                <tbody>
                                    <tr v-for="movie in movies" :key="movie.name">
                                        <td><img :src="img + movie.poster_path"></td>
                                        <td @click="showMovie(movie.id)"><h3>{{movie.title}}</h3></td>
                                        <br>
                                        <td><p><i class="fas fa-star"></i>{{movie.vote_average}}</p></td>
                                    </tr>
                                </tbody>
                            </table>

                            </div>
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
                img: ''
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
            })
            this.img = "https://image.tmdb.org/t/p/w500" 
        },
        methods:{
            showMovie: function (id) {
                window.location = '/movie/' + id
            }        
            }
    }
</script>
<style>
.table td{
    cursor: pointer;
    padding-top: 15px;
}
.table img{
    width: 72px;
}
</style>