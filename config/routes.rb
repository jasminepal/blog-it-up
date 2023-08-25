Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :blogs
  devise_for :blogs, controllers: {
    registrations: 'blogs/registrations'
  }
  root to: 'blogs#index'
end
