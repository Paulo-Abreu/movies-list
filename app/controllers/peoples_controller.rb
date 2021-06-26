class PeoplesController < ApplicationController
    before_action :view_people, only: %i[ show ]
    def index
        @props = {
            component_name: 'peoples'
        }
    end
    def show
        @props = {
            component_name: 'show_people',
            component_data: [@people]
        }
    end
    private
    
    def view_people
        @people = (params[:id])
    end
end