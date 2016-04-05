class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_post, :except => [:index, :new, :create]

  def index
    @posts = list_of_posts
  end

  def show
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
    @post = Post.includes(:tags).find_by(slug: CGI.escape(params[:slug])) if params[:slug]
    @post ||= Post.includes(:tags).find_by(id: params[:id])
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

  def list_of_posts
    posts = Post.order("posts.published_at desc").where("published_at < ? and draft is not true", Time.now)
    posts = posts.paginate(page: params[:page] || 1, per_page: 5)
    posts = filter_by_tags(posts) if params[:tags]
    posts
  end

end
