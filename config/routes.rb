Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :images

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  root to: 'home#index'
end
