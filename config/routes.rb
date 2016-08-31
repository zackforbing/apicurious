Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#new"
  get "/auth/github", as: :github_login
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", as: :github_logout

  resources :users, only: [:new, :show]
end
