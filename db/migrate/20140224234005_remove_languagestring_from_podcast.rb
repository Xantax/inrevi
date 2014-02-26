class RemoveLanguagestringFromPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :language, :string
  end
end
