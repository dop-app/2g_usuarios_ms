Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'auth' => 'users#current'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'


  resources :users
  root 'users#index'

end
