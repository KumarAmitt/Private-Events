Rails.application.routes.draw do
  resources :events
  root 'events#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new,:create,:show]
  # resources :users
  # resources :sessions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
