Rails.application.routes.draw do
  root to: 'application#information'
  
  resources :incomings
  resources :categories
  resources :entries
  resources :expenses
  resources :users
  resources :users, param: :id
  
  post '/auth/login', to: 'authentication#login'
  match '*path', to: 'authentication#not_found', via: :all
end
