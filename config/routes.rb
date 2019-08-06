Rails.application.routes.draw do
  # get '/' , to: "index#show"
  resources :welcome, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :gossips
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :comments
  root 'gossips#index'
end
