class CreateDrugReviews < ActiveRecord::Migration
  def change
    create_table :drug_reviews do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.references :drug, index: true

      t.timestamps
    end
  end
end
