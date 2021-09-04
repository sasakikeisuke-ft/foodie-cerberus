Rails.application.routes.draw do
  get 'tests/index'
  devise_for :users
  root to: 'tests#index'
  resources :meals do
    member do
      post 'add_tag'
      delete 'remove_tag'
    end
  end
  resources :tags
  resources :logs, only: [:index, :create, :update, :destroy]
end
