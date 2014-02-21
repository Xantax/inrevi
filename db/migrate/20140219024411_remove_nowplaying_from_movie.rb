class RemoveNowplayingFromMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :now_playing_id, :integer
  end
end
