class CreateBusinessPromotions < ActiveRecord::Migration
  def change
    create_table :local_promotions do |t|
      t.integer :local_vote_id
      t.string :place

      t.timestamps
    end
  end
end
