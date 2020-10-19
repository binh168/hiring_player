Rails.application.routes.draw do
  root "static_pages#home"
  get  "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :users do
    post "/rate", to: "ratings#create"
    resources :messengers
    resources :conversations, only: %(index)
  end
  resources :orders, only: %i(index new create show)
  resources :sender_recipients, only: %i(index create update destroy)
  resources :followers, only: %i(index)
  resources :sender_recipients, only: %i(create destroy)
  resources :followers, only: %i(index) 
  resources :followings, only: %i(index)
  resources :comments, only: %i(create show destroy)
  resources :players
  resources :ranks, only: %i(index)
  resources :download_profiles, only: %i(index)
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :discord, only: %(create)
  resources :payments do
    collection do
      get :fee_payment
    end
  end
end
