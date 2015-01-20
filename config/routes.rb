Rails.application.routes.draw do
  devise_for :users

  resources :posts, :except => [:show] do
    collection do
      get '/:slug' => 'posts#show'
    end
  end

  resources :images

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  root to: 'home#index'
end
