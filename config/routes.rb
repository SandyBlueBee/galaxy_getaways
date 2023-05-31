Rails.application.routes.draw do
  devise_for :users
  root to: "starships#index"
  resources :starships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :index]
end
