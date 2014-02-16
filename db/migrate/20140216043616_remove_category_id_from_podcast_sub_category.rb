class RemoveCategoryIdFromPodcastSubCategory < ActiveRecord::Migration
  def change
    remove_column :podcast_sub_categories, :podcastcategory_id, :integer
  end
end
