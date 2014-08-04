class ProductsController < ApplicationController
  before_action :resource_request
  before_action :categories_list
  before_action :signed_in_user, except: [:show, :index, :search]

  def index
  end

  def search
    @products = Product.search params, @resource_type

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
    @product_reviews = ProductReview.where(productable_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @product_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @product_reviews.count if @product_reviews.count > 0
  end

  private

  def resource_request
    @resource_type = request.path_info[1..-1].split('/').first.singularize.to_sym
  end

  def categories_list
    @categories = ProductCategory.where(resource_type: @resource_type)
  end
end