Rails.application.routes.draw do 
  resources :users
  resources :currencies 
  resources :user_currencies

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'
end
