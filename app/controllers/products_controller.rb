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
    @comments = ProductReview.find_all_by_productable_id params[:id]
    
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