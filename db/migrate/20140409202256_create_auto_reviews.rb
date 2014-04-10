class CreateAutoReviews < ActiveRecord::Migration
  def change
    create_table :auto_reviews do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.references :auto, index: true

      t.timestamps
    end
  end
end