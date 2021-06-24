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
            component_data: @movie
        }
    end
    private
    
    def view_movie
        @movie = Movie.find(params[:id])
    end
end