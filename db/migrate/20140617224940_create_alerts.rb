class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :user, index: true
      t.text :content

      t.timestamps
    end
  end
end
