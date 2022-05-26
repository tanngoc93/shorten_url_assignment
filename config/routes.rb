Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :urls, only: [:index, :create]
  end

  devise_for :users

  resources :urls

  get  "/access_tokens", to: "access_tokens#show", as: :access_tokens
  get  "/:token", to: "redirections#show", as: :redirect

  # Defines the root path route ("/")
  root "page#index"
end
