Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

get "/users", to: "users#index"
get "/users/:id", to: "users#show"
post "/users", to: "users#create"
delete "users/:id", to: "users#destroy"
patch "users/:id", to: "users#update"


get "/cards", to: "cards#index"
get "/cards/:id", to: "cards#show"

get "/columns", to: "columns#index"
get "/columns/:id", to: "columns#show"

get "/comments", to: "comments#index"
get "/comments/:id", to: "comments#show"

end
