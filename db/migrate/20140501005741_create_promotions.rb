class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :text
      t.string :link
      t.boolean  :local
      t.boolean  :auto
      t.boolean  :tech
      t.boolean  :book
      t.boolean  :movie
      t.boolean  :music
      t.boolean  :podcast
      t.boolean  :tvshow
      t.boolean  :drug

      t.timestamps
    end
  end
end
