Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :productions, only: [:show, :create, :destroy, :new]
  get 'create_productions', to: 'productions#create'
  post 'send_comment', to: 'productions#aiueo'
  
  resources :comments
end
