class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i{index show}
  before_action :find_post, except: %i{index new create}

  def index
    @posts = list_of_posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
    @post_publish_time = @post.published_at &&
      @post.published_at.strftime("%b %d, %Y")
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
    if params[:slug]
      @post = Post.includes(:tags).find_by(slug: CGI.escape(params[:slug]))
    end

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
    Post.published.order("posts.published_at desc")
      .paginate(page: params[:page] || 1, per_page: 5)
      .tap do |posts|
        if params[:tags]
          posts.where(tags: { name: params[:tags], taggable_type: "Post" })
        end
      end
  end
end
