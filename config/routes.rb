Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"

      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, only: [:show, :index] do 
        resources :columns, only: [:show, :index]
        resources :cards, only: [:show, :index]
        resources :comments, only: [:show, :index]
      end

      resources :columns, only: [:update, :create, :destroy]

      resources :columns, only: [:show, :index] do
        resources :cards, only: [:show, :index]
      end

      resources :cards, only: [:update, :create, :destroy]

      resources :cards, only: [:show, :index] do
        resources :comments, only: [:show, :index]
      end

      resources :comments
    end
  end
end
