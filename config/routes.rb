Rails.application.routes.draw do
  root 'movies#index'
  resources :movies
  resources :users, :except => [:index]
end