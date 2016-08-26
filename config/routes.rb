Rails.application.routes.draw do
  get 'lunch/view'
  get 'lunch/signup'

  root 'lunch#signup'

  resources :devs
end
