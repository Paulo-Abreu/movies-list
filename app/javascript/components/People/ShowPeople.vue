<template>
    <div class="card">
        <div class="card-content">
            <div class="media">
                <div class="media-left">
                </div>
                <div class="media-content">
                    <h2>{{people.name}}</h2>
                    <br>
                    <h4><i class="fas fa-book-medical"></i> Biography </h4>
                    <p>{{this.people.biography}}</p>
                    <br>
                    <img :src="img + this.people.profile_path">
                    <br>
                    <br>
                    <h6>Also known as:</h6>
                    <p>{{this.people.also_known_as[0]}}, {{this.people.also_known_as[1]}}</p>
                    <br>
                    <h6><i class="fas fa-map-pin"></i>  Birth place </h6>
                    <p>{{this.people.birthday}}, {{this.people.place_of_birth}}</p>
                    <br>
                    <h6>Popularity:</h6>
                    <p id="popularity">{{this.people.popularity}}</p>
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
        name: 'ShowPeople',
        data(){
            return{
                people: [],
                img: ''
            }
        },
        props:{
            data:{
                type: Array
            }
        },
        mounted(){
            axios.get('https://api.themoviedb.org/3/person/' + this.data + '?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US').then(response => {
                console.log("here",response) 
                this.people = response.data
                this.img = "https://image.tmdb.org/t/p/w500"
            }) 
            console.log("data",this.data)
        },

        methods: {
            
            ShowList: function (event) {
                window.location = '/peoples'
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
</style>
