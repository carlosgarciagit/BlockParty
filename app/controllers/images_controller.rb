class ImageController < ApplicationController
  def image_params
    params.require(:image).permit(:img)
  end

  def new
  end
end
