class FavoritesController < ApplicationController
    before_action :view_movie,:view_serie, only: %i[ show  ]  

    def index
        movies = current_user.favorites.map {|f| f.movie }.compact
        series = current_user.favorites.map { |f| f.serie }.compact
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
end 