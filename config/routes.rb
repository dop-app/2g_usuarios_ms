Rails.application.routes.draw do
get 'auth/:provider/callback', to: 'sessions#create'
delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

resources :ldap
resources :users
root 'users#index'

end
