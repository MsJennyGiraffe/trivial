Rails.application.routes.draw do
  root "home#index"
  get "/auth/twitter", as: :twitter_login
  get "/auth/twitter/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  resources :users, only: [:show]
  resources :rounds, only:[:index, :show, :new, :update]
end
