class CreateSongReviews < ActiveRecord::Migration
  def change
    create_table :song_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.string :song_name
      t.string :song_artists
      t.string :song_album
      t.string :song_isrc
      t.references :user, index: true
      t.string :song_id

      t.timestamps
    end
  end
end
