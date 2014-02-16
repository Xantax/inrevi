class AddNameToPodcastCategory < ActiveRecord::Migration
  def change
    add_column :podcast_categories, :name, :string
  end
end
