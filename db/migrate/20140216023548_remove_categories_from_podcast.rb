class RemoveCategoriesFromPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :category_id, :integer
  end
end
