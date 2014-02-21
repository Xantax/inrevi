class AddUserToPodcastReview < ActiveRecord::Migration
  def change
    add_reference :podcast_reviews, :user, index: true
  end
end
