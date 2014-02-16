class CreatePodcastReviews < ActiveRecord::Migration
  def change
    create_table :podcast_reviews do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
