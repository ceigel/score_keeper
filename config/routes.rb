Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:new, :create, :destroy, :show, :index] do
    resources :scores
    resources :players
  end
end
