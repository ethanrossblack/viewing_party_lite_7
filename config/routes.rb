Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get "/register", to: "users#new"
  resources :users, only: [:create, :show] do
    get "/discover", to: "movies#discover"
    resources :movies, only: [:index, :show] do
      get "/viewing_party/new", to: "viewing_parties#new"
    end
  end
end
