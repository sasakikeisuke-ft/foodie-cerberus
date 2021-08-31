Rails.application.routes.draw do
  devise_for :user
  root to: 'tests#index'
  resources :meal
  resources :tag
  resources :log, only: [:index, :create, :update, :destroy]
end
