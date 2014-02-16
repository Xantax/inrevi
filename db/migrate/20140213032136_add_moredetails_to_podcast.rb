class AddMoredetailsToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :language, :string
    add_column :podcasts, :website, :string
    add_column :podcasts, :fb, :string
    add_column :podcasts, :tw, :string
    add_column :podcasts, :links, :string
  end
end
