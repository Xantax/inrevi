class AddImageToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :image, :string
  end
end
