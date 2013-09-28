Huemorme::Application.routes.draw do
  resources :users, except: [:destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]

  resources :lamps, only: [:update]

  root to: "users#new"

  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
