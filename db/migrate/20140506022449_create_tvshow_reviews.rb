class CreateTvshowReviews < ActiveRecord::Migration
  def change
    create_table :tvshow_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.boolean :published, default: true
      t.integer :tvshow_ident 
      t.string :tvshow_name 
      t.string :tvshow_year
      t.string :tvshow_poster
      t.references :user, index: true
      t.references :tvshow, index: true

      t.timestamps
    end
  end
end
