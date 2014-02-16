class AddNameToPodcastSubCategory < ActiveRecord::Migration
  def change
    add_column :podcast_sub_categories, :name, :string
  end
end
