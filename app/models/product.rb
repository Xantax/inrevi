class Product < ActiveRecord::Base
  PER_PAGE = 10
  RESOURCE_FOR = [:computer, :camera, :securit, :television, :carelectro, :homeaudio, :eportable, :emobile, :videogame,
    :makeup, :fragrance, :haircare, :skincare, :bodybath, :grocer, :jewelr,
    :healthcare, :supplement, :sexual, :personal, :musical, :sport, :craft,
    :toy, :appliance, :baby, :pet, :tool, :indoor, :outdoor, :ereader, :enavigation, :ewar, :beatool, :footwear, :clothing,
    :medical, :household, :hkid, :vehcar]

  class << self
    def search(params, resource_type = :computer)
      sem3 = Semantics3::Products.new(ENV["SEMANTICS3_KEY"], ENV["SEMANTICS3_SECRET"])

      sem3.products_field('cat_id', ProductCategory::ORIGINAL_CATEGORY[resource_type][:cat_id])

      if params[:query].present?
        sem3.products_field('name', params[:query])
      end

      offset = (page(params) - 1) * PER_PAGE

      sem3.products_field('offset', offset)
      sem3.products_field('limit', PER_PAGE)

      sem3.get_products
    end

    def page(params)
      params[:page].present? ? params[:page].to_i : 1
    end

    def retrieve_product(id)
      sem3 = Semantics3::Products.new(ENV["SEMANTICS3_KEY"], ENV["SEMANTICS3_SECRET"])
      sem3.products_field('sem3_id', id)

      sem3.get_products['results'].first rescue nil
    end

    def retrieve_price(id)
      sem3 = Semantics3::Products.new(ENV["SEMANTICS3_KEY"], ENV["SEMANTICS3_SECRET"])
      sem3.add("offers", "sem3_id", id)
      results = sem3.get_offers

      results
    end
  end
end