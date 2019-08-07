Rails.application.routes.draw do
  root 'gossips#index'
  resources :welcome, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :gossips do 
    resources :likes
    resources :comments
  end
  resources :users
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
end
