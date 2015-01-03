class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    render :new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit!
  end

end
