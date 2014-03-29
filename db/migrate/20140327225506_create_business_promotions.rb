class CreateBusinessPromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :vote_id
      t.string :place

      t.timestamps
    end
  end
end
