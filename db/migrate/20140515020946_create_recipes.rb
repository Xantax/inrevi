class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.references :user, index: true
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
