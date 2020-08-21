Rails.application.routes.draw do 
 
  
  resources :users
  resources :currencies 
  resources :user_currencies

  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end
