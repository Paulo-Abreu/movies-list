class HomeController < ApplicationController
    def index
        @props = {
            component_name: 'list'
        }
    end
end