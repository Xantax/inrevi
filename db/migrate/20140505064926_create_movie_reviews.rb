class CreateMovieReviews < ActiveRecord::Migration
  def change
    create_table :movie_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.string :movie_imdb
      t.string :movie_title
      t.string :movie_runtime
      t.string :movie_year
      t.string :movie_poster
      t.references :user, index: true
      t.string :movie_id, index: true

      t.timestamps
    end
  end
end
