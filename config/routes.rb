Huemorme::Application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :bridges, only: [:new, :create]
  end

  resources :bridges, only: [:show] do
    resources :lamps, only: [:create, :update]
  end

  resources :sessions, only: [:create, :destroy]

  root to: "users#new"

  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
