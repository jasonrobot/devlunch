Rails.application.routes.draw do
  root 'users#lunch'

  resources :users

  get '/pick', to: 'users#pick'
  get '/reset', to: 'users#reset'
end
