Rails.application.routes.draw do

  devise_for :users
  root to: 'items#index'
  get "/items/new"
  resources :users
  resources :items

  

end
