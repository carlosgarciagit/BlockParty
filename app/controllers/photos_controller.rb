class PhotosController < ApplicationController
  def index
    @images = Dir.glob("app/assets/images/gallery_images/*.png") 

    render :gallery
  end
end
