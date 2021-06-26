<template>
    <div>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Series</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="list">
                                <div class="card list-item" @click="showSerie(serie.id)" v-for="serie in series" :key="serie.name">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + serie.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{serie.name}}</h3>
                                        </a> 
                                    </div>
                                    <div>
                                        <p>{{verifyTextOverview(serie.overview)}}</p>
                                    </div>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{serie.vote_average}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <button class="button is-light" @click="addFavorite(serie)"><i class="fas fa-bookmark"></i></button>
                                    </div>
                                    </div>
                                </div>
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
    name: 'Series',
    data(){
        return{
            series: [],
            img: '',
        }
    },
    props: {
        data: {
            type: Array
        }
    },
    mounted() {
        axios.get('https://api.themoviedb.org/3/tv/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1').then(response => {
            this.series = response.data.results, 
            console.log("here",response.data.results) 
        })
        this.img = "https://image.tmdb.org/t/p/w500"
        
    },
    methods:{
        showList: function (event) {
            window.location = '/' 
        },
        showSerie: function (id) {
            window.location = '/series/' + id 
        },
        addFavorite (serie) {
            axios.post('/api/v1/favorites/series', {serie: serie})
            .then(response => {window.location = '/favorites', console.log(response) })  
         },
        verifyTextOverview(description){
            if (description.length  >= 300)
                return description.substring(0, 300) + "..."
            else 
                return description
            end          
        }
    },
}
</script>
<style>
.list{
    cursor: pointer;
    margin-top: 20px;
    list-style: none;
}
.list .list-item:hover{
    transition: 0.5s;
    transform: scale(1.03);
}
.img{
    width: 72px;
    height: auto;
    left: 0;
    top: 0;
    bottom: 0;
}
.list .list-item{
    list-style: none;
    margin-top: 15px;
    box-shadow: 1px 1px 1px 1px rgb(0 0 0 / 56%), 0 4px 25px 0 rgb(0 0 0 / 12%), 0 8px 10px -5px rgb(0 0 0 / 20%);
    border-radius: 15px;
}
#data{
    font-style: italic;
}
</style>