class CreateFinearts < ActiveRecord::Migration
  def change
    create_table :finearts do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
