class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :image
      t.text :additionalinfo
      t.references :user, index: true

      t.timestamps
    end
  end
end
