Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: [:index, :show, :new, :create] do
    resources :parties, only: [:index, :show, :new, :create] do
      resources :solutions, only: [:index]
    end
  end
end
