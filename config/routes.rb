Rails.application.routes.draw do
  resources :items
  resources :lists

  root "lists#index"

  resources :items do
    member do
      patch :toggle_checked
    end
  end

  get "/signup", to: "users#new", as: "signup"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
