Rails.application.routes.draw do
  resources :articles
  resources :users
  
  root 'articles#index'
end
