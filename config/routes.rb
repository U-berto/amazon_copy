Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:show, :index]
  resources :cart_items, only: [:create]
  resources :orders, only: [:index]
  root to: "items#index"
  get "up" => "rails/health#show", as: :rails_health_check

end
