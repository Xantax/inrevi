class AddPodidToPodcastSubCategory < ActiveRecord::Migration
  def change
    add_reference :podcast_sub_categories, :podcast, index: true
  end
end
