Rails.application.routes.draw do

  resources :raffles do
		resources :numbers, only: [:new, :create, :destroy]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
