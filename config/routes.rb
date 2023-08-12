Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blogs
  # , only: [:new, :create, :edit, :update, :destroy]
  # Defines the root path route ("/")
  root "blogs#index"
end
