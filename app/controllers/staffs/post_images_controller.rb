class Staffs::PostImagesController < ApplicationController

  def create
    post_image = PostImage.new(post_image_params)
    post_image.save
    redirect_to root_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image_id)
  end
end
