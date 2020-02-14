Rails.application.routes.draw do
  root 'application#hello'
  resources :users, only: [:new, :create, :edit, :upgrade, :show, :destroy]
    
  resources :lists, only: [:new, :create, :edit, :upgrade, :index, :show, :destroy] do
    resources :share_users, only: [:create, :destroy, :index]
  end

  #resources :lists
  #resources :share_users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
