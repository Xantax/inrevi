class RemoveDetlinksFromPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :fb, :string
    remove_column :podcasts, :tw, :string
  end
end
