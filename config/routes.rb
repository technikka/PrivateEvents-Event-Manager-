Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events

  post 'events/:id', to: 'attendable_events#create'
  get 'attendable_events/:id', to: 'attendable_events#destroy'

  root 'events#index'
end
