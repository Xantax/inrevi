class RemoveLidFromPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :language_id, :integer
  end
end
