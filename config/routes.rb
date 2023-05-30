Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :starships do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:destroy]
end
