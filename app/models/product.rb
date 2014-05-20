class Product < ActiveRecord::Base
  PER_PAGE = 10
  RESOURCE_FOR = [:computer, :camera, :security, :television, :carelectro, :homeaudio, :eportable, :emobile, :videogame,
    :makeup, :fragrance, :haircare, :skincare, :bodybath, :grocery, :jewelry, :menclothing, :womenclothing,
    :menfootwear, :womenfootwear, :healthcare, :supplement, :sexual, :personal, :musical, :sport, :craft,
    :toy, :appliance, :baby, :pet, :tool, :indoor, :outdoor]

  class << self
    def search(params)
      sem3 = Semantics3::Products.new(Settings.semantics3.key, Settings.semantics3.secret)

      if params[:category].present?
        category = ProductCategory.find_by_name params[:category]
        sem3.products_field('cat_id', category.cat_id)
      end

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
      sem3 = Semantics3::Products.new(Settings.semantics3.key, Settings.semantics3.secret)
      sem3.products_field('sem3_id', id)

      sem3.get_products['results'].first rescue nil
    end
  end
end