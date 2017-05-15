Rails.application.routes.draw do

  root "raffles#index"

  get '/login', to: 'sessions#new', as: :login

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: :logout

  get '/requests', to: 'requests#awaiting', as: :requests

  patch '/requests/:id', to: 'requests#approve', as: :approve

  resources :raffles do
  	resources :prizes
	resources :numbers, only: [:new, :create, :destroy]
  end

  resources :users do
    resources :requests
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
