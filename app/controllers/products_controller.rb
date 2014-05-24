class ProductsController < ApplicationController
  before_action :resource_request
  before_action :categories_list

  def index
  end

  def search
    @products = Product.search params

    if request.xhr?
      render json: {
        products_html: render_to_string(partial: 'products'),
        pagination_html: render_to_string(partial: 'pagination')
      }
    else
      render 'index'
    end
  end

  def show
    @product = Product.retrieve_product params[:id]
    @product_reviews = ProductReview.where(productable_id: params[:id]).paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @product_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @product_reviews.count if @product_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end

  private

  def resource_request
    @resource_type = request.path_info[1..-1].split('/').first.singularize.to_sym
  end

  def categories_list
    @categories = ProductCategory.where(resource_type: @resource_type)
  end
end