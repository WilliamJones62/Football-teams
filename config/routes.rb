Rails.application.routes.draw do
  root 'static_pages#home'
  resources :games, only: [:show]
  resources :players, only: [:show]
  resources :player_games
  resources :teams
  devise_for :users
  get '/auth/facebook/callback' => 'users#create'
  get '/users/sign_out', to: 'static_pages#home'

end
