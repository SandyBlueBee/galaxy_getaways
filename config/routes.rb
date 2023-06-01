Rails.application.routes.draw do
  devise_for :users
  root to: "starships#index"
  get "dashboard", to: "pages#dashboard"
  resources :starships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :update, :index]
end
