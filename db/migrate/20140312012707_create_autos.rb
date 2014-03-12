class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :name
      t.string :engine
      t.string :transmission
      t.string :horsepower
      t.string :fueleconomy
      t.string :navigation
      t.string :bodytype
      t.string :image
      
      t.timestamps
    end
  end
end
