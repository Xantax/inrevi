class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.integer :factual_id
      t.timestamps
    end
  end
end
