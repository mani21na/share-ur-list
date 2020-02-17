Rails.application.routes.draw do
  root 'application#hello'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy, :index]
    
  resources :lists, only: [:new, :create, :update, :show, :destroy] do
    resources :share_users, only: [:new, :destroy, :index, :create]
    get '/user_search', to: 'share_users#search'
  end

  #resources :lists
  #resources :share_users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
