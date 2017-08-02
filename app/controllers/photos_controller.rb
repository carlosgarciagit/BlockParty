class PhotosController < ApplicationController
  def index
    @images = Dir.glob("app/assets/images/gallery_images/*.JPG")

    render :gallery
  end
end
