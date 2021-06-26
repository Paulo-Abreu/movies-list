class SeriesController < ApplicationController
    before_action :view_serie, only: %i[ show ]
    def index
        @props = {
            component_name: 'series'
        }
    end
    def show
        @props = {
            component_name: 'show_serie',
            component_data: [@serie]
        }
    end
    private
    
    def view_serie
        @serie = (params[:id])
    end
end