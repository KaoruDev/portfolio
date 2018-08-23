Rails.application.routes.draw do
  devise_for :users

  resources :posts, :except => [:show] do
    collection do
      get '/new' => 'posts#new' # catch new posts before it reaches slug
      get '/:slug' => 'posts#show', :as => :show
      get '/index' => redirect('/posts')
    end
  end

  get 'dashboard' => 'blog#dashboard', :as => :dashboard

  get 'sitemap.xml', to: 'sitemaps#index', defaults: { format: :xml }
  root to: 'home#index'
end
