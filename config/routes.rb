Rails.application.routes.draw do
  resources :incomings
  resources :categories
  resources :entries
  resources :expenses

  resources :users
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/not_found', to: 'application#not_found'
  get '/auth/verify', to: 'authentication#verify'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
