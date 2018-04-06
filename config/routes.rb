Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trips#new'

  resources :drivers do
    resources :trips, only: [:index]
  end

  resources :passengers do
    resources :trips, only: [:index, :new, :create, :show, :edit, :destroy]
  end
  resources :trips
end
