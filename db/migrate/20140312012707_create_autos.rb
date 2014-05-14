class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :name
      t.string :image
      t.text :additionalinfo
      t.string :category
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
