class CreateTechReviews < ActiveRecord::Migration
  def change
    create_table :tech_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.boolean :published, default: true
      t.references :user, index: true
      t.references :tech, index: true

      t.timestamps
    end
  end
end
