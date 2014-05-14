class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :name
      t.string :website
      t.references :user, index: true

      t.timestamps
    end
  end
end
