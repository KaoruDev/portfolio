class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = post_tags
  end

  def dashboard
  end

  private

  def post_tags
    posts = Post.includes(:tags).order("posts.created_at desc")
    posts = posts.paginate(page: params[:page] || 1, per_page: 5)
    posts = posts.where(:tags => {name: params[:tags].split(' ')}) if params[:tags]
    posts
  end

end
