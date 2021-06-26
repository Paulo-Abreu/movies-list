<template>
    <div class="card">
        <div class="card-content">
            <div class="media">
                <div class="media-left">
                </div>
                <div class="media-content">
                    <h2>{{movie.title}}</h2>
                    <p id="date">{{this.movie.release_date}}</p>
                    <br>
                    <h4>Description:</h4>
                    <p>{{this.movie.overview}}</p>
                    <br>
                    <h4>language:</h4>
                    <p>{{this.movie.original_language}}</p>
                    <br>
                    <h4>Type:</h4>
                    <p>{{this.movie.genres[0].name}}, {{this.movie.genres[1].name}}</p>
                    <br>
                    <img :src="img + movie.poster_path"> 
                    <br>                   
                    <br>
                    
                    <h6>Popularity:</h6><p id="popularity">{{this.movie.popularity}}</p>
                    <br>
                    <h6>Rating:</h6><p id="popularity"><i class="fas fa-star"></i> {{this.movie.vote_average}}</p>
                    <br>
                    <button class="button is-info" @click="ShowList">Back</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
    export default{
        name: 'Show',
        data(){
            return{
                movie: [],
                img: ''
            }
        },
        props:{
            data:{
                type: Array
            }
        },
        mounted(){
            axios.get('https://api.themoviedb.org/3/movie/' + this.data + '?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US').then(response => {
                console.log("here",response.data) 
                this.movie = response.data
                this.img = "https://image.tmdb.org/t/p/w500"
            }) 
        },
        methods: {
            
            ShowList: function (event) {
                window.location = '/'
            }
        },
    }
</script>
<style>
.media-content img{
    width: 150px;    
}
#popularity{
    color: rgb(255, 203, 135);
}
#date{
    font-size: small;
    font-style: italic;
}
</style>
