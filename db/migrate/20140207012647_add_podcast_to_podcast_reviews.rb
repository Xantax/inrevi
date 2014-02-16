class AddPodcastToPodcastReviews < ActiveRecord::Migration
  def change
    add_reference :podcast_reviews, :podcast, index: true
  end
end
