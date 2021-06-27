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
                                    <img class="img" :src="img + serie.poster_path">
                                    <div class="card-wrapper">
                                        <div class="card-content">
                                            <a class="card">
                                                <h3>{{serie.name}}</h3>
                                                <p class="subtitle-6 data">{{serie.release_date}}</p>
                                            </a>
                                            <p class="card-description">{{verifyTextOverview(serie.overview)}}</p>
                                        </div>
										<div class="card-actions">
											<p><i class="fas fa-star"></i>{{serie.vote_average}}</p>
											<button id="favIcon" class="button is-light card-actions--favorite" @click="addFavorite(serie)"><i class="fas fa-star"></i></button>
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
            .then(response => { alert(serie.name + ' Foi adicionado a minha lista!'),console.log(response) })  
         },
        verifyTextOverview(description){
            if (description.length  >= 200)
                return description.substring(0, 200) + "..."
            else  return description
        }
    },
}
</script>
