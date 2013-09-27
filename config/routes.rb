Huemorme::Application.routes.draw do
  resources :users, except: :destroy do
    resources :bridges
  end

  resources :bridges do
    resources :lamps
  end

  root to: "users#new"
end
