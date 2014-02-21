class AddNowplayingToMovieReview < ActiveRecord::Migration
  def change
    add_column :movie_reviews, :now_playing_id, :integer
  end
end
