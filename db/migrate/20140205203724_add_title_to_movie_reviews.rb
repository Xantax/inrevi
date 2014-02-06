class AddTitleToMovieReviews < ActiveRecord::Migration
  def change
    add_column :movie_reviews, :title, :string
    add_column :movie_reviews, :content, :string
  end
end
