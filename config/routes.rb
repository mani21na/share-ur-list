Rails.application.routes.draw do
  get “/login”, to: “sessions#new”
  post “/login”, to: “sessions#create”

  resources :user
    
  resources :list, only: [:new, :create, :edit, :upgrade, :index, :destroy] do
    resources :share_user, only: [:create, :destroy, :index]
  end

  resources :list 
  resources :share_user
end
