Rails.application.routes.draw do
  resources :digital_assets
  resources :find_creators
  
  devise_for :creators
  devise_for :brand_owners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index", as: :home

  get "/features", to: "home#features", as: :features
  get "/team", to: "home#team", as: :team
  get "/login", to: "home#login", as: :login
  get "/signup", to: "home#signup", as: :signup

  authenticated :brand_owner do
    root to: "brand_owner#index", as: :brand_owner_root
  end

  authenticated :creator do
    root to: "creator#index", as: :creator_root
  end

  get "/brand_owner", to: "brand_owner#index", as: :brand_owner

  get "/creator", to: "creator#index", as: :creator
  get "/creator/:id", to: "creator#show", as: :show_creator

  get "/manage_invites", to: "manage_invites#index", as: :manage_invites
  post "/manage_invites", to: "manage_invites#update"
end
