class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = post_tags
  end

  def dashboard
  end

  private

  def post_tags
    posts = Post.order("created_at desc").where("(published_at is NULL or published_at < ?) and draft != true", Time.now)
    posts = posts.paginate(page: params[:page] || 1, per_page: 5)
    posts = posts.includes(:tags).where(:tags => {name: params[:tags].split(' ')}) if params[:tags]
    posts
  end

end
