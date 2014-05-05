class CreateMovieReviews < ActiveRecord::Migration
  def change
    create_table :movie_reviews do |t|
      t.string :title
      t.text :content
      t.reference :user
      t.reference :movie

      t.timestamps
    end
    add_index :movie_reviews, :user
    add_index :movie_reviews, :movie
  end
end
