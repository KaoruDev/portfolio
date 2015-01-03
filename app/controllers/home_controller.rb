class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.last(10).reverse
  end

  def dashboard
  end

end
