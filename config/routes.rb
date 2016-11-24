Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :groups, except: [:index, :destroy]
end
