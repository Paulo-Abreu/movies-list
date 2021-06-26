class FavoritesController < ApplicationController
    before_action :view_movie,:view_serie, only: %i[ show  ]  

    def index
        movies = current_user.favorites.map {|f| map_favorite_movie(f) }.compact
        series = current_user.favorites.map { |f| map_favorite_serie(f) }.compact
        @props = {
            component_name: 'favorites',
            component_data: [movies, series]
        }  
    end

    def show
        @props = {
            component_name: 'show_movie',
            component_data: [@favorite]
        }
    end

    private

    def view_movie
        @favorite = (params[:movie])
    end

    def view_serie
        @favorite = (params[:serie]) 
    end

    def map_favorite_movie(favorite)
        return if favorite.movie.nil?
        {
            id: favorite.id,
            name: favorite.movie.name,
            overview: favorite.movie.overview,
            poster_path: favorite.movie.poster_path,
            external_id: favorite.movie.external_id,
            vote_average: favorite.movie.vote_average
        }
    end
    
    def map_favorite_serie(favorite)
        return if favorite.serie.nil?
        {
            id: favorite.id,
            name: favorite.serie.name,
            overview: favorite.serie.overview,
            poster_path: favorite.serie.poster_path,
            external_id: favorite.serie.external_id,
            vote_average: favorite.serie.vote_average
        }
      
    end
      
end 