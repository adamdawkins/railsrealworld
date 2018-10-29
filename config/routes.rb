Rails.application.routes.draw do
  resources :articles
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/register', to: 'users#new'  
  root 'articles#index'
end
