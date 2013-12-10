Craigstr::Application.routes.draw do
  root to: "tracks#index"
  resources :tracks
  match 'search', to: 'tracks#search'
  match 'link', to: 'tracks#link'
end
