Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "movies#index"
  resources :movies, only: [:index, :show]
  resources :peoples, only: [:index, :show]
  resources :favorites, only: [:index, :show]
  resources :series, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :favorites
      post '/favorites/movies', to: 'favorites#movies'
      post '/favorites/series', to: 'favorites#series'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
