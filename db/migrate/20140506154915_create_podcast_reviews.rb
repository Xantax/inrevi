class CreatePodcastReviews < ActiveRecord::Migration
  def change
    create_table :podcast_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.boolean :published, default: true
      t.references :user, index: true
      t.references :podcast, index: true

      t.timestamps
    end
  end
end
