Rails.application.routes.draw do
  devise_for :admins
  get '/search' => "search#search"
  devise_for :users
  root to: "home#index"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :reptiles do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # get '/search', to: 'search#search'
end
