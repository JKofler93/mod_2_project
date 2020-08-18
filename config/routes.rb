Rails.application.routes.draw do 
  resources :users
  resources :currencies 
  resources :user_currencies
end
