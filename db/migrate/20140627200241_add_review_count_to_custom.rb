class AddReviewCountToCustom < ActiveRecord::Migration
  def change
    add_column :autos, :auto_reviews_count, :integer, :default => 0
    add_column :drugs, :drug_reviews_count, :integer, :default => 0
    add_column :finearts, :fineart_reviews_count, :integer, :default => 0
    add_column :podcasts, :podcast_reviews_count, :integer, :default => 0
    add_column :recipes, :recipe_reviews_count, :integer, :default => 0
    add_column :teches, :tech_reviews_count, :integer, :default => 0
    
    add_column :recipes, :ready_time, :integer
    remove_column :users, :friends, :string
  end
end
