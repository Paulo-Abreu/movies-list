<template>
    <div class="card">
        <div class="card-content">
            <div class="media">
                <div class="media-left">
                </div>
                <div class="media-content">
                    <h2>{{serie.name}}</h2>
                    <p id="date">{{serie.first_air_date}}</p>
                    <h4>Created by:</h4>
                    <img :src="img + serie.created_by[0].profile_path">
                    <br>
                    <p>{{this.serie.created_by[0].name}}</p>
                    <br>
                    <h4>Overview:</h4>
                    <p>{{this.serie.overview}}</p>
                    <br>
                    <img :src="img + serie.poster_path">
                    <br>
                    <br>
                    <h6>Popularity:</h6>
                    <p id="popularity">{{serie.popularity}}</p>
                    <br>
                    <h6>Rate:</h6>
                    <p id="popularity"><i class="fas fa-star"></i> {{serie.vote_average}}</p>
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
        name: 'ShowSerie',
        data(){
            return{
                serie: [],
                img: ''
            }
        },
        props:{
            data:{
                type: Array
            }
        },
        mounted(){
            axios.get('https://api.themoviedb.org/3/tv/' + this.data + '?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US').then(response => {
                console.log("here",response) 
                this.serie = response.data
                this.img = "https://image.tmdb.org/t/p/w500"
            }) 
            console.log("data",this.data)
        },

        methods: {
            
            ShowList: function (event) {
                window.location = '/series'
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
    font-style: italic;
    font-size: small;
}
</style>
