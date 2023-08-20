Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  devise_for :blogs, controllers: {
    registrations: 'blogs/registrations'
  }
  root to: 'blogs#index'
end
