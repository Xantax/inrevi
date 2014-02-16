class AddIdsToPodcast < ActiveRecord::Migration
  def change
    add_reference :podcasts, :podcast_category, index: true
    add_reference :podcasts, :podcast_sub_category, index: true
  end
end
