class AddMoredetailsToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :website, :string
  end
end
