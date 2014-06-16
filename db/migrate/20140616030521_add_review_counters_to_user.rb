class AddReviewCountersToUser < ActiveRecord::Migration
  def change
    add_column :users, :auto_reviews_count, :integer, :default => 0
    add_column :users, :book_reviews_count, :integer, :default => 0
    add_column :users, :drug_reviews_count, :integer, :default => 0
    add_column :users, :fineart_reviews_count, :integer, :default => 0
    add_column :users, :local_reviews_count, :integer, :default => 0
    add_column :users, :movie_reviews_count, :integer, :default => 0
    add_column :users, :podcast_reviews_count, :integer, :default => 0
    add_column :users, :product_reviews_count, :integer, :default => 0
    add_column :users, :recipe_reviews_count, :integer, :default => 0
    add_column :users, :song_reviews_count, :integer, :default => 0
    add_column :users, :tech_reviews_count, :integer, :default => 0
    add_column :users, :tvshow_reviews_count, :integer, :default => 0
  end
end
