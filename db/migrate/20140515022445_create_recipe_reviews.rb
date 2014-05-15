class CreateRecipeReviews < ActiveRecord::Migration
  def change
    create_table :recipe_reviews do |t|
      t.text :content
      t.integer :point, default: -1
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
