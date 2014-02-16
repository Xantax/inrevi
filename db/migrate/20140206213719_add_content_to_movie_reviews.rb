class AddContentToMovieReviews < ActiveRecord::Migration
  def change
    add_column :movie_reviews, :content, :text
  end
end
