class CreateLocalReviews < ActiveRecord::Migration
  def change
    create_table :local_reviews do |t|
      t.references :user, index: true
      t.references :factual, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
