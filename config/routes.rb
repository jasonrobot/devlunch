Rails.application.routes.draw do
  root 'users#lunch'

  resources :users

  if Rails.env.test? then
    get '/pick', to: 'users#pick'
    get '/reset', to: 'users#reset'
  end
end
