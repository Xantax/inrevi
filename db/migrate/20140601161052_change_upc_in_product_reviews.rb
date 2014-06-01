class ChangeUpcInProductReviews < ActiveRecord::Migration
  def change
    change_column :product_reviews, :upc_code, :integer, limit: 8
  end
end
