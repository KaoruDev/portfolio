class HomeController < ApplicationController
  def index
    @posts = list_of_posts
  end

  def about
    @title = "About"
  end

  private

  def list_of_posts
    posts = Post.order("posts.published_at desc").where("published_at < ? and draft is not true", Time.now)
    posts = posts.paginate(page: params[:page] || 1, per_page: 5)
    posts = filter_by_tags(posts) if params[:tags]
    posts
  end

  def filter_by_tags(posts)
    posts.where(id: Tag.where(name: params[:tags], taggable_type: "Post").pluck(:taggable_id))
  end

end
