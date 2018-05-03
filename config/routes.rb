Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  get 'auth' => 'users#current'
  resources :users
end
