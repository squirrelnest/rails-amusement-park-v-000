Rails.application.routes.draw do

  root to: 'users#home'

  resources :users, only: [:index, :new, :show, :create]

  post '/rides/create/:attraction_id/:user_id', to: 'rides#create'

  resources :attractions

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy', as: 'signout'
  post '/signout', to: 'sessions#destroy'

  # devise_for :users

end
