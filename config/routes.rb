Rails.application.routes.draw do
  devise_for :users

  resources :posts

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  root to: 'home#index'
end
