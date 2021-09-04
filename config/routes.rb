Rails.application.routes.draw do
  get 'tests/index'
  devise_for :users
  root to: 'tests#index'
  resources :meals do
    member do
      post 'add_tag'
      delete 'remove_tag'
      post 'create_tag'
    end
  end
  resources :tags do
    member do
      post 'join'
      delete 'withdraw'
    end
  end

  resources :logs, only: [:index, :create, :update, :destroy]
end
