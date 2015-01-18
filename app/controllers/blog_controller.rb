class BlogController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @unpublished_posts = Post.order("created_at desc").where("published_at > ? or draft", Time.now)
    @new_image = Image.new
  end

end
