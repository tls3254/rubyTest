Rails.application.routes.draw do
  devise_for :create_users
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "/users/signup", to: "users#signup"
  post "/auth/signin", to: "users#signin"
  post "/contents", to: "contents#create"
  get "/content", to: "contents#show"
  put "/contents/:id", to: "contents#update"
  delete "/contents/:id", to: "contents#destroy"
  resources :users
  # Defines the root path route ("/")
  # root "posts#index"
end
