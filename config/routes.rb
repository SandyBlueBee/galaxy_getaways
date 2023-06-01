Rails.application.routes.draw do
  devise_for :users
  root to: "starships#index"
  get "dashboard", to: "pages#dashboard"
  get "requests", to: "pages#requests"
  patch "requests/:id/approved", to: "bookings#approved", as: "approve_request"
  patch "requests/:id/declined", to: "bookings#declined", as: "decline_request"

  resources :starships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :update, :index]
end
