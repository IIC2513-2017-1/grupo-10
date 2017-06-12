Rails.application.routes.draw do

  get 'reaction/create'

  get 'reaction/destroy'

  get 'reaction_representation/new'

  get 'reaction_representation/create'

  get 'reaction_representation/destroy'

  root "raffles#index"

  get '/login', to: 'sessions#new', as: :login

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: :logout

  get '/requests', to: 'requests#awaiting', as: :requests

  patch '/requests/:id', to: 'requests#approve', as: :approve

  post '/reaction/:raffle_id/:user_id/:reaction_representation_id',
        to: 'reactions#react',
        as: :react

  get '/reactions', to: 'reaction_representation#index', as: :reactions

  get '/reactions/new', to: 'reaction_representation#new', as: :new_reaction

  post '/reactions', to: 'reaction_representation#create'

  delete '/reactions/:id', to: 'reaction_representation#destroy', as: :reaction

  resources :raffles do
    resources :prizes, only: [:new, :create]
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
