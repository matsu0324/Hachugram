Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :reptiles do
    resource :favorites, only: [:create, :destroy]
  end
end
