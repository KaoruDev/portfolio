class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    @post_publish_time = @post.published_at && @post.published_at.strftime("%b %d, %Y")
    render :new
  end

  def create
    @post = current_user.posts.includes(:tags).create(post_params)
    update_tags
    redirect_to root_path
  end

  def update
    @post = Post.includes(:tags).find(params[:id])
    @post.update(post_params)
    update_tags
    redirect_to root_path
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.try(:destroy)
    redirect_to root_path
  end

  private

  def update_tags
    new_tags = params[:tags].split(",").map { |tag| tag.strip.downcase }
    old_tags = @post.tags.pluck(:name)
    diff = old_tags - new_tags

    @post.tags.where(name: diff).destroy_all

    new_tags.each do |tag|
      @post.tags.find_or_create_by(name: tag)
    end
  end

  def post_params
    params.require(:post).permit!
  end

end
