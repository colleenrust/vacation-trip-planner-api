Rails.application.routes.draw do
  # get "/places" => "places#index"
  # get "/places/:id" => "products#show"
  # post "/places" => "places#create"
  # delete "/places:id" => "places#destroy"
  resources :trips
  resources :places
  # get "/apis" => "apis#index"

  # get "/trips" => "trips#index"
  # get "/trips/:id" => "/trips#show"
  # post "/trips" => "trips#create"
  # delete "/trips/:id" => "trips#destroy"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
