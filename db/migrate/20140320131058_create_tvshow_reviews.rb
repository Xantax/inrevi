class CreateTvshowReviews < ActiveRecord::Migration
  def change
    create_table :tvshow_reviews do |t|
      t.references :tvshow, index: true
      t.references :user, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
