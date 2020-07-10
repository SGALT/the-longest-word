Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :games, only: [:show, :new, :create] do
    resources :parties, only: [:show, :new, :create] do
      resources :solutions, only: [:index]
    end
  end
end
