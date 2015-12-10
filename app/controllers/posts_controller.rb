class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  before_action :find_post, :except => [:new, :create]

  def show
    @title = generate_title(@post.title)
  end

  def new
    @post = Post.new
    @images = Image.order('created_at desc').first(10)
  end

  def edit
    @post_publish_time = @post.published_at && @post.published_at.strftime("%b %d, %Y")
    @images = Image.all
    render :new
  end

  def create
    @post = current_user.posts.includes(:tags).create(post_params)
    update_tags
    redirect_to root_path
  end

  def update
    @post.update(post_params)
    update_tags
    redirect_to root_path
  end

  def destroy
    @post.try(:destroy)
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by(slug: params[:slug]) if params[:slug]
    @post ||= Post.find_by(id: params[:id])
    redirect_to root_path if @post.nil?
  end

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
