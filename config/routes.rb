Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # --User stories :--
  # ------------------
  # 1- we can see the list of all restaurants : GET "restaurants"
  # 2- we can add a new restaurant, and go to its show view : GET "restaurants/new", POST "restaurants"
  # 3- we can see the details of a restaurant, with all its related reviews : GET "restaurants/38"
  # 4- we can add a new review to a restaurant : POST "restaurants/38/reviews"
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create]
  end
end
