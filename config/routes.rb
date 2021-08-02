Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get 'users/search', to: 'users#search'
  
  get 'users/:id', to: 'users#show'
  
  get 'comment', to: 'comments#create'
  
  resources :users do
    get :search, on: :collection
    member do
      get :followings
      get :followers
    end
  end

  resources :posts, only: [:show, :create, :destroy] do
    resources :comments, only: [:create]
  end
  
  resources :relationships, only: [:create, :destroy]
end