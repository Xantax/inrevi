class CreatePodcastLanguages < ActiveRecord::Migration
  def change
    create_table :podcast_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
