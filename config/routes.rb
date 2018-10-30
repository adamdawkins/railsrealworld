Rails.application.routes.draw do
  resources :articles do
    resources :favourites, only: [:create]
  end
  resources :users, path: '/profile'
  resources :sessions, only: [:create]
  get '/editor', to: 'articles#new'
  get '/editor/:id', to: 'articles#edit'
  get '/login', to: 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  get '/register', to: 'users#new'
  root 'articles#index'
end
