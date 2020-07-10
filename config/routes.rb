Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :games, only: [:show, :create] do
    resources :parties, only: [:show, :create] do
      resources :solutions, only: [:index]
    end
  end
end
