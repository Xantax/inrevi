class CreateTechReviews < ActiveRecord::Migration
  def change
    create_table :tech_reviews do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.references :tech, index: true

      t.timestamps
    end
  end
end