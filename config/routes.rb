Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "watches#index"

  resources :watches, only: %i[index new create edit update show]

  post '/watches/:id', to: 'watches#destroy'

  get '/find', to: 'watches#find'
  get '/search', to: 'watches#search'
  get '/sort', to: 'watches#sort'

end