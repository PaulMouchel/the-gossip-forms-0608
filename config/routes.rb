Rails.application.routes.draw do
  root 'gossips#index'
  resources :welcome, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
end
