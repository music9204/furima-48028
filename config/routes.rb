Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :items do
    resources :orders, only: [:index, :create]
    
    resources :comments, only: [:create, :destroy]
  end
end