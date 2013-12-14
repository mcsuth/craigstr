# require 'sidekiq/web'

Craigstr::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: "tracks#index"
  resources :tracks
  match 'create', to: 'tracks#create'
  match 'search', to: 'tracks#search'
  match 'link', to: 'tracks#link'

  # mount Sidekiq::Web, at: '/sidekiq'
end
