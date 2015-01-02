Rails.application.routes.draw do
  devise_for :users

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  root to: 'home#index'
end
