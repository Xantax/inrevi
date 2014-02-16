class CreatePodcastCategories < ActiveRecord::Migration
  def change
    create_table :podcast_categories do |t|

      t.timestamps
    end
  end
end
