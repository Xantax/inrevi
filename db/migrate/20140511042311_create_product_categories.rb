class CreateProductCategories < ActiveRecord::Migration
def change
    create_table :product_categories do |t|
      t.string :name
      t.integer :parent_cat_id
      t.integer :cat_id
      t.string :resource_type

      t.timestamps
    end
  end
end
