<<template>
    <div>
        <br>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Filmes</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="list">
                                <div class="card list-item" @click="showMovie(movie.id)" v-for="movie in movies" :key="movie.name">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + movie.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{movie.title}}</h3>
                                            <p id="data" class="subtitle-6">{{movie.release_date}}</p>
                                        </a>
                                        <br>
                                        <p>{{verifyTextOverview(movie.overview)}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{movie.vote_average}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <button class="button is-light" @click="addFavorite(movie)"><i class="fas fa-bookmark"></i></button>
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
            showMovie (id) {
                window.location = '/movies/' + id
            },
            addFavorite (movie) {
                axios.post('/api/v1/favorites/movies', {movie: movie})
                .then(response => {window.location = '/favorites', console.log(response) })  
            },
            verifyTextOverview(description){
                console.log("ZAAAAA",description)
                return description.substring(0, 100) + "..."; 
                
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
}
#data{
    font-style: italic;
}
</style>
