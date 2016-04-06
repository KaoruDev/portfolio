class HomeController < ApplicationController
  def index
  end

  def mentorship
  end

  private

  def filter_by_tags(posts)
    posts.where(id: Tag.where(name: params[:tags], taggable_type: "Post").pluck(:taggable_id))
  end

end
