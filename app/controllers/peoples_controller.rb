class MoviesController < ApplicationController
    before_action :view_movie, only: %i[ show ]
    def index
        @props = {
            component_name: 'people'
        }
    end
    def show
        @props = {
            component_name: 'show',
            component_data: @people
        }
    end
    private
    
    def view_movie
        @people = (params[:id])
    end
end