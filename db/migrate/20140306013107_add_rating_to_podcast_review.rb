class AddRatingToPodcastReview < ActiveRecord::Migration
  def change
    add_column :podcast_reviews, :rating, :integer
  end
end
