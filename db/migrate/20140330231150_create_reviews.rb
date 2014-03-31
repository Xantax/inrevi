class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :reviewable, polymorphic: true

      t.timestamps
    end
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
