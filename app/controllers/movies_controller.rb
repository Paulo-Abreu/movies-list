class MoviesController < ApplicationController
    before_action :view_movie, only: %i[ show ]
    def index
        @props = {
            component_name: 'list'
        }
    end
    def show
        @props = {
            component_name: 'show',
            component_data: [@movie]
        }
    end
    def new
        @props = {
            component_name: 'movies_form',
            component_data: [@movie]
        }
    end
    private
    def movie_params
        params.require(:movie).permit(:title, :overview, :popularity, :vote_average, :poster_path)
    end
    def view_movie
        @movie = (params[:id])
    end
end