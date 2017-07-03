class SitemapsController < ApplicationController
  layout nil

  def index
    headers["Content-Type"] = "application/xml"
    @posts = Post.published
    if stale?(@posts.last)
      respond_to do |format|
        format.xml
      end
    end
  end
end
