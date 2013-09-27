Huemorme::Application.routes.draw do
  resources :users, except: :destroy
  resources :sessions, only: [:new, :create, :destroy]

  resources :lamps
  #   resources :bridges
  # end

  # resources :bridges, only: [:show] do
  #   resources :lamps
  # end

  root to: "users#new"
end
