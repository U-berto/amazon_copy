Rails.application.routes.draw do
  get 'cart_items/create'
  get 'order_items/create'
  devise_for :users
  resources :items, only: :show
  resources :cart_items, only: [:create]
  root to: "pages#home"
  # get "/items/:id", to: "items#show", as: :item

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
end
