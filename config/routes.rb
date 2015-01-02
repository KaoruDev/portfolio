Rails.application.routes.draw do
  devise_for :users

  get 'dashboard' => 'home#dashboard', :as => :dashboard

  root to: 'home#index'
end
