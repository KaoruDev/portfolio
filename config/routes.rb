Rails.application.routes.draw do
  devise_for :users

  resources :posts, :except => [:show] do
    collection do
      get '/new' => 'posts#new' # catch new posts before it reaches slug
      get '/:slug' => 'posts#show', :as => :show
    end
  end

  resources :images

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  get 'mentorship' => 'home#mentorship', :as => :mentorship
  root to: 'home#index'
end
