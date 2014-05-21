class ProductReviewsController < ApplicationController
  before_action :resource_request
  before_action :product_retrieve

  def new
    @product_comment = ProductReview.new
    @product_comment.review_images.build
    @product_comment.review_images.build  
    @product_comment.review_images.build
  end

  def create
    @product_comment = ProductReview.new(product_review_params)
    @product_comment.user = current_user

    if @product_comment.save
      @product_comment.create_activity :create, owner: current_user
      
      redirect_to eval("#{@resource_type}_path(@product['sem3_id'])")
    else
      render 'new'
    end
  end

#def upvote
#    @product_comment.liked_by current_user
#    render nothing: true
#  end

#  def downvote
#    @product_comment.downvote_from current_user
#    render nothing: true    
#  end

  private

  def resource_request
    @resource_type = request.path_info[1..-1].split('/').first.singularize.to_sym
  end

  def product_retrieve
    @product = Product.retrieve_product eval("params[:#{@resource_type}_id]")
  end
  
    def product_review_params
      params.require(:product_review).permit(:content, :user_id, {product_id: @product['sem3_id']}, {product_type: @resource_type}, {cat_id: @product['cat_id']}, :point, :score,
        {review_images_attributes: [:image, :attachable_id, :attachable_type]})
    end
end
