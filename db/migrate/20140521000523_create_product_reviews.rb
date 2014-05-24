class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.text :content
      t.integer :point, default: -1
      t.references :user, index: true
      t.integer :cat_id
      t.string :productable_id
      t.string :productable_type
      t.integer :upc_code
      t.string :product_name
      t.string :gtins

      t.timestamps
    end
  end
end
