class ReviewImagesController < ApplicationController
  before_action :signed_in_user
  
  def create
    ReviewImage.create(review_image_params)
  end

  private

  def review_image_params
    params.require(:review_image).permit(:image, :attachable_id, :attachable_type)
  end
end
