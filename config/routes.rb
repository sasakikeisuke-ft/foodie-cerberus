Rails.application.routes.draw do
  get 'tests/index'
  devise_for :users
  root to: 'tests#index'
  resources :meals
  resources :tags
  resources :logs, only: [:index, :create, :update, :destroy]
end
