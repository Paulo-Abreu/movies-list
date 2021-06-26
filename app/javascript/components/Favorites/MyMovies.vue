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
                                <div @click="showMovie(favorite.external_id, 'movies')" class="card list-item" v-for="favorite in movies" :key="favorite">
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
                                </div>
                            </div>
                            <div class="list">
                                <div @click="showMovie(favorite.external_id, 'series')" class="card list-item" v-for="favorite in series" :key="favorite">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + favorite.poster_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{favorite.name}}</h3>
                                        </a>
                                        <br>
                                        <p maxlength="100" >{{verifyTextOverview(favorite.overview)}}</p>
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
                if (description.length >= 300)
                    return description.substring(0, 300) + "..."
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
</style>
