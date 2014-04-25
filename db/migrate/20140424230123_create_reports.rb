class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :content
      t.belongs_to :reportable, polymorphic: true

      t.timestamps
    end
    add_index :reports, [:reportable_id, :reportable_type]
  end
end
