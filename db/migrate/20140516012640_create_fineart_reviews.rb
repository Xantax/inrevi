class CreateFineartReviews < ActiveRecord::Migration
  def change
    create_table :fineart_reviews do |t|
      t.text :content
      t.integer :point, default: -1
      t.references :user, index: true
      t.references :fineart, index: true

      t.timestamps
    end
  end
end
