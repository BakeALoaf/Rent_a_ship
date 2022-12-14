Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  devise_for :users
  root to: "ships#index"

  resources :ships do
    resources :bookings, except: %i[index] do
      resources :reviews, only: %i[new create]
    end
  end
  resources :bookings, only: %i[index]
  # get 'ships/my_ships', to: 'ships#my_ships', as: 'my_ships'
end
