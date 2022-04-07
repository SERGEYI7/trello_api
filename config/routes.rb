Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"

      resources :users do 
        resources :columns, only: [:show, :index]
        resources :cards, only: [:show, :index]
        resources :comments, only: [:show, :index]
      end

      resources :columns
      resources :columns do
        resources :cards, only: [:show, :index]
      end

      resources :cards
      resources :cards do
        resources :comments, only: [:show, :index]
      end
      resources :comments

    end
  end
end
