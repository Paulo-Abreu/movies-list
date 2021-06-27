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
                                    <img class="img" :src="img + movie.poster_path">
                                    <div class="card-wrapper">
                                        <div class="card-content">
                                            <a class="card">
                                                <h3>{{movie.title}}</h3>
                                                <p class="subtitle-6 data">{{movie.release_date}}</p>
                                            </a>
                                            <p class="card-description">{{verifyTextOverview(movie.overview)}}</p>
                                        </div>
										<div class="card-actions">
											<p><i class="fas fa-star"></i>{{movie.vote_average}}</p>
											<button id="favIcon" class="button is-light card-actions--favorite" @click="addFavorite(movie)"><i class="fas fa-star"></i></i></button>
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
import axios from "axios";
export default {
  name: "List",
  data() {
    return {
      movies: [],
      img: "",
    };
  },
  props: {
    data: {
      type: Array,
    },
  },
  mounted() {
    axios
      .get(
        "https://api.themoviedb.org/3/movie/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1"
      )
      .then((response) => {
        (this.movies = response.data.results),
          console.log(response.data.results);
      }),
      (this.img = "https://image.tmdb.org/t/p/w500");
  },
  methods: {
    showMovie(id) {
      window.location = "/movies/" + id;
    },
    addFavorite(movie) {
      axios
        .post("/api/v1/favorites/movies", { movie: movie })
        .then((response) => {
          (alert(movie.title + ' Foi adicionado a minha lista!')), console.log(response);
        });
    },
    verifyTextOverview(description) {
      if (description.length >= 200)
        return description.substring(0, 200) + "...";
      else return description
    },
  },
};
</script>
