class RemoveUserFromPodcast < ActiveRecord::Migration
  def change
    remove_reference :podcasts, :user, index: true
  end
end
