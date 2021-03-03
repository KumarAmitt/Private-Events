Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get 'events/index'
  root 'home#index'
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new,:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
