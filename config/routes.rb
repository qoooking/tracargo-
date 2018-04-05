Rails.application.routes.draw do
  get 'items/create'

  get 'items/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'top#index'
  get 'top/index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :items, only: [:show, :new, :create, :destroy]
end
