Rails.application.routes.draw do
  resources :articles
  resources :users
  get '/register', to: 'users#new'  
  root 'articles#index'
end
