Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#index'
  get '/sessions', to: 'sessions#index'
  get "/signup", to: "users#new", as: "signup"
  get "/signin", to: "sessions#new",  as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: 'delete_session'
  delete "/recipes", to: "recipes#destroy", as: 'delete_recipe'
  delete "/userwines", to: "user_wines#destroy", as: 'delete_user_wine'
    delete "/friendships", to: "friendships#destroy", as: 'delete_friendship'

  resources :users, only: [:index, :new, :create, :edit, :update, :show]
  resources :wines
  resources :recipes
  resources :user_wines, only: [:index, :new, :create]
  resources :friendships, only: [:index, :new, :create]


end
