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

  get '/raffles/:id/winners', to: 'raffles#show_winners', as: :show_winners
  post '/raffles/:id/winners', to: 'raffles#choose_winners', as: :choose_winners

  get '/users/:id/edit_image', to: 'users#edit_image', as: :edit_image
  patch '/users/:id/edit_image', to: 'users#update_image'

  get '/sign-up', to: 'users#new', as: :sign_up
  resources :users do
    resources :requests
  end

  get '/users/:id/transactions', to: 'users#transactions', as: :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
