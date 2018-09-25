Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create,:edit,:update]
  get 'users/:id/save_user_edit' ,to: 'users#save_user_edit'

  
  resources :productions, only: [:show, :create, :destroy, :new]
  
  get 'productions/:id/transaction', to: 'productions#transaction'
  get 'productions/:id/buy', to: 'productions#buy'
  
  #gitのコミット用
  
  get 'create_productions', to: 'productions#create'
  post 'send_comment', to: 'productions#save_comment'
  post 'send_transaction_comment', to: 'productions#send_transaction_comment'
  
  resources :comments
end
