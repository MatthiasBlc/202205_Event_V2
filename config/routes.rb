Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances/index'
  root to: 'events#index'

  devise_for :users

  resources :events

  resources :users, only: [:show]

  resources :events do
    resources :attendances
  end
end
