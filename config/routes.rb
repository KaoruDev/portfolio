Rails.application.routes.draw do
  devise_for :users

  get "/wedding" => "weddings#index"

  namespace :projects do
    get "/" => "home#index"

    get "/connect_four" => "connect_four#show", :as => :connect_four
  end

  resources :posts, :except => [:show] do
    collection do
      get '/new' => 'posts#new' # catch new posts before it reaches slug
      get '/:slug' => 'posts#show', :as => :show
    end
  end

  resources :images

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  get 'about' => 'home#about', :as => :about
  root to: 'home#index'
end
