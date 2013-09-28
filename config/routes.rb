Huemorme::Application.routes.draw do

  resources :users, except: [:destroy, :index] do
    resources :bridges
  end

  resources :bridges do
    resources :lamps
  end

  resources :sessions, only: [:new, :create, :destroy]


  root to: "users#new"
end
