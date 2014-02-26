class AddLangiageidToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :language_id, :integer
  end
end
