class AddUserToMovieReview < ActiveRecord::Migration
  def change
    add_reference :movie_reviews, :user, index: true
  end
end
