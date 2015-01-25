class HomeController < ApplicationController
  def index
    @posts = post_tags
  end

  def about
    redirect_to root_path if current_user.nil? && params[:lucky_stars] != "bohemian_dance"
    @title = "About"
  end

  private

  def post_tags
    posts = Post.order("posts.created_at desc").where("(published_at is NULL or published_at < ?) and draft is not true", Time.now)
    posts = posts.paginate(page: params[:page] || 1, per_page: 5)
    posts = posts.includes(:tags).where(:tags => {name: params[:tags].split(' ')}) if params[:tags]
    posts
  end

end
