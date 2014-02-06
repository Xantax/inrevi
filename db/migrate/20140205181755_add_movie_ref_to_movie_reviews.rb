class AddMovieRefToMovieReviews < ActiveRecord::Migration
  def change
    add_reference :movie_reviews, :movie, index: true
  end
end
