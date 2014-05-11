class ProductCategory < ActiveRecord::Base
  has_many :sub_categories, class_name: "ProductCategory", foreign_key: "parent_cat_id"

  REJECT_CATEGORY = ['Computer Accessories', 'Warranties & Services']

  ORIGINAL_CATEGORY = {
    camera:
    {
      name: 'Camera & Photo',
      cat_id: 20773
    },
    computer:
    {
      name: 'Computers & Accessories',
      cat_id: 4992
    }
  }

  @@resource_type = :computer
  class << self
    def init_categories(resource_type = :computer, level = 3)
      @@resource_type = resource_type

      original_category = ProductCategory.create(name: ORIGINAL_CATEGORY[resource_type][:name] , cat_id: ORIGINAL_CATEGORY[resource_type][:cat_id], parent_cat_id: -1, resource_type: @@resource_type)
      parent_categories = [original_category]

      level.times do
        parent_categories = sub_categories_for_parent_categories parent_categories
      end
    end

    def sub_categories_for_parent_categories(parent_categories)
      next_parent_categories = []

      parent_categories.each do |parent_category|
        sub_categories_of(parent_category)['results'].each do |category|
          next_parent_categories << build_category(category)
          store_category category
        end
      end

      next_parent_categories
    end

    def sub_categories_of(parent_category)
      SEM3.categories_field("parent_cat_id", parent_category.cat_id)
      SEM3.get_categories
    end

    def store_category(category)
      build_category = build_category category
      parent_category = find_by_cat_id build_category.parent_cat_id
      parent_category.sub_categories.create(name: build_category.name, cat_id: build_category.cat_id, resource_type: @@resource_type)
    end

    def build_category(category)
      CategoryStruct.new(category['name'], category['cat_id'].to_i, category['parent_cat_id'].to_i)
    end
  end
end