Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", as: "dashboard"
  end

  root to: "home#index"  
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
    resources :followers, only: [:index]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"


  # Shouts Routes
  post "text_shouts" => "shouts#create", defaults: { content_type: TextShout }
  post "photo_shouts" => "shouts#create", defaults: { content_type: PhotoShout }
  resources :shouts, only: [:destroy] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end
  
  resource :shouts do
    post "/delete_all", to: "shouts#destroy_all", as: "delete_all"
  end

  resource :search, only: [:show]
  
  resources :hastags, only: [:show]

end
