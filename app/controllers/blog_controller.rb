class BlogController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

end
