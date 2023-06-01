Rails.application.routes.draw do
  devise_for :users
  root to: "starships#index"
  get "dashboard", to: "pages#dashboard"
  get "requests", to: "pages#requests"

  resources :starships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :update, :index]
end
