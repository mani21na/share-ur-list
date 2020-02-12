Rails.application.routes.draw do
  resources :users
    
  resources :lists, only: [:new, :create, :edit, :upgrade, :index, :destroy] do
    resources :share_users, only: [:create, :destroy, :index]
  end

  resources :lists
  resources :share_users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
