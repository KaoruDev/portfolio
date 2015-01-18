class ImagesController < ApplicationController

  def create
    @image = Image.new(image_params)
    @image.save

    redirect_to :back
  end

  private

  def image_params
    params.require(:image).permit!
  end
end
