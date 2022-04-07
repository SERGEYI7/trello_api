Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

get "/users", to: "users#index"
get "/users/:id", to: "users#show"
get "/users/:user_id/columns", to: "users#index_columns"
get "/users/:user_id/columns/:id", to: "users#show_columns"
get "/users/:user_id/cards", to: "users#index_cards"
get "/users/:user_id/cards/:id", to: "users#show_cards"
get "/users/:user_id/comments", to: "users#index_comments"
get "/users/:user_id/comments/:id", to: "users#show_comments"
post "/users", to: "users#create"
delete "/users/:id", to: "users#destroy"
patch "/users/:id", to: "users#update"
# get "/probe", to: "users#foo_probe"


get "/cards", to: "cards#index"
get "/cards/:id", to: "cards#show"
post "/cards", to: "cards#create"
delete "/cards/:id", to: "cards#destroy"
patch "/cards/:id", to: "cards#update"

get "/columns", to: "columns#index"
get "/columns/:id", to: "columns#show"
post "/columns", to: "columns#create"
delete "/columns/:id", to: "columns#destroy"
patch "/columns/:id", to: "columns#update"

get "/comments", to: "comments#index"
get "/comments/:id", to: "comments#show"
post "/comments", to: "comments#create"
delete "/comments/:id", to: "comments#destroy"
patch "/comments/:id", to: "comments#update"

end
