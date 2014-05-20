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
    },
    security:
    {
      name: 'Security',
      cat_id: 1124
    },
    television:
    {
      name: 'TV & Video',
      cat_id: 399
    },
    carelectro:
    {
      name: 'Vehicle Electronics',
      cat_id: 18623
    },
    homeaudio:
    {
      name: 'Home Audio',
      cat_id: 8790
    },
    eportable:
    {
      name: 'Portable',
      cat_id: 17761
    },
    emobile:
    {
      name: 'Mobile',
      cat_id: 915
    },
    videogame:
    {
      name: 'Video Games',
      cat_id: 11932
    },
    makeup:
    {
      name: 'Makeup',
      cat_id: 14395
    },
    fragrance:
    {
      name: 'Fragrance',
      cat_id: 4524
    },
    haircare:
    {
      name: 'Hair Care',
      cat_id: 2996
    },
    skincare:
    {
      name: 'Skin Care',
      cat_id: 4796
    },
    bodybath:
    {
      name: 'Body & Bath',
      cat_id: 4581
    },
    grocery:
    {
      name: 'Groceries',
      cat_id: 18203
    },
    jewelry:
    {
      name: 'Jewelry',
      cat_id: 4798
    },
    menclothing:
    {
      name: 'Mens clothing',
      cat_id: 18792
    },
    womenclothing:
    {
      name: 'Womens clothing',
      cat_id: 20214
    },
    menfootwear:
    {
      name: 'Mens footwear',
      cat_id: 21192
    },
    womenfootwear:
    {
      name: 'Womens footwear',
      cat_id: 19486
    },
    healthcare:
    {
      name: 'Healthcare',
      cat_id: 20808
    },
    supplement:
    {
      name: 'Supplements',
      cat_id: 4113
    },
    sexual:
    {
      name: 'Sexual Wellness',
      cat_id: 4860
    },
    personal:
    {
      name: 'Personal',
      cat_id: 21868
    },
    musical:
    {
      name: 'Musical Instruments',
      cat_id: 24271
    },
    sport:
    {
      name: 'Sports',
      cat_id: 2717
    },
    craft:
    {
      name: 'Crafts',
      cat_id: 20717
    },
    toy:
    {
      name: 'Toys',
      cat_id: 16279
    },
    appliance:
    {
      name: 'Appliances',
      cat_id: 18892
    },
    baby:
    {
      name: 'Babies',
      cat_id: 21995
    },
    pet:
    {
      name: 'Pets',
      cat_id: 6411
    },
    tool:
    {
      name: 'Tools',
      cat_id: 21949
    },
    indoor:
    {
      name: 'Indoors',
      cat_id: 12908
    },
    outdoor:
    {
      name: 'Outdoors',
      cat_id: 4702
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