Rails.application.routes.draw do
  root 'movies#index'
  resources :movies
  resources :users, :except => [:index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
end