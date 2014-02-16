class AddCategoryidToPodcastSubCategory < ActiveRecord::Migration
  def change
    add_reference :podcast_sub_categories, :podcast_category, index: true
  end
end
