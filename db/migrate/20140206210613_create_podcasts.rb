class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
