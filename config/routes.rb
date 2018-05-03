Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'auth' => 'users#current'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

<<<<<<< HEAD
resources :ldap
resources :users
root 'users#index'
=======

  resources :users
  root 'users#index'

wash_out :wsusers
>>>>>>> 8fa55555db2da5031be8b0ebed19e09185d6d50a

end
