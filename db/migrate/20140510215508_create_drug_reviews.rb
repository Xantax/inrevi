class CreateDrugReviews < ActiveRecord::Migration
  def change
    create_table :drug_reviews do |t|
      t.text :content
      t.integer :point, default: -1
      t.references :user, index: true
      t.references :drug, index: true

      t.timestamps
    end
  end
end
