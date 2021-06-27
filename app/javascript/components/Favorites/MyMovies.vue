<<template>
    <div>
        <div>
            <input v-model="search" type="search" class="input is-light" placeholder="Search by title" />                                
        </div>
        <br>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Minha lista</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="list">
                                <div class="card list-item" @click="showMovie(movie.external_id, 'movies')" v-for="movie in movies" :key="movie.name">
                                    <img class="img" :src="img + movie.poster_path">
                                    <div class="card-wrapper">
                                        <div class="card-content">
                                            <a class="card">
                                                <h3>{{movie.name}}</h3>
                                                <p class="subtitle-6 data">{{movie.release_date}}</p>
                                            </a>
                                            <p class="card-description">{{verifyTextOverview(movie.overview)}}</p>
                                        </div>
										<div class="card-actions">
											<p><i class="fas fa-star"></i>{{movie.vote_average}}</p>
											<button id="favIcon" class="button is-danger card-actions--favorite" @click="deleteFavorite(movie.id)"><i class="fas fa-times"></i></i></button>
										</div>
                                    </div>
                                </div>
                            </div>
                            <div class="list">
                                <div class="card list-item" @click="showMovie(serie.external_id, 'series')" v-for="serie in series" :key="serie.name">
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
											<button id="favIcon" class="button is-danger card-actions--favorite" @click="deleteFavorite(serie.id)"><i class="fas fa-times"></i></i></button>
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

    name: 'Favorites',
    data(){
        return{
            movies: [],
            series: [],
            img: '',
            search: '',
            external_id: '',
            favorite: ''
        }
    },
    props: {
        data: {
            type: Array
        }
    },

    mounted() {
        console.log("aqui",this.data)
        this.movies = this.data[0]
        this.series = this.data[1]
        this.img = "https://image.tmdb.org/t/p/w500"
        this.external_id = this.data.external_id
        console.log("aqui",this.external_id)
    },
    methods: {
        showList(event){
            window.location = '/'
        },
        getFavorites(name) {
                axios.get('/api/v1/favorites?filter=' + name + '&fields=id,name,overview,vote_average,popularity')
                .then(response => {
                this.favorites = response.data
                })
        },
        showMovie(external_id, type) {
            window.location = `/${type}/` + external_id
        },
        deleteFavorite(id){
                axios.delete('/api/v1/favorites/' + id)
                .then(response => {window.location = '/favorites', console.log(response) })
        },
        verifyTextOverview(description){ 
                if (description.length >= 200)
                    return description.substring(0, 200) + "..."
                else 
                    return description
                end          
        },
    },
    watch:{
        search: function(val, oldVal) {
            if(val.length > 2) {
                this.getFavorites(val)
            }
        }
    }
}
</script>
