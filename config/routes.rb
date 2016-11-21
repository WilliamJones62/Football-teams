Rails.application.routes.draw do
  root 'teams#index', as: 'team'
  resources :games
  resources :players
  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback' => 'sessions#create'
  get '/users/sign_out', to: 'teams#index'

end
