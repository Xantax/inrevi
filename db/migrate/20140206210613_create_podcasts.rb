class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :hosts

      t.timestamps
    end
  end
end
