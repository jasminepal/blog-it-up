Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blogs
  # Defines the root path route ("/")
  root "blogs#index"
end
