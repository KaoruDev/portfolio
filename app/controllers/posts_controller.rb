class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
  end

  def destroy
  end

end
