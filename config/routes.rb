Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "products#index"
  resources :products do

      resources :subscribers, only: [:create]
  end

  resource :sign_up
  
  namespace :settings do
    resource :password, only: %w[ show update ]
    resource :profile, only: %w[ show update ]
    resource :user, only: %w[ show destroy]
    resource :email, only: %w[show update]
    root to: redirect("settings/profile")
  end


  namespace :store do
    resources :products
    resources :users
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
