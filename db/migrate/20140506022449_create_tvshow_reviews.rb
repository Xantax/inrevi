class CreateTvshowReviews < ActiveRecord::Migration
  def change
    create_table :tvshow_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.string :tvshow_name 
      t.string :tvshow_year
      t.string :tvshow_poster
      t.references :user, index: true
      t.string :tvshow_id, index: true

      t.timestamps
    end
  end
end
