class RemoveContentFromMovieReviews < ActiveRecord::Migration
  def change
    remove_column :movie_reviews, :content, :string
  end
end
