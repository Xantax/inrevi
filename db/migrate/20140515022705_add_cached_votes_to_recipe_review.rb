class AddCachedVotesToRecipeReview < ActiveRecord::Migration
  def self.up
    add_column :recipe_reviews, :cached_votes_total, :integer, :default => 0
    add_column :recipe_reviews, :cached_votes_score, :integer, :default => 0
    add_column :recipe_reviews, :cached_votes_up, :integer, :default => 0
    add_column :recipe_reviews, :cached_votes_down, :integer, :default => 0
    add_column :recipe_reviews, :cached_weighted_score, :integer, :default => 0
    add_index  :recipe_reviews, :cached_votes_total
    add_index  :recipe_reviews, :cached_votes_score
    add_index  :recipe_reviews, :cached_votes_up
    add_index  :recipe_reviews, :cached_votes_down
    add_index  :recipe_reviews, :cached_weighted_score

     #Uncomment this line to force caching of existing votes
    RecipeReview.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :recipe_reviews, :cached_votes_total
    remove_column :recipe_reviews, :cached_votes_score
    remove_column :recipe_reviews, :cached_votes_up
    remove_column :recipe_reviews, :cached_votes_down
    remove_column :recipe_reviews, :cached_weighted_score
  end
end
