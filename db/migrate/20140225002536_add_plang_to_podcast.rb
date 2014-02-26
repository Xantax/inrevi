class AddPlangToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :podcast_language_id, :integer
    add_index :podcasts, :podcast_language_id
  end
end
