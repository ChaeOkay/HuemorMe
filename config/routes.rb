Huemorme::Application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :bridges, only: [:new, :create, :edit, :update]
  end

  resources :bridges, only: [:show] do
    resources :lamps, only: [:create, :show] do
      member do
        get 'settings'
      end
    end
  end

  resources :sessions, only: [:create, :destroy]


  root to: "users#show"

  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get '/api/:secret_token', to: 'apis#show', via: 'get'
  get '/setup', to: 'users#setup'
  get '/download', to: 'users#download'
  get '/tour', to: 'tours#index'
end
