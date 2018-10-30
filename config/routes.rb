Rails.application.routes.draw do
  resources :articles do
    resources :favourites, only: [:create]
  end
  resources :users, path: '/profile'
  resources :sessions, only: [:new, :create, :destroy]
  get '/editor', to: 'articles#new'
  get '/editor/:id', to: 'articles#edit'
  get '/login', to: 'sessions#new'
  get '/register', to: 'users#new'
  root 'articles#index'
end
