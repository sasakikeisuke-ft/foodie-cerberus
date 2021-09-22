Rails.application.routes.draw do
  devise_for :users
  root to: 'logs#index'
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
  resources :logs, only: [:index, :create, :destroy] do
    collection do
      patch 'last_day_update'
      delete 'all_delete'
      get 'search_meals'
    end
  end
end
