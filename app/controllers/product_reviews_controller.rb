class ProductReviewsController < ApplicationController
  before_action :resource_request, except: [:all_product_comments, :show]
  before_action :product_retrieve, except: [:all_product_comments, :destroy, :show]
  before_action :set_product_review, only: [:destroy, :upvote, :downvote]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def index
  end
  
  def new
    @product_review = ProductReview.new
    @product_review.review_images.build
    @product_review.review_images.build  
    @product_review.review_images.build
  end

  def create
    @product_review = ProductReview.new(product_review_params)
    @product_review.user = current_user

    if @product_review.save
      @product_review.create_activity :create, owner: current_user

      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def destroy
    @product_review.destroy
    redirect_to current_user
  end

  def upvote
    @product_review.liked_by current_user
    render nothing: true
  end

  def downvote
    @product_review.downvote_from current_user
    render nothing: true    
  end

  private
  
  def set_product_review
    @product_review = ProductReview.find(params[:id])
  end

  def resource_request
    @resource_type = request.path_info[1..-1].split('/').first.singularize.to_sym
  end

  def product_retrieve
    @product = Product.retrieve_product eval("params[:#{@resource_type}_id]")
  end
  
  def product_review_params
        params.require(:product_review).permit(:content, :user_id, :productable_id, :cat_id, :point, :score, :upc_code, :product_name, :productable_type, :gtins,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
  end
  
    def require_permission
      if current_user != ProductReview.find(params[:id]).user
        redirect_to root_path
      end
    end 
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 

end
