module Api::V1
    class FavoritesController < Api::BaseController
        before_action :view_movie, :view_serie, :delete_favorite, only: %i[ movies series index destroy ] 

        def movies
            movie = Movie.new(external_id: @movie[:id], name: @movie[:title], overview: @movie[:overview], popularity: @movie[:popularity], poster_path: @movie[:poster_path], vote_average: @movie[:vote_average], user: current_user)
            movie.save!
            favorite = Favorite.new(user: current_user, movie_id: movie.id) 
            if favorite.save                
                render json: favorite, status: 201
            else
                render json: favorite.errors.messages, status: 422
            end
        end
        def series
            serie = Serie.new(external_id: @serie[:id], name: @serie[:name], overview: @serie[:overview], popularity: @serie[:popularity], poster_path: @serie[:poster_path], vote_average: @serie[:vote_average], user: current_user)
            serie.save! 
            favorite_serie = Favorite.new(user: current_user, serie_id: serie.id) 
            if favorite_serie.save    
                render json: favorite_serie, status: 201         
            else
                render json: favorite_serie.errors.messages, status: 422
            end
        end

        def index
            @favorites = current_user.favorites
                .where("name like ?", "%#{params[:filter]}%")
                .select(params[:fields]).as_json

            render json: @favorites, status: 200
        end

        def destroy 
            fav = @favorite.to_i
            favorite = Favorite.find_by(id:fav).delete
            if  favorite.delete     
                {message: "deleted"}
            end
        end

        private
        def view_movie
            @movie = (params[:movie])
        end
        def view_serie
            @serie = (params[:serie])
        end
        def delete_favorite
            @favorite = (params[:id])
        end
    end
end