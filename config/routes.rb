Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rides#index'

  get '/rides', to: 'rides#index', as: 'rides'

  get '/rides/new', to: 'rides#new', as: 'new_ride'

  post '/rides', to: 'rides#create'

  get '/rides/:id', to: 'rides#show', as: 'ride'
  get '/rides/:id/edit', to: 'rides#edit', as: 'edit_ride'
  patch '/rides/:id', to: 'rides#update'
  delete '/rides/:id', to: 'rides#destroy'
end
