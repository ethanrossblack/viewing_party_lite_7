Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get "/register", to: "users#new"
  resources :users, only: [:create, :show] do
    get "/discover", to: "movies#discover"
    get "/movies", to: "movies#search"
  end
  
end
