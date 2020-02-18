Rails.application.routes.draw do
  root 'application#hello'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy, :index]
    
  resources :lists, only: [:new, :create, :update, :show, :destroy] do
    resources :share_users, only: [:new, :destroy, :index, :create, :index]
    get '/user_search', to: 'share_users#search'
  end

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
