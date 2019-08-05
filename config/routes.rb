Rails.application.routes.draw do
  # get '/' , to: "index#show"
  resources :welcome, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :gossips, except: [:destroy] 
  resources :users, only: [:show]
  root 'gossips#index'
end
