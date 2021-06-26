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
                            <ul class="list">
                                <li @click="showMovie(favorite.external_id, 'movies')" class="card" v-for="favorite in movies" :key="favorite">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + favorite.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{favorite.name}}</h3>
                                        </a>
                                        <br>
                                        <p maxlength="100" >{{favorite.overview}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{favorite.vote_average}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <button @click="deleteFavorite(favorite.id)" class="button is-danger"><i class="fas fa-times"></i></i></button>
                                    </div>
                                    </div>
                                </li>
                            </ul>
                            <ul class="list">
                                <li @click="showMovie(favorite.external_id, 'series')" class="card" v-for="favorite in series" :key="favorite">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + favorite.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{favorite.name}}</h3>
                                        </a>
                                        <br>
                                        <p maxlength="100" >{{favorite.overview}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{favorite.vote_average}}</p>
                                    </div>
                                    <br>
                                    <div>
                                        <button @click="deleteFavorite(favorite.id)" class="button is-danger"><i class="fas fa-times"></i></i></button>
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
        showMovie: function (external_id, type) {
            window.location = `/${type}/` + external_id
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
