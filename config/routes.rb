Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:new, :create, :destroy, :show, :index] do
    resources :scores, only: [:new, :create]
    resources :players
  end
end
