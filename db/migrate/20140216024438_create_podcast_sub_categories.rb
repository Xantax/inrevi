class CreatePodcastSubCategories < ActiveRecord::Migration
  def change
    create_table :podcast_sub_categories do |t|
      t.references :podcastcategory, index: true

      t.timestamps
    end
  end
end
