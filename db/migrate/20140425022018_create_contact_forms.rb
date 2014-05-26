class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.string :category
      t.text :message
      t.boolean :read
      t.references :user, index: true

      t.timestamps
    end
  end
end
